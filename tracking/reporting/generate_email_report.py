#!/usr/bin/env python

import sys
import datetime
import argparse

import pymongo

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
    week_day  = start_date.isoweekday()
    if week_day != 7 and week_day != 0:
        week_start = start_date - datetime.timedelta(days=week_day)
    else:
        week_start = start_date
    print start_date
    print week_start
    return week_start

def get_mongodb_client():
    """
    Return a mongodb client instance setup to access the correct database
    """
    db_client = pymongo.MongoClient(host='db.mwt2.org', port=27017)
    db = db_client.module_usage
    return db

def get_site_modulelist(start_date=None, top=None):
    """
    Give up to the top N modules used per site
    """
    db = get_mongodb_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)

    if top is None:
        top = 10

    site_list = {}
    for record in db.weekly_count.find({"date": start_date.isoformat()},
                                       sort=[('count', -1)]):
        site = record['site']
        if site not in site_list:
            site_list[site] = []
        if len(site_list[site]) < top:
            site_list[site].append((record['module'], record['count']))
    return site_list

def get_top_modules(start_date, top=None):
    """
    Return a json representation of the top N modules used in the last week
    """
    db = get_mongodb_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)

    if top is None:
        top = 10

    module_list = []

    for record in db.weekly_count.aggregate([{"$match": {"date": start_date.isoformat()}},
                                             {"$group": {"_id": "$module",
                                                         "sum": {"$sum": 1}}},
                                             {"$sort": {"sum": -1}},
                                             {"$limit": top}])['result']:

        module_list.append((record['_id'], record['sum']))
    return module_list


def get_top_sites(start_date, top=None):
    """
    Return a json representation of the top N sites used in the last week
    """
    db = get_mongodb_client()
    if top is None:
        top = 10
    site_list = []
    for record in db.weekly_count.aggregate([{"$match": {"date": start_date.isoformat()}},
                                             {"$group": {"_id": "$site",
                                                         "sum": {"$sum": 1}}},
                                             {"$sort": {"sum": -1}},
                                             {"$limit": top}])['result']:
        site_list.append((record['_id'], record['sum']))
    return site_list

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

def generate_report(start_date, end_date, email=False):
    """
    Generate a report of module usage over the week and optionally email it

    :param email: boolean that indicates whether to email report or not
    :param start_date: timedate.date object giving the date to start from
    :param end_date: timedate.date object giving the date to end on
    :return: None
    """
    start_date = get_week_start()
    report_text = ""
    report_text += "{0:^80}\n".format("Modules usage report for week of " +
                                      start_date.isoformat())

    report_text += "{0:-^80}\n".format(' Top 10 modules used')
    report_text += "\n\n"
    report_text += "|{0:^30}|{1:^30}|".format('Module', '# of times used')
    module_list = get_top_modules(start_date)
    for module, count in module_list:
        report_text += "|{0:^30}|{1:^30}|".format(module, count)
    report_text += "\n\n"

    report_text += "{0:-^80}\n".format(' Top 10 sites used')
    report_text += "\n\n"
    report_text += "|{0:^30}|{1:^30}|".format('Site', '# of times used')
    site_list = get_top_sites(start_date)
    for site, count in site_list:
        report_text += "|{0:^30}|{1:^30}|".format(site, count)
    report_text += "\n\n"


    report_text += "{0:-^80}\n".format(' Top 10 modules used at each site')
    report_text += "\n\n"
    report_text += "|{0:^20}|{1:^20}|{0:^20}|".format('Site', 'Module', '# of times used')
    site_module_list = get_site_modulelist(start_date)
    sites = site_module_list.keys()
    sites.sort()
    for site in sites:
        for module, count in sites[site]:
            report_text += "|{0:^20}|{1:^20}|{0:^20}|".format(site, module, count)
    report_text += "\n\n"

    if email:
        pass
    else:
        sys.stdout.write(report_text)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Create a condor submit file for processing job log data.')
    parser.add_argument('--start-date', dest='start_date', default=datetime.date.today().isoformat(),
                        help='Date to start processing logs from')
    parser.add_argument('--end-date', dest='end_date', default=datetime.date.today().isoformat(),
                        help='Date to stop processing logs')
    parser.add_argument('--email', dest='email', default=False,
                        type=bool,help='Date to stop processing logs')
    args = parser.parse_args(sys.argv[1:])
    args.start_date = parse_date(start_date, end_date, args.start_date)
    args.end_date = parse_date(args.end_date)

    generate_report(email=args.email)


