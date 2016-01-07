help(
[[
This module loads Geant4 10.02.  Geant4 is a detector simulator for HEP.

]])

whatis("Loads Geant4 10.02")

local version = "10.02"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib"))

family('geant4')
load('gcc/4.9.2', 'clhep/2.3.1.0')
