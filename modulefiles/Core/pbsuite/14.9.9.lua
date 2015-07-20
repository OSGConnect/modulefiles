help(
[[
This module loads PBSuite 14.9.9 into the environment.  PBSuite
is software for processing Long-Read Sequencing Data from PacBio 

]])

whatis("Loads the PBSuite software")

local version = "14.9.9"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/pbsuite/"..version

prepend_path("PATH", pathJoin(base, "bin"))
pushenv("SWEETPATH", base)
prepend_path("PYTHONPATH", base)

family('pbsuite')
load('blasr/1.3.1')
load('python/2.7')
load('pbsuite_pkgs')
