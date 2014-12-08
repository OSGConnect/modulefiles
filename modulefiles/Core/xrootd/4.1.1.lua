help(
[[
This module loads XRootD 4.1.1 into the environment. XRootD is a
fully generic suite for fast, low latency and scalable data access.

]])

whatis("Loads the XRootD software framework")

local version = "4.1.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/xrootd/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))

family('xrootd')
