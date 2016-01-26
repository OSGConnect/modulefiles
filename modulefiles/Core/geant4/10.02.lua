help(
[[
This module loads Geant4 10.02.  Geant4 is a detector simulator for HEP.

]])

whatis("Loads Geant4 10.02")

local version = "10.02"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib64"))
prepend_path("LD_LIBRARY_PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/lib64/geant4/Linux-g++")
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib64"))

pushenv("G4NEUTRONHPDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/G4NDL4.5")
pushenv("G4LEDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/G4EMLOW6.48")
pushenv("G4LEVELGAMMADATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/PhotonEvaporation3.2")
pushenv("G4RADIOACTIVEDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/RadioactiveDecay4.3")
pushenv("G4NEUTRONXSDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/G4NEUTRONXS1.4")
pushenv("G4PIIDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/G4PII1.3")
pushenv("G4REALSURFACEDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/RealSurface1.0")
pushenv("G4SAIDXSDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/G4SAIDDATA1.1")
pushenv("G4ABLADATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/G4ABLA3.0")
pushenv("G4ENSDFSTATEDATA","/cvmfs/oasis.opensciencegrid.org/osg/modules/geant4/10.02/share/Geant4-10.2.0/data/G4ENSDFSTATE1.2")

family('geant4')
load('gcc/4.9.2', 'clhep/2.3.1.1')
