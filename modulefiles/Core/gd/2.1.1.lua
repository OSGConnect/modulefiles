help(
[[
This module loads the GD libraries into the environment.

]])

whatis("Loads the GD Libraries")

local version = "2.1.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gd/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))

family('gd')
