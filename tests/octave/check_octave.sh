#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load SparseSuite/4.2.1 fftw/3.3.4 glpk/4.54 hdf5/1.8.13 lapack atlas pcre/8.35 qhull/2012.1
module load octave
cd input_files
octave matrix.octave 

if [ "$?" != "0" ];
then
  echo "Error running octave tests"
  exit 1
fi

