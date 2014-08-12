help(
[[

This module loads FFTW 3.3.4 compiled for gromacs. The FFTW
library provides functions for efficient fast fourier transforms.

]])

whatis("Loads the FFTW library which provides functions for computing FFTs. Compiled for gromacs")

local version = "3.3.4-gromacs"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/fftw/"..version

prepend_path("LD_LIBRARY_PATH", base)
family('fftw')
