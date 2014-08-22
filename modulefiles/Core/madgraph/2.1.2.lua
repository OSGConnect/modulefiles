help(
[[
This module loads Madgraph 2.1.2 into the environment. Madgraph
is a framework that aims at providing all the elements necessary 
for SM and BSM phenomenology

]])

whatis("Loads the Madgraph event generation")

local version = "2.1.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/madgraph/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('madgraph')
