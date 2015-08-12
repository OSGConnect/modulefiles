help(
[[
This module loads the ATLAS 3.10.1 libraries.  ATLAS is a library that
provides support for linear algebra operations.
]])

whatis("Loads ATLAS 3.10.1 libraries for linear algebra operations")

local version = "3.10.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/atlas/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64","atlas"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib64"))
family('atlas')
load('libgfortran')
