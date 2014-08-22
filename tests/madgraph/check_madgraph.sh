#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load madgraph/2.1.2
cd input
mg5_aMC -f pp2z.madgraph
cd pp2z
./bin/generate_events --laststep=pgs -f

if [ "$?" != "0" ];
then
  echo "Error running octave tests"
  exit 1
fi

