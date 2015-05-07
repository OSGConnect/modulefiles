#!/usr/bin/env python

import datetime
import pytz
import json
import urlparse
import argparse
from wsgiref.simple_server import make_server
import socket
import sys

import redis

REDIS_SERVER = 'db.mwt2.org'
REDIS_CHANNEL = 'module-usage'

TIMEZONE = "US/Central"

SITE_IPS = {"AGLT2": "141.211.43.122",
            "BNL-ATLAS": "130.199.185.6",
            "BU_ATLAS_Tier2": "192.5.207.233",
            "cinvestav": "148.247.182.124",
            "CIT_CMS_T2": "192.84.86.121",
            "Crane": "129.93.227.115",
            "FLTECH": "163.118.42.1",
            "FNAL_FERMIGRID": "131.225.153.157",
            "GLOW": "144.92.180.20",
            "GridUNESP_CENTRAL": "200.145.46.35",
            "GROW-PROD": "128.255.88.50",
            "MIT_CMS": "18.12.1.31",
            "MWT2": "192.170.227.157",
            "Nebraska": "129.93.239.129",
            "NUMEP-OSG": "129.105.61.123",
            "NWICG_NDCMS": "129.74.85.4",
            "NYSGRID-CCR-U2": "128.205.41.87",
            "NYSGRID_CORNELL_NYS1": "128.84.3.204",
            "Purdue-Hadoop": "128.211.143.112",
            "Sandhills": "129.93.244.213",
            "SMU_HPC": "129.119.97.202",
            "SMU_PHY": "129.119.200.168",
            "SPRACE": "200.136.80.19",
            "SWT2_CPB": "129.107.255.13",
            "TTU-ANTAEUS": "129.118.104.6",
            "Tusker": "129.93.227.123",
            "UCD": "128.120.80.17",
            "UConn-OSG": "137.99.79.133",
            "UCSDT2": "169.228.130.102",
            "USCMS-FNAL-WC1": "131.225.205.23",
            "UTA_SWT2": "129.107.255.5",
            "VT_OSG": "198.82.152.147"}


def get_redis_client():
    """
    Get a redis client instance and return it

    :return: a redis client instance or None if failure occurs
    """
    return redis.StrictRedis(REDIS_SERVER)


def publish_record(record, channel, redis_client):
    """
    Publishes a record to a Redis pub/sub channel

    :param record: dictionary representing record to publish
    :param redis_client: a redis client instance to use
    :return: None
    """
    if not redis_client or not channel:
        return
    redis_client.publish(channel, json.dumps(record))
    return


def application(environ, start_response):
    """
    Get parameters from GET request and publish to redis channel

    :param environ: dictionary with environment variables (See PEP 333)
    :param start_response: callable function to handle responses (see PEP 333)
    :return: a list with the response_body to return to client
    """

    query_dict = urlparse.parse_qs(environ['QUERY_STRING'])
    record = {}
    if 'host' in query_dict:
        record['host'] = query_dict['host'][0]
    else:
        record['host'] = ''
    if 'user' in query_dict:
        record['user'] = query_dict['user'][0]
    else:
        record['user'] = ''
    if 'project' in query_dict:
        record['project'] = query_dict['project'][0]
    else:
        record['project'] = ''
    if 'module' in query_dict:
        record['module'] = query_dict['module'][0]
    else:
        record['module'] = ''
    if 'site' in query_dict:
        record['site'] = query_dict['site'][0]
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
    timezone = pytz.timezone(TIMEZONE)
    record['date'] = timezone.localize(datetime.datetime.now()).isoformat()
    if 'HTTP_X_FORWARDED_FOR' in environ:
        record['ip'] = environ['HTTP_X_FORWARDED_FOR'].split(',')[-1].strip()
    elif 'REMOTE_ADDR' in environ:
        record['ip'] = environ['REMOTE_ADDR']
    else:
        record['ip'] = lookup_site_ip(record['site'])
    if 'ip' in record and record['site'] in ('UNAVAILABLE', ''):
        if record['ip'].startswith('192.170.227'):
            record['site'] = 'UC3'
    # response_body = 'Record inserted:\n{0}\n'.format(record)
    response_body = 'Record inserted'
    rc = get_redis_client()
    publish_record(record, REDIS_CHANNEL, rc)
    status = '200 OK'
    response_headers = [('Content-Type', 'text/html'),
                        ('Content-Length', str(len(response_body)))]
    start_response(status, response_headers)
    print response_body
    return [response_body]


def lookup_site_ip(site_name):
    """
    Return the ip address associated with a given site

    :param site_name: string with name of site (should be in OIM)
    :return: a string with ip address associated with site
    """

    if not site_name or site_name not in SITE_IPS:
        return "0.0.0.0"
    else:
        return SITE_IPS[site_name]




if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Parse GET from module '
                                                 'sitehook and publish to Redis')
    parser.add_argument('--host', dest='hostname', default=socket.getfqdn(),
                        help='hostname of server')
    args = parser.parse_args(sys.argv[1:])
    srv = make_server(args.hostname, 8080, application)
    srv.serve_forever()
