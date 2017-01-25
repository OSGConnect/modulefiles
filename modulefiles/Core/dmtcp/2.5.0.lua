help(
[[
This module loads dmtcp 2.5.0 
]])

whatis("Loads dmtcp 2.5.0 ")

local version = "2.5.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/dmtcp/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib"))

family('dmtcp')
load('gcc/6.2.0')
