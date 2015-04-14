help(
[[
This module loads Povray 3.7 into the environment. The Persistence of Vision
Raytracer is a high-quality, Free Software tool for creating stunning
three-dimensional graphics. 

]])

whatis("Loads the povray software")

local version = "3.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/povray/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('povray')
prereq('boost/1.57.0')
