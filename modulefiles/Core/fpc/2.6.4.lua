help(
[[
This module loads the freepascal 2.6.4 compiler into the environment.  

]])

whatis("Loads the freepascal compiler")

local version = "2.6.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/fpc/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('fpc')
