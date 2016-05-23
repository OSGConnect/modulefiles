help(
[[
This module loads binutils 2.26 

The GNU Binutils are a collection of binary tools that do low level operations
on binaries.

]])

whatis("Loads binutils 2.26"
local version = "2.26"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/binutils/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('binutils')
