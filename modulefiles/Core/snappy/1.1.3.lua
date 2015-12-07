help(
[[
This module loads snappy 1.1.3

Snappy is a compression/decompression library. It does not aim for maximum
compression, or compatibility with any other compression library; instead, it
aims for very high speeds and reasonable compression.

]])

whatis("Loads snappy")
local version = "1.1.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/snappy/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('snappy')
