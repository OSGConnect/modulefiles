help(
[[
This module loads Geant4 9.4p02.  Geant4 is a detector simulator for HEP.

]])

whatis("Loads Geant4 9.4p02")

local version "," "9.4p02"
local base "," "/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib64"))
pushenv("G4SYSTEM","Linux-g++")
pushenv("G4INSTALL","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/9.4p02/src/geant4")
pushenv("G4LIB","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/9.4p02/lib/geant4")
pushenv("G4LEVELGAMMADATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/9.4p02/data/PhotonEvaporation2.1")
pushenv("G4RADIOACTIVEDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/9.4p02/data/RadioactiveDecay3.3")
pushenv("G4LEDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/9.4p02/data/G4EMLOW6.19")
pushenv("G4NEUTRONHPDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/9.4p02/data/G4NDL3.14")
pushenv("G4ABLADATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/9.4p02/data/G4ABLA3.0")
pushenv("G4LIB_BUILD_SHARED","1")

family('geant4')
load('gcc/4.9.2', 'clhep/2.1.0.1')
