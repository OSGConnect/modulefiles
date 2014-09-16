help(
[[
This module loads ROOT 5.34-21 into the environment. ROOT is a 
physics analysis application.

]])

whatis("Loads the ROOT data analysis environmemt")

local version = "5.34-21"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/root/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('root')
