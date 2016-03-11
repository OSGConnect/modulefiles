help(
[[
This module loads c-blosc 1.7.1

A blocking, shuffling and loss-less compression library that can be faster than
`memcpy()`

]])

whatis("Loads c-blosc")
local version = "1.7.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cblosc/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
load('snappy/1.1.3')
family('cblosc')
