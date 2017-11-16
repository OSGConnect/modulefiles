help(
[[
This module loads Git 2.15.0 into the environment.  Git is a
source control module tool.

]])

whatis("Loads the Git SCM tools")

local version = "2.15.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules2/el6/git/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
report_load("git/"..version)
family('git')
