help(
[[
igraph is a library for creating and manipulating graphs. It is intended to be as powerful (ie. fast) as possible to enable the analysis of large graphs.
]])

whatis("Loads igraph libraries into the environment")

local version = "0.7.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/igraph/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))


family('igraph')
