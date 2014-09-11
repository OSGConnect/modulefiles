help(
[[
This module loads Graphviz 2.3.8 into the environment. Graphviz is an
application for visualizing graph data.

]])

whatis("Loads the Graphviz visualization software")

local version = "2.3.8"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/graphviz/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('graphviz')
