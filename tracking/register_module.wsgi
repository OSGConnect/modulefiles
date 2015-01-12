#!/usr/bin/env python

from cgi import parse_qs, escape
import time
import sys


import pymongo


def get_db_client():
    """ Instantiate DB client and pass connection back """

    client = pymongo.MongoClient(host='db.mwt2.org', port=27017)
    return client.module_usage


def application(environ, start_response):
    """ Get GET parameters and put into mongoDB"""

    query_dict = parse_qs(environ['QUERY_STRING'])
    record = {}
    if 'host' in query_dict:
        record['host'] = escape(query_dict['host'][0])
    else:
        record['host'] = ''
    if 'user' in query_dict:
        record['user'] = escape(query_dict['user'][0])
    else:
        record['user'] = ''
    if 'project' in query_dict:
        record['project'] = escape(query_dict['project'][0])
    else:
        record['project'] = ''
    if 'module' in query_dict:
        record['module'] = escape(query_dict['module'][0])
    else:
        record['module'] = ''
    if 'site' in query_dict:
        record['site'] = escape(query_dict['site'][0])
    else:
        record['site'] = ''
    if record['module'] == '' or record['site'] == '':
        status = '200 OK'
        response_body = 'No record to insert!'
        response_headers = [('Content-Type', 'text/html'),
                            ('Content-Length', str(len(response_body)))]
        start_response(status, response_headers)
        return [response_body]
    if record['site'] == 'UNAVAILABLE' and 'uc3-' in record['host']:
        record['site'] = 'UC3'
    record['date'] = time.time()
    # response_body = 'Record inserted:\n{0}\n'.format(record)
    response_body = 'Record inserted'
    db = get_db_client()        
    try:
        db.usage.insert(record)
    except pymongo.errors.OperationFailure, e:
        response_body = "Error %s while recording %s" % (e, record)
        sys.stderr.write(response_body)
    status = '200 OK'
    response_headers = [('Content-Type', 'text/html'),
                        ('Content-Length', str(len(response_body)))]
    start_response(status, response_headers)
    print response_body
    return [response_body]

if __name__ == '__main__':
    from wsgiref.simple_server import make_server
    srv = make_server('login.osgconnect.net', 8080, application)
    srv.serve_forever()
