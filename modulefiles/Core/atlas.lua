help(
[[
This module loads ATLAS 3.10.1

]])

local version = "3.10.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/atlas/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64","atlas"))
family('atlas')
