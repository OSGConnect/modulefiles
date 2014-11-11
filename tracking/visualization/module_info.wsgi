#!/usr/bin/env python

import json
import sys
import datetime
from cgi import escape
from urlparse import parse_qs

try:
    import cPickle as pickle
except:
    import pickle

import redis
import pymongo

def get_sites():
    """
    Return a list with the names of the sites that the osg flock host can submit to
    """
    rc = redis.Redis('db.mwt2.org')
    site_list = pickle.loads(rc.get('osg_site_list'))
    return json.dumps(site_list)

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
    week_start = start_date - datetime.timedelta(days=start_date.isoweekday())
    return week_start

def get_mongodb_client():
    """
    Return a mongodb client instance setup to access the correct database
    """
    db_client = pymongo.MongoClient(host='db.mwt2.org', port=27017)
    db = db_client.module_usage
    return db

def get_site_modulelist(query_dict, start_date=None, top=None):
    """
    Unpickle and give up to the top N modules used per site
    """
    db = get_mongodb_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)
    if top not in query_dict:
        top = 10
    else:
        top = escape(query_dict['top'][0])
        if top is None:
            top = 10
        else:
            try:
                top = int(top)
            except ValueError:
                top = 10

    site_list = {}
    for record in db.weekly_count.find({"date": start_date},
                                       sort=('count', -1)):
        site = record['site']
        if site not in site_list:
            site_list[site] = []
        if len(site_list[site]) < top:
            site_list[site].append(record['module'])
    return json.dumps(site_list)

def get_site_modulelist(query_dict, start_date=None, top=None):
    """
    Unpickle and give up to the top N modules used per site
    """
    db = get_mongodb_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)
    if top not in query_dict:
        top = 10
    else:
        top = escape(query_dict['top'][0])
        if top is None:
            top = 10
        else:
            try:
                top = int(top)
            except ValueError:
                top = 10

    site_list = {}
    for record in db.weekly_count.find({"date": start_date},
                                       sort=('count', -1)):
        site = record['site']
        if site not in site_list:
            site_list[site] = []
        if len(site_list[site]) < top:
            site_list[site].append(record['module'])
    return json.dumps(site_list)

def get_top_modules(query_dict, start_date, top=None):
    """
    Return a json representation of the top N modules used in the last week
    """
    db = get_mongodb_client()
    if start_date is None:
        start_date = get_week_start()
    else:
        start_date = get_week_start(start_date)
    if top not in query_dict:
        top = 10
    else:
        top = escape(query_dict['top'][0])
        if top is None:
            top = 10
        else:
            try:
                top = int(top)
            except ValueError:
                top = 10

    module_list = {}

    for record in db.weekly_count.aggregate([{"$match": {"date": start_date.isoformat()}},
                                             {"$group": {"_id": "$module",
                                                         "sum": {"$sum": 1}}},
                                             {"$sort": {"sum": -1}},
                                             {"$limit": top}])['result']:
        module_list[record['_id']] = record['sum']
    return json.dumps(module_list)
    

def get_top_sites(query_dict, start_date, top=None):
    """
    Return a json representation of the top N sites used in the last week
    """
    db = get_mongodb_client()
    if top not in query_dict:
        top = 10
    else:
        top = escape(query_dict['top'][0])
        if top is None:
            top = 10
        else:
            try:
                top = int(top)
            except ValueError:
                top = 10
    site_list = {}
    for record in db.weekly_count.aggregate([{"$match": {"date": start_date.isoformat()}},
                                             {"$group": {"_id": "$site",
                                                         "sum": {"$sum": 1}}},
                                             {"$sort": {"sum": -1}},
                                             {"$limit": top}])['result']:
        site_list[record['_id']] = record['sum']
    return json.dumps(site_list)

def get_moduleloads(query_dict, start_date, top=None):
    """
    Return a json representation of the number of times modules where used
    in the week containing start_date
    """
    db = get_mongodb_client()
    if top not in query_dict:
        top = 10
    else:
        top = escape(query_dict['top'][0])
        if top is None:
            top = 10
        else:
            try:
                top = int(top)
            except ValueError:
                top = 10
    load_list = {}
    for record in db.weekly_count.aggregate([{"$match": {"date": start_date.isoformat()}},
                                             {"$group": {"_id": "$date",
                                                         "sum": {"$sum": 1}}},
                                             {"$sort": {"sum": -1}},
                                             {"$limit": top}])['result']:
        load_list[record['_id']] = record['sum']
    return json.dumps(load_list)


def application(environ, start_response):
    """ Get GET parameters and return appropriate JSON or JSONP string"""

    query_dict = parse_qs(environ['QUERY_STRING'])
    jsonfunc = None
    if 'function' in query_dict:
        function = escape(query_dict['function'][0]).lower()
    if 'jsonfunc' in query_dict:
        jsonfunc = escape(query_dict['jsonfunc'][0])

    start_date = datetime.date.today()
    week_start = start_date - datetime.timedelta(days=start_date.isoweekday())
    # dispatch on function_name
    if function == 'site_modulelist':
        json_string = get_site_modulelist(query_dict, week_start)
    elif function == 'topmodules':
        json_string = get_top_modules(query_dict, week_start)
    elif function == 'topsites':
        json_string = get_top_sites(query_dict, week_start)
    elif function == 'moduleloads':
        json_string = get_moduleloads(query_dict, week_start)
    elif function == 'get_sites':
        json_string = get_sites()
    else:
        json_string = ''

    status = '200 OK'
    response_body = ""
    if jsonfunc is not None:
        response_body = jsonfunc + "("
    response_body += json_string
    if jsonfunc is not None:
        response_body += ")"
    response_headers = [('Content-Type', 'text/html'),
                        ('Content-Length', str(len(response_body)))]
    start_response(status, response_headers)
    return [response_body]

if __name__ == "__main__":
    sites = application({'QUERY_STRING': "function=%s" % sys.argv[1]}, lambda x, y: str(x)+str(y))
    sys.stdout.write("%s\n" % sites)

