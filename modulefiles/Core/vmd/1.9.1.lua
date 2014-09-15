help(
[[
This module loads VMD 1.9.1 into the environment.  VMD is 
a molecular dynamics simulation tool.

]])

whatis("Loads the VMD application")

local version = "1.9.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/vmd/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('vmd')
