help(
[[
This module loads stashcp into the environment. stashcp is a user-facing
front-end to XRootD caching for OSG Connect Stash

]])

whatis("Loads the stashcp tool")

local version = "1.0.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/stashcp/"..version

prepend_path("PATH", base)

family('stashcp')
