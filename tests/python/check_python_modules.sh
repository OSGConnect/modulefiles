#!/bin/bash
version=`python --version 2>&1`
exit_code=0
echo "System version of python: $version"

test_numpy () {
    local exit_code=0
    python -c 'import numpy;numpy.test("full")'
    echo $?
    if [ "$?" -ne "0" ];
    then
        echo "ERROR: numpy tests failed"
        exit_code=1
    fi
    echo $exit_code
}

test_scipy () {
    local exit_code=0
    python -c 'import scipy;scipy.test("full")'
    if [ $? -ne 0 ];
    then
        echo "ERROR: scipy tests failed"
        exit_code=1
    fi
    echo $exit_code
}

test_nltk () {
    local exit_code=0
    python -c 'import nltk'
    if [ $? -ne 0 ];
    then
        echo "ERROR: matplotlib tests failed"
        exit_code=1
    fi
    echo $exit_code
}

test_pandas () {
    local exit_code=0
    nosetest pandas
    if [ $? -ne 0 ];
    then
        echo "ERROR: pandas tests failed"
        exit_code=1
    fi
    echo $exit_code
}

test_matplotlib () {
    local exit_code=0
    python -c 'import matplotlib'
    if [ $? -ne 0 ];
    then
        echo "ERROR: matplotlib tests failed"
        exit_code=1
    fi
    echo $exit_code
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
module load all-pkgs
(( exit_code = exit_code || $(test_numpy) ))
(( exit_code = exit_code || $(test_scipy) ))
(( exit_code = exit_code || $(test_nltk) ))
(( exit_code = exit_code || $(test_matplotlib) ))

module unload python/2.7
module load python/3.4
version=`python3 --version 2>&1`
echo "Module version of python3: $version"
if [ "$version" != "Python 3.4.1" ];
then
  echo "ERROR: Wrong version of python loaded"
  exit 1
fi
module load all-pkgs
# NLTK not compatible with python3 right now
(( exit_code = exit_code || $(test_numpy) ))
(( exit_code = exit_code || $(test_scipy) ))
(( exit_code = exit_code || $(test_matplotlib) ))

exit $exit_code

