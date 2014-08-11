#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load curl/7.37.1
curl -O http://stash.osgconnect.net/keys/cern.ch.pub -L --retry 5
output=`sha1sum cern.ch.pub | cut -f 1 -d' '`

if [ "$output" != "5b83bedef4c7ba38520d7e1b764f0cbc28527fb9" ];
then
  echo "Error! Difference in outputs:"
  echo $output 
  exit 1
fi
