help(
[[
Quantum Espresso is an integrated suite of Open-Source computer codes for electronic-structure calculations and materials modeling at the nanoscale. It is based on density-functional theory, plane waves, and pseudopotentials.
]])

local version = "5.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/espresso/"..version
whatis("Quantum Espresso is an integrated suite of Open-Source computer codes for electronic-structure calculations")
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
family('espresso')

