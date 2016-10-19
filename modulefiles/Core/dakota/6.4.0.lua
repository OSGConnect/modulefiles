help(
[[
The Dakota toolkit provides a flexible, extensible interface between analysis codes and iterative systems analysis methods.
]])
whatis("Loads Dakota, which provides a flexible, extensible interface between analysis codes and iterative systems analysis methods.")
local version = "6.4.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/dakota/"..version
prepend_path("PATH", pathJoin(base, "bin"))
family('dakota')

load('boost/1.57.0')

