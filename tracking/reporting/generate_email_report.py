#!/usr/bin/env python

import sys
import datetime
import argparse
import smtplib
import email
import email.mime.text

import elasticsearch
import elasticsearch.helpers


ES_NODES = ['uct2-es-head.mwt2.org:9200', 'uct2-es-door.mwt2.org:9200']
TZ_NAME = "UTC"
INDEX_BASE_NAME = "oasis-module-usage"
REPORT_EMAIL = ["sthapa@ci.uchicago.edu"]
EMAIL_SERVER = "mail.ci-connect.net"


def parse_date(date=None):
    """
    Parse a string in YYYY-MM-DD format into a datetime.date object.
    Throws ValueError if input is invalid

    :param date: string in YYYY-MM-DD format giving a date
    :return: a datetime.date object corresponding to the date given
    """
    if date is None:
        raise ValueError
    fields = date.split('-')
    if len(fields) != 3:
        raise ValueError
    return datetime.date(year=int(fields[0]),
                         month=int(fields[1]),
                         day=int(fields[2]))


def get_week_start(date=None):
    """
    Return a datetime corresponding to the start of the week for the given date
    E.g. if tuesday 7/8/2014 is passed in, monday 7/7/2014 00:00:00 would
    be returned
    """
    if date is None:
        start_date = datetime.date.today()
    else:
        start_date = date
    week_day = start_date.isoweekday()
    if week_day not in [0, 7]:
        week_start = start_date - datetime.timedelta(days=week_day)
    else:
        week_start = start_date
    return week_start


def get_indices(date=None):
    """
    Get the relevant indices for a weekly report using the specified date

    :param date: specifies the week the report will be on
    :return: a list with the indices that should be used
    """

    start_date = get_week_start()
    end_date = start_date + datetime.timedelta(days=7)
    if start_date.month != end_date.month:
        index_list = ["{0}-{1}-{2:0>2}".format(INDEX_BASE_NAME,
                                               start_date.year,
                                               start_date.month),
                      "{0}-{1}-{2:0>2}".format(INDEX_BASE_NAME,
                                               end_date.year,
                                               end_date.month)]
    else:
        index_list = ["{0}-{1}-{2:0>2}".format(INDEX_BASE_NAME,
                                               start_date.year,
                                               start_date.month)]
    es = get_es_client()
    index_client = elasticsearch.client.IndicesClient(es)
    validated_indices = []
    for index in index_list:
        if index_client.exists(index=index):
            validated_indices.append(index)
    return validated_indices


def get_user_modulelist(start_date=None, top=None):
    """
    Give up to the top N modules used per user
    """
    db = get_mongodb_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)

    if top is None:
        top = 10

    user_list = {}
    for record in db.weekly_count.find({"date": start_date.isoformat()},
                                       sort=[('count', -1)]):
        user = record['user']
        if user not in user_list:
            user_list[user] = []
        if len(user_list[user]) < top:
            user_list[user].append((record['module'], record['count']))
    return user_list


def get_project_modulelist(start_date=None, top=None):
    """
    Give up to the top N modules used per project
    """
    db = get_es_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)

    if top is None:
        top = 10
    end_date = start_date + datetime.timedelta(days=7)
    indices = ",".join(get_indices(start_date))
    query = {"query": {
                "filtered": {
                    "filter": {
                        "range": {
                            "@timestamp": {
                                "gte": start_date.isoformat(),
                                "lt": end_date.isoformat()}}}}},
             "size": 0,
             "aggs": {
                 "projects": {
                     "terms": {
                         "field": "project",
                         "size": 50},
                     "aggs": {
                        "modules": {
                            "terms": {
                                "field": "module",
                                "size": top}}}}}}
    project_list = []
    results = db.search(body=query, size=0, index=indices)
    doc_count = results['hits']['total']
    if doc_count == 0:
        return project_list

    for record in results['aggregations']['projects']['buckets']:
        project_name = record['key']
        for x in record['modules']['buckets']:
            project_list.append((project_name, x['key'], x['doc_count']))
    return project_list


