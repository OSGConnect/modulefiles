help(
[[
This module loads Gromacs 4.6.5 into the environment. Gromacs is a 
molecular dynamics application.

]])

whatis("Loads the Gromacs molecular dynamics simulator")

local version = "7.0.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/imagemagick/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))

family('imagemagick')
