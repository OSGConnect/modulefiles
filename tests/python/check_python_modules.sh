#!/bin/bash
version=`python --version 2>&1`
exit_code=0
hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "System version of python: $version"

test_numpy () {
    python -c 'import numpy;numpy.test("full")'
    (( exit_code = exit_code || $? ))
    if [ "$?" -ne "0" ];
    then
        echo "ERROR: numpy tests failed"
    fi
}

test_scipy () {
    python -c 'import scipy;scipy.test("full")'
    (( exit_code = exit_code || $? ))
    if [ $? -ne 0 ];
    then
        echo "ERROR: scipy tests failed"
    fi
}

test_nltk () {
    python -c 'import nltk'
    (( exit_code = exit_code || $? ))
    if [ $? -ne 0 ];
    then
        echo "ERROR: matplotlib tests failed"
    fi
}

test_pandas () {
    nosetest pandas
    (( exit_code = exit_code || $? ))
    if [ $? -ne 0 ];
    then
        echo "ERROR: pandas tests failed"
    fi
}

test_matplotlib () {
    python -c 'import matplotlib'
    (( exit_code = exit_code || $? ))
    if [ $? -ne 0 ];
    then
        echo "ERROR: matplotlib tests failed"
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
module load all-pkgs
test_numpy
test_scipy
test_nltk
test_matplotlib

module unload python/2.7
module unload all-pkgs
module load python/3.4
version=`python3 --version 2>&1`
echo "Module version of python3: $version"
if [ "$version" != "Python 3.4.1" ];
then
  echo "ERROR: Wrong version of python loaded"
  exit 1
fi
module load lapack
module load atlas
module load all-pkgs
# NLTK not compatible with python3 right now
test_numpy
test_scipy
test_matplotlib

exit $exit_code

