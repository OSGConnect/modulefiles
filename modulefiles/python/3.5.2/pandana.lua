help(
[[
Pandas Network Analysis - dataframes of network queries, quickly
]])

local version = "0.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-3.5/Pandana"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64/python3.5/site-packages/ "))
prepend_path("LIBRARY_PATH", pathJoin(base, "lib64/python3.5/site-packages/ "))

load('gcc/6.2.0')
