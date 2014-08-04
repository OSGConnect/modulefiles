#!/usr/bin/env python
import csv
import json
import sys
from cgi import parse_qs, escape

import memcache


def get_sites():
    """
    Return a list with the names of the sites that the osg flock host can submit to
    """
    mc = memcache.Client(['mc.mwt2.org:11211'], debug=0)
    site_list = mc.get('osg_site_list')
    return site_list
    

def application(environ, start_response):
    """ Get GET parameters and return appropriate JSON or JSONP string"""

    query_dict = parse_qs(environ['QUERY_STRING'])
    site = None
    function = None
    if 'site' in query_dict:
        site = escape(query_dict['site'][0])
    if 'function' in query_dict:
        function = escape(query_dict['function'][0])
    site_list = get_sites()
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
    sites = get_sites()

    sys.stdout.write("%s\n" % sites)
