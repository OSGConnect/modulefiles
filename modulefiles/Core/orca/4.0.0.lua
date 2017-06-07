help(
[[
ORCA is a general-purpose quantum chemistry program package that features virtually all modern electronic structure methods (density functional theory, many-body perturbation and coupled cluster theories, and multireference and semiempirical methods). 
]])
whatis("ORCA is a general-purpose quantum chemistry program package")
local version = "4.0.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/orca/"..version
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('orca')
