help(
[[
This module loads cctools 4.4.2

http://ccl.cse.nd.edu/software/manuals/
]])

whatis("Loads the cctools collection")
local version = "4.4.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cctools/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PYTHONPATH", pathJoin(base, "lib/python2.6/site-packages"))

family('cctools')


