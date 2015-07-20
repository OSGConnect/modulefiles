help(
[[
This module loads Subversion 1.8.10 into the environment. Subversion is a 
source control module tool.

]])

whatis("Loads the Subversion SCM tools")

local version = "1.8.10"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/subversion/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('subversion')
load('apr/1.5.1')
load('aprutil/1.5.3')
load('serf/1.37')
