help(
[[
This module loads stashcp 2.6   into the environment. stashcp is a user-facing
front-end to XRootD caching for OSG Connect Stash

]])

whatis("Loads the stashcp 2.6 tool")

local version = "2.6"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/stashcp/"..version

prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))

family('stashcp')
