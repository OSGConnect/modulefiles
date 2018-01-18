help(
[[
This module loads R 3.1.1 into the environment

]])

whatis("Loads R, a tool for statistical analysis")
local version = "3.1.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/R/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))

load('libicu/4.2.1')
family('R')
