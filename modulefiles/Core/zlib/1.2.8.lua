help(
[[
This module loads zlib 1.2.8

Zlib is a library that provides functions for compression and 
decompression of data

]])

whatis("Loads Zlib libraries for compression and decompression")
local version = "1.2.8"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/zlib/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('zlib')
