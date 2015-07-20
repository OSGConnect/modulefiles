help(
[[
This module loads Expat 2.1.0

Expat is a library for parsing XML documents

]])

whatis("Loads expat libraries which provide support for parsing XML documents")
local version = "2.1.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/expat/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('expat')
