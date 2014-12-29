#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load xrootd/4.1.1

output=`xrdcp -V 2>&1`

if [ "$output" != "v4.1.1" ];
then
  echo "Error! Difference in outputs:"
  echo $output 
  exit 1
fi
