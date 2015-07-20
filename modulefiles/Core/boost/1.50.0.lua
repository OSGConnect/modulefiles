help(
[[
This module loads Boost 1.50.0

Boost provides free peer-reviewed portable C++ source libraries.

]])

whatis("Loads Boost libraries ")
local version = "1.50.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/boost/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('boost')
