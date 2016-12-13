help(
[[
This module loads tcsh 6.20.00 into the environment. 

]])

whatis("Loads tcsh shell")

local version = "6.20.00"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/tcsh/"..version

prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))

family('tcsh')

