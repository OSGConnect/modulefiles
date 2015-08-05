help(
[[
This module loads libtiff 4.0.4

This software provides support for the Tag Image File Format (TIFF), a widely
used format for storing image data.

]])

whatis("Loads libtiff")
local version = "4.0.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/libtiff/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('libtiff')
