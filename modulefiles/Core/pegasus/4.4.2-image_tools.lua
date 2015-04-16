help(
[[
This module loads Pegasus 4.4.2 into the environment

Note: this is a special version compiled for use with the python
image_tools module.  

]])

whatis("Loads Pegasus, a workflow management system into the environment")
local version = "4.4.2-image_tools"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/pegasus/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('pegasus')
