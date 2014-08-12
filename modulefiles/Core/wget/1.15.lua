help(
[[
This module loads wget 1.15 into the environment.  wget provides 
a command line http client.

]])

whatis("Loads the wget command line http client")

local version = "1.15"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/wget/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('wget')
