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
prereq('blasr/1.3.1', 'python/2.7', 'pbsuite_pkgs')
