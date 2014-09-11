help(
[[
This module loads Graphviz 2.38.0 into the environment. Graphviz is an
application for visualizing graph data.

]])

whatis("Loads the Graphviz visualization software")

local version = "2.38.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/graphviz/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('graphviz')
