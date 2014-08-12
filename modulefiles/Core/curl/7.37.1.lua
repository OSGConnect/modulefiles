help(
[[
This module loads curl 7.37.1 into the environment. Curl is a command line
http client.

]])

whatis("Loads the curl command line http client")

local version = "7.37.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/curl/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('curl')
