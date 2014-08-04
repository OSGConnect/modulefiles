help(
[[
This module loads FFTW 3.3.4 

]])

local version = "3.3.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/fftw/"..version

prepend_path("LD_LIBRARY_PATH", base)
family('fftw')
