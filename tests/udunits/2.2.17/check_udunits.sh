#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load expat/2.1.0 udunits/2.2.17
udunits2 -H 1kg -W lb > output
if [ "$?" != "0" ];
then
  echo "Error running udunits2 tests"
  exit 1
fi
changes=`diff output ouput.expected`
if [ "$changes" != "" ];
then
  echo "Error running udunits2 tests"
  exit 1
fi

rm output

