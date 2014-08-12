#!/usr/bin/env python

import json
import sys
import memcache
from cgi import parse_qs, escape

try:
   import cPickle as pickle
except:
   import pickle


def get_site_modulelist(top = 10):
    """
    Unpickle and give up to the top 20     
    """
    mc = memcache.Client(['mc.mwt2.org:11211'], debug=0)
    module_info = mc.get('site_module_list')
    site_module_location = {}
    for site in module_info:
        site_module_location[site] = module_info[site][0:top]
    return site_module_location
         
          
def application(environ, start_response):
    """ Get GET parameters and return appropriate JSON or JSONP string"""

    query_dict = parse_qs(environ['QUERY_STRING'])
    site = None
    function = None
    if 'site' in query_dict:
        site = escape(query_dict['site'][0])
    if 'function' in query_dict:
        function = escape(query_dict['function'][0])
    if 'top' in query_dict:
        top = escape(query_dict['top'][0])
        try:
           top = int(top)
        except ValueError:
           pass
    else:
        top = 10
    site_list = get_site_modulelist(top)
    status = '200 OK'
    response_body = ""
    if function is not None:
        response_body = function+"("
    if site is None:
        response_body += json.dumps(site_list)
    else:
        response_body += json.dumps({ site : site_list[site] } )
    if function is not None:
        response_body += ")"


    response_headers = [('Content-Type', 'text/html'),
                        ('Content-Length', str(len(response_body)))]
    start_response(status, response_headers)
    return [response_body]

if __name__ == "__main__":
    sites = get_site_modulelist()

    sys.stdout.write("%s\n" % sites)

