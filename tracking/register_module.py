#!/usr/bin/env python

from cgi import parse_qs, escape

import pymongo

def get_db_client():
    """ Instantiate DB client and pass connection back """

    client = pymongo.MongoClient(host='mc.mwt2.org', port=27017)
    return client.module_usage

def log_usage(environ, start_response):
    """ Get GET parameters and put into mongoDB"""

    query_dict = parse_qs(environ['QUERY_STRING'])
    record = { 'host' : escape(d.get('host', [''])), 
               'user' : escape(d.get('user', [''])),
               'module' : escape(d.get('module', [''])),
               'site' : escape(d.get('site', ['']))}

    db = get_db_client()        
    try:
        db.insert(record)
    except pymongo.errors.OperationFailure, e:
        sys.stderr.write("Error %s while recording %s" % (e, record))

if __name__ == '__main__':
    from wsgiref.simple_server import make_server
    srv = make_server('localhost', 8080, log_usage)
    srv.serve_forever()
