help(
[[
CASINO is a computer program system for performing quantum Monte Carlo (QMC) electronic structure calculations that has been developed by members of the Theory of Condensed Matter group in the Cambridge University physics department, and their collaborators, over more than 20 years.  It is capable of calculating incredibly accurate solutions to the Schrödinger equation of quantum mechanics for realistic systems built from atoms. 
]])
whatis("CASINO is a computer program system for performing quantum Monte Carlo (QMC) electronic structure calculations ")
local version = "2.13.211"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/casino/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin_qmc"))
prepend_path("PATH", pathJoin(base, "data"))
prepend_path("PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "src"))
prepend_path("PATH", pathJoin(base, "bin_qmc/linuxpc-gnu.itb2/opt/"))
family('casino')

