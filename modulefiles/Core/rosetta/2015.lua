help(
[[
The Rosetta software suite includes algorithms for computational modeling and analysis of protein structures.
]])

whatis("Loads rosetta suit of programs")

local version = "2015"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/rosetta/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "build"))
prepend_path("PATH", pathJoin(base, "tools"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "/build/external/release/linux/2.6/64/x86/gcc/4.4/default/"))
family('rosetta')
