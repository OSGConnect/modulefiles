help(
[[
This module loads the Gnu Multi Precision Libraries into the environment.

]])

whatis("Loads the Gnu Multi Precision Libraries")

local version = "6.0.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gmp/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")

family('gmp')
