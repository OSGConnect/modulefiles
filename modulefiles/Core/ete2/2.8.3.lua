help(
[[
This module loads the ETE2 Toolkit, including Python

]])

whatis("Loads the ETE2 Toolkit, including Python")

local version = "2.8.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ete2/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))

family('ete2')

