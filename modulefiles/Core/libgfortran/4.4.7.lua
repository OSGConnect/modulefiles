help(
[[
This package contains Fortran shared library which is needed to run
Fortran dynamically linked programs.

]])

whatis("Loads fortran shared library ")
local version = "4.4.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/libgfortran/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base))
family('libgfortran')
