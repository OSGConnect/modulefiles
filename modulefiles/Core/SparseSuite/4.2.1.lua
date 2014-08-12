help(
[[
This module loads SparseSuite 4.2.1

SparseSuite is a library for sparse matrix factorization.

]])

whatis("Loads the SparseSuite library for sparse matrix factorization")
local version = "4.2.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/SparseSuite/"..version

prepend_path("LD_LIBRARY_PATH", base)
family('SparseSuite')
