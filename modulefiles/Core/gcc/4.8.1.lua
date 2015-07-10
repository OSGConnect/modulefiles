help(
[[
This module loads the GNU Compiler Collection (GCC) 4.8.1

]])

local version = "4.8.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gcc/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))

family('gcc')
load('mpc')
