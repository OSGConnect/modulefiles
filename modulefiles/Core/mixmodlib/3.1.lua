help(
[[
This module loads the mixmod statistical libraries 

]])

whatis("Loads the Mixmod Statistical  Libraries")

local version = "3.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mixmodlib/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('mixmodlib')
