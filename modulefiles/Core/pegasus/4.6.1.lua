help(
[[
This module loads the Pegasus workflow management system into the environment
]])

whatis("Pegasus workflow management system")
local version = "4.6.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/pegasus/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PYTHONPATH", pathJoin(base, "lib64/python2.6/site-packages"))
family('pegasus')

