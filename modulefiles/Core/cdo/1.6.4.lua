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
prereq('hdf5/1.8.9', 'netcdf/4.2.0', 'udunits/2.2.17', 'curl/7.37.1', 'fftw/3.3.4')
