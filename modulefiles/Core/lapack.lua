help(
[[
This module loads LAPACK 3.50.1

]])

local version = "3.50.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/lapack/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
family('lapack')
