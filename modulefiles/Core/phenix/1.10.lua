help(
[[
PHENIX is a software suite for the automated determination of molecular structures using X-ray crystallography and other methods.
]])

whatis("Loads phenix suit of programs")

local version = "1.10"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/phenix/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "etc"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
family('phenix')
