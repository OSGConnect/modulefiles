#!/usr/bin/env python
import csv
import json
import sys
from cgi import parse_qs, escape

import htcondor


SITE_INFO_CSV = "./site_list"

def get_site_info():
    """
    Get site info from csv file and return as a dictionary containing a 
    list with lat/long for each site
    """
    site_info  = {}
    f = open(SITE_INFO_CSV, 'rb')
    reader = csv.reader(f)
    try:
        for row in reader:
            site_name = row[0]
            location = [float(row[1]), float(row[2])]
            site_info[site_name] = location
    except csv.Error:
        return site_info
    return site_info

def get_sites(pool = 'gfactory-1.t2.ucsd.edu'):
    """
    Return a list with the names of the sites that the osg flock host can submit to
    """
    pool = htcondor.Collector(pool)
    ads = pool.query(htcondor.AdTypes.Any, 'StringListMember("OSGVO", GLIDEIN_Supported_VOs) || '
                                           'StringListMember("OSGVO_MULTICORE", GLIDEIN_Supported_VOs) || '
                                           'StringListMember("OSGVO_HTPC", GLIDEIN_Supported_VOs)')
    site_list = {}
    for ad in ads:
        site_list[ad['GLIDEIN_ResourceName']] = []
    site_info = get_site_info()
    delete_sites = []
    for site in site_list:
        if site in site_info:
            site_list[site] = site_info[site]
        else:
            delete_sites.append(site)
    for site in delete_sites:
        del site_list[site]
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
