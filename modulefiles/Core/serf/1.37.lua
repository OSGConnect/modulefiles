help(
[[
This module loads serf 1.37 , a library that provides high 
performance http client functions.

]])

whatis("Loads the serf library which provides high performance http functionality")

local version = "1.37"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/serf/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('serf')
