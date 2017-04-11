help(
[[
This module loads CMake 3.8.0 into the environment.  CMake is a 
cross platform software build tool.

]])

whatis("Loads the CMake build tool")

local version = "3.8.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cmake/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('cmake')
