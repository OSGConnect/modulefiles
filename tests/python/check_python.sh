#!/bin/bash
version=`python --version 2>&1`
hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname\nTime: $cur_time\n"
echo "System version of python: $version"

source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load python/2.7
version=`python --version 2>&1`
echo "Module version of python2: $version"
if [ "$version" != "Python 2.7.7" ];
then
  echo "ERROR: Wrong version of python loaded"
  module unload python/2.7
  exit 1
fi

module unload python/2.7
module load python/3.4
version=`python3 --version 2>&1`
echo "Module version of python3: $version"
if [ "$version" != "Python 3.4.1" ];
then
  echo "ERROR: Wrong version of python loaded"
  module unload python/3.4
  exit 1
fi
module unload python/3.4

