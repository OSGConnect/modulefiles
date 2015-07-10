help(
[[
This module loads the MPFR, The MPFR library is a C library for
multiple-precision floating-point computations with correct rounding.

]])

whatis("Loads the MPFR Libraries")

local version = "3.1.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mpfr/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

load('gmp/6.0.0')
family('mpfr')
