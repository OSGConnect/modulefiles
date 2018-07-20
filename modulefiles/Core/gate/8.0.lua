help(
[[
This module loads Gate 8.0. Simulations of Preclinical and Clinical Scans in Emission Tomography, Transmission Tomography and Radiation Therapy. 
]])

whatis("Loads Gate 8.0")

local version = "8.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gate/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))

family('gate')
load('gcc/4.9.3', 'clhep/2.3.1.1', 'geant4/10.3p01', 'root/5.34-32')

