help(
[[
This module loads the MPC Libraries into the environment. Gnu Mpc is a C library
for the arithmetic of complex numbers with arbitrarily high precision and
correct rounding of the result.

]])

whatis("Loads the Gnu MPC Libraries")

local version = "1.0.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mpc/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

load('mpfr/3.1.3')
load('gmp/6.0.0')
family('mpc')
