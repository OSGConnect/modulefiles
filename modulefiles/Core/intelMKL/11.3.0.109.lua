help(
[[
This module loads intel MKL libraries version 11.3.0.109
]])

local version = "11.3.0.109"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/intelMKL/"..version
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('intelMKL')
