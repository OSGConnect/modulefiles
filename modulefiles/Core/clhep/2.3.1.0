help(
[[
The CLHEP project was proposed by Leif Lönnblad at CHEP 92. It is intended to be
a set of HEP-specific foundation and utility classes such as random generators,
physics vectors, geometry and linear algebra. CLHEP is structured in a set of
packages independent of any external package (interdependencies within CLHEP are
allowed under certain conditions). 

]])

whatis("Loads the CLHEP library which provides a library for particle physics")

local version = "2.3.1.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/clhep/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib"))
pushenv("CLHEP_BASE_DIR", base)
family('clhep')
