#!/bin/bash
version=`python --version 2>&1`
exit_code=0
hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "System version of python: $version"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"

test_numpy () {
    python -c 'import numpy;'
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: numpy tests failed"
    fi
}

test_h5py () {
    python -c 'import h5py'
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: h5py tests failed"
    fi
}

test_netcdf4 () {
    python -c 'import netCDF4'
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: netCDF4 tests failed"
    fi
}


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load python/2.7
version=`python --version 2>&1`
echo "Module version of python2: $version"
if [ "$version" != "Python 2.7.7" ];
then
  echo "ERROR: Wrong version of python loaded"
  exit 1
fi
module load lapack
module load atlas
module load hdf5/1.8.9
module load netcdf/4.2.0
module load psims
test_numpy
test_h5py
test_netcdf4

