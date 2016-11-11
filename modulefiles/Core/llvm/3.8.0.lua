help(
[[
The LLVM Project is a collection of modular and reusable compiler and toolchain
technologies.
]])

whatis("Loads LLVM into the environment")

local version = "3.8.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/llvm/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH", pathJoin(base, "include"))

family('llvm')
load('gcc/6.2.0')
load('cmake/3.4.1')
load('python/2.7')
