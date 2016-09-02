help(
[[
This module loads ViennaRNA-2.2.9.
]])

local version = "2.2.9"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ViennaRNA/"..version
whatis("The ViennaRNA Package consists of a C code library and several stand-alone programs for the prediction and comparison of RNA secondary structures.")
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
family('ViennaRNA')

