#!/usr/bin/env python

import json
import sys
import memcache
from cgi import parse_qs, escape

try:
   import cPickle as pickle
except:
   import pickle


def get_sites():
    """
    Return a list with the names of the sites that the osg flock host can submit to
    """
    mc = memcache.Client(['mc.mwt2.org:11211'], debug=0)
    site_list = mc.get('osg_site_list')
    return json.dumps(site_list)

def get_site_modulelist(query_dict, top = None):
    """
    Unpickle and give up to the top 20 modules used per site
    """
    mc = memcache.Client(['mc.mwt2.org:11211'], debug=0)
    module_info = mc.get('site_module_list')
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
    if module_info is None:
        return ""
    site_module_location = {}
    for site in module_info:
        site_module_location[site] = module_info[site][0:top]
    return json.dumps(site_module_location)

def get_top_modules(query_dict, top = None):
    """
    Return a json representation of the top 10 modules used in the last week
    """
    mc = memcache.Client(['mc.mwt2.org:11211'], debug=0)
    module_info = mc.get('sorted_module_list')

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
    if module_info is None:
        return ""
    return json.dumps(module_info)
    

def get_top_sites(query_dict, top = None):
    """
    Return a json representation of the top 10 sites used in the last week
    """
    mc = memcache.Client(['mc.mwt2.org:11211'], debug=0)
    site_info = mc.get('sorted_site_list')

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
    if site_info is None:
        return ""
    return json.dumps(site_info)

          
def application(environ, start_response):
    """ Get GET parameters and return appropriate JSON or JSONP string"""

    query_dict = parse_qs(environ['QUERY_STRING'])
    jsonfunc= None
    if 'function' in query_dict:
        function = escape(query_dict['function'][0]).lower()
    if 'jsonfunc' in query_dict:
        jsonfunc = escape(query_dict['jsonfunc'][0])

    # dispatch on function_name
    if function == 'site_modulelist':
        json_string = get_site_modulelist(query_dict)
    elif function == 'topmodules':
        json_string = get_top_modules(query_dict)
    elif function == 'topsites':
        json_string = get_top_sites(query_dict)
    elif function == 'moduleloads':
        json_string = get_moduleloads(query_dict)
    elif function == 'get_sites':
        json_string = get_sites()

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
    sites = application({'QUERY_STRING' : "function=%s" % sys.argv[1]}, lambda x,y: str(x)+str(y) )

    sys.stdout.write("%s\n" % sites)

