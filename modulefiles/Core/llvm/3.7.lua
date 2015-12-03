help(
[[
The LLVM Project is a collection of modular and reusable compiler and toolchain
technologies.
]])

whatis("Loads LLVM into the environment")

local version = "3.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/llvm/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('llvm')

