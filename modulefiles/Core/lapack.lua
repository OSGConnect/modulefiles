help(
[[
This module loads LAPACK 3.50.1.  The LAPACK libraries provide support for 
linear algebra operations.

]])

whatis("Loads LAPACK libraries for linear algebra calculations")

local version = "3.50.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/lapack/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
family('lapack')
