#!/usr/bin/env python

import csv
try:
   import cPickle as pickle
except:
   import pickle

import redis
import htcondor

SITE_INFO_CSV = "./site_list"
SITE_CORRESPONDENCE_CSV = "./site_translations"

def get_site_info(redis_client):
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
        pass
    redis_client.set('osg_site_info', pickle.dumps(site_info))

def get_site_names(redis_client):
    """
    Get site name translations from csv file and return as a dictionary containing a
    list with glidein resource names -> osg site name 
    """
    site_info  = {}
    f = open(SITE_CORRESPONDENCE_CSV, 'rb')
    reader = csv.reader(f)
    try:
        for row in reader:
            site_info[row[0]] = row[1]
    except csv.Error:
        pass
    redis_client.set('osg_site_name_conversions', pickle.dumps(site_info))

def get_sites(redis_client, pool = 'gfactory-1.t2.ucsd.edu'):
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
    site_info = pickle.loads(redis_client.get('osg_site_info'))
    delete_sites = []
    for site in site_list:
        if site in site_info:
            site_list[site] = site_info[site]
        else:
            delete_sites.append(site)
    for site in delete_sites:
        del site_list[site]
    redis_client.set('osg_site_list', pickle.dumps(site_list))

if __name__ ==  '__main__':
    redis_client = redis.Redis(host='db.mwt2.org')
    get_site_info(redis_client)
    get_site_names(redis_client)
    get_sites(redis_client)
