help(
[[
This module loads Einstein Payne-Gaposchkin

]])

whatis("Loads the Einstein application")

local version = "Payne-Gaposchkin"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/einstein/"..version

prepend_path("PATH", pathJoin(base, "/simfactory/bin"))

family('einstein')

