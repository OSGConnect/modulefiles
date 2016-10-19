help(
[[
OpenSees is a software framework for developing applications to simulate the performance of structural and geotechnical systems subjected to earthquakes.
]])
whatis("Loads opensees, used to simulate the performance of structural and geotechnical systems subjected to earthquakes")
local version = "6482"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/opensees/"..version
prepend_path("PATH", pathJoin(base, "bin"))
family('opensees')

