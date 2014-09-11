help(
[[
This module loads the APR-Util 1.5.3 .  APR Util provides 
cross platform libraries for handling OS related operations.

]])

whatis("Loads the APR Util library which provides cross platform tools for os/system operations")

local version = "1.5.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/apr-util/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('apr-util')
prereq('apr')
