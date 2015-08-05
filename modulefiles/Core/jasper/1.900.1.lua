help(
[[
This module loads JasPer 1.900.1

The JasPer Project is an open-source initiative to provide a free software-based
reference implementation of the codec specified in the JPEG-2000 Part-1 standard
(i.e., ISO/IEC 15444-1).

]])

whatis("Loads JasPer libraries")
local version = "1.900.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/jasper/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('jasper')
