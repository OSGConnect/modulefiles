help(
[[
This module loads mysql 5.1.73 client into the environment

]])

whatis("Loads mysql 5.1.73 client ")
local version = "5.1.73"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mysql/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))

family('mysql')
