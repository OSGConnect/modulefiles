help(
[[
This module loads proj 4.9.1

PROJ is a cartographic projections library.

]])

whatis("Loads proj libraries")
local version = "4.9.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/proj/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('proj')
