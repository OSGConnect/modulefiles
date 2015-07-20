help(
[[
This module loads FFTW 3.3.4 , a library that provides functions for
efficiently and quickly calculating fast fourier transforms.

]])

whatis("Loads the FFTW library which provides functions for computing FFTs")

local version = "3.3.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/fftw/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('fftw')
