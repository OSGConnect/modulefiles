help(
[[
This module loads Rucio 1.6.6 into the environment. Rucio is a 
distributed data movement system.

]])

whatis("Loads Rucio")

local version = "1.6.6"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/rucio/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PYTHONPATH", pathJoin(base, "lib", "python2.6", "site-packages"))
setenv("RUCIO_HOME", pathJoin(base, "rucio"))
family('rucio')
load("gfal/7.20")
