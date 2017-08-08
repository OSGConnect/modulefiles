help(
[[
Psi4 is an open-source suite of ab initio quantum chemistry programs designed for efficient, high-accuracy simulations of a variety of molecular properties. 
]])

whatis("Loads psi4 quantum chemistry package")

local version = "1.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/psi4/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
family('psi4')
