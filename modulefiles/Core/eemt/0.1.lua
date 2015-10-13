help(
[[
This module loads the EEMT stack which includes a bunch of GIS tools
]])

whatis("Loads the EEMT GIS system")
local version = "0.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/eemt/"..version

prepend_path("PATH", base.."/grass-6.4.4/bin")
prepend_path("PATH", base.."/grass-6.4.4/scripts")
prepend_path("PATH", base.."/bin")
prepend_path("LD_LIBRARY_PATH", base.."/grass-6.4.4/lib")
prepend_path("LD_LIBRARY_PATH", base.."/lib")
prepend_path("PYTHONPATH", base.."/grass-6.4.4/lib/python2.7/site-packages")

family('eemt')

