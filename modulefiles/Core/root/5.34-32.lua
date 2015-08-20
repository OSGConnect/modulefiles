help(
[[
This module loads ROOT 5.34-32 into the environment. ROOT is a 
physics analysis application.

]])

whatis("Loads the ROOT data analysis environmemt")

local version = "5.34-32"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/root/"..version
pushenv("ROOTSYS", "/cvmfs/oasis.opensciencegrid.org/osg/modules/root/5.34-32")
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib/root"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
prepend_path("PYTHONPATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/root/5.34-32/lib/root")
family('root')
