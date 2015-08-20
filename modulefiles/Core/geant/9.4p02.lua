help(
[[
This module loads Geant4 9.4p02.  Geant4 is a detector simulator for HEP.

]])

whatis("Loads Geant4 9.4p02")

local version = "9.4p02"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib64"))
family('geant4')
load('gcc/4.9.2', 'clhep/2.1.0.1')
