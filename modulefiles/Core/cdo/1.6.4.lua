help(
[[
This module loads CDO 1.6.4

CDO is a collection of command line Operators to manipulate and analyse Climate
and NWP model Data. 

]])

whatis("Loads CDO toolkit ")
local version = "1.6.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cdo/"..version

prepend_path("PATH", pathJoin(base, "bin"))
family('cdo')
load('hdf5/1.8.9')
load('netcdf/4.2.0')
load('udunits/2.2.17')
load('curl/7.37.1')
load('fftw/3.3.4')
