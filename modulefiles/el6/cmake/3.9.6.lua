help(
[[
This module loads CMake 3.0.1 into the environment.  CMake is a 
cross platform software build tool.

]])

whatis("Loads the CMake build tool")

local version = "3.9.6"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules2/el6/cmake/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('cmake')
