help(
[[
This module loads wget 1.19 into the environment.  wget is a
http command line client.

]])

whatis("Loads wget ")

local version = "1.19"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules2/el7/wget/"..version

prepend_path("PATH", pathJoin(base, "bin"))
report_load("wget/"..version)
family('wget')
