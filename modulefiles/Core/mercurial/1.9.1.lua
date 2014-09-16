help(
[[
This module loads Mercurial 1.8.1 into the environment. Mercurial is a 
software change management application.

]])

whatis("Loads the Mercurial SCM application")

local version = "1.9.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mercurial/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('mercurial')
