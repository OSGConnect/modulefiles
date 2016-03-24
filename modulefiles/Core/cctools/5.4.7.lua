help(
[[
This module loads cctools 5.4.7
http://ccl.cse.nd.edu/software/manuals/
]])

whatis("Loads the cctools collection")
local version = "5.4.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cctools/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PYTHONPATH", pathJoin(base, "lib/python2.6/site-packages"))

family('cctools')