def get_top_modules(start_date, top=None):
    """
    Return a json representation of the top N modules used in the last week
    """
    db = get_es_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)

    if top is None:
        top = 10
    end_date = start_date + datetime.timedelta(days=7)
    indices = ",".join(get_indices(start_date))
    query = {"query": {
                "filtered": {
                    "filter": {
                        "range": {
                            "@timestamp": {
                                "gte": start_date.isoformat(),
                                "lt": end_date.isoformat()}}}}},
             "size": 0,
             "aggs": {
                 "modules":
                     {"terms":
                         {"field": "module",
                          "size": top}}}}

    module_list = []
    results = db.search(body=query, size=0, index=indices)
    doc_count = results['hits']['total']
    if doc_count == 0:
        return module_list

    for record in results['aggregations']['modules']['buckets']:
        module_list.append((record['key'], record['doc_count']))
    return module_list


def get_moduleloads(start_date, top=None):
    """
    Return a json representation of the number of times modules where used
    in the week containing start_date
    """
    db = get_mongodb_client()
    if top is None:
        top = 10
    return db.weekly_count.aggregate([{"$match": {"date": start_date.isoformat()}},
                                      {"$group": {"_id": "$date",
                                                         "sum": {"$sum": 1}}},
                                      {"$sort": {"sum": -1}},
                                      {"$limit": top}])['result']['sum']


def generate_report(start_date):
    """
    Generate a report of module usage over the week and optionally email it

    :param start_date: timedate.date object giving the date to start from
    :return: None
    """
    start_date = get_week_start(start_date)
    report_text = ""
    report_text += "{0:^80}\n".format("Modules usage report for week of " +
                                      start_date.isoformat())

    report_text += "{0:-^80}\n".format(' Top 10 modules used')
    report_text += "\n\n"
    report_text += "|{0:^30}|{1:^30}|\n".format('Module', '# of times used')
    module_list = get_top_modules(start_date)
    for module, count in module_list:
        report_text += "|{0:^30}|{1:^30}|\n".format(module, count)
    report_text += "\n\n"

    # report_text += "{0:-^80}\n".format(' Top 10 sites used')
    # report_text += "\n\n"
    # report_text += "|{0:^30}|{1:^30}|\n".format('Site', '# of times used')
    # site_list = get_top_sites(start_date)
    # for site, count in site_list:
    #     report_text += "|{0:^30}|{1:^30}|\n".format(site, count)
    # report_text += "\n\n"

    report_text += "{0:-^80}\n".format(' Top 10 modules used by each project')
    report_text += "\n\n"
    report_text += "|{0:^20}|{1:^20}|{2:^20}|\n".format('Project', 'Module', '# of times used')
    project_module_list = get_project_modulelist(start_date)
    for (project, module, count) in project_module_list:
        report_text += "|{0:^20}|{1:^20}|{2:^20}|\n".format(project, module, count)
    report_text += "\n\n"

    report_text += "\n\n"

    return report_text


def send_email(email_body, recipient=REPORT_EMAIL, server=EMAIL_SERVER):
    """
    Send email based on text given in email_body

    :param email_body: email body
    :param recipient: list of email addresses to send email to
    :param server: SMTP server to use
    :return: No return
    """
    msg = email.mime.text.MIMEText(email_body)
    msg['Subject'] = 'Weekly module usage report'
    msg['From'] = 'sthapa@ci.uchicago.edu'
    to_addresses = ",".join(recipient)
    msg['To'] = to_addresses
    server_handle = smtplib.SMTP(server)
    server_handle.sendmail('sthapa@ci.uchicago.edu', to_addresses, msg.as_string())
    server_handle.quit()

def get_es_client():
    """ Instantiate DB client and pass connection back """
    return elasticsearch.Elasticsearch(hosts=ES_NODES,
                                       retry_on_timeout=True,
                                       max_retries=10,
                                       timeout=300)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Create a report of module usage for given week')
    parser.add_argument('--start-date', dest='start_date', default=datetime.date.today().isoformat(),
                        help='Date specifying ISO week that the report should be on')
    parser.add_argument('--email', dest='email', default=False,
                        type=bool, help='Email address to send report to')
    args = parser.parse_args(sys.argv[1:])
    args.start_date = parse_date(args.start_date)

    report = generate_report(args.start_date)
    if args.email:
        send_email(report)
    else:
        sys.stdout.write(report)
    sys.exit(0)
