help(
[[
This module loads JAGS 4.3.0.  JAGS is a gaussian solver.

]])

whatis("Loads JAGS 4.3.0")

local version = "4.3.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/jags/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib"))

load('lapack/3.6.1')
family('jags')
