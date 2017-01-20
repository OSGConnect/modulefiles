help(
[[
This module loads Boost 1.62.0 with the gcc 5.1 ABI

Boost provides free peer-reviewed portable C++ source libraries.

]])

whatis("Loads Boost libraries ")
local version = "1.62.0-cxx11"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/boost/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('boost')
