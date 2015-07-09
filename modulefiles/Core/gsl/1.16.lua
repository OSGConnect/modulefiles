help(
[[
This module loads the Gnu Scientific Libraries into the environment.

]])

whatis("Loads the Gnu Scientific Libraries")

local version = "1.16"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gsl/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('gsl')
