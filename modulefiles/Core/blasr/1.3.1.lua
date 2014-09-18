help(
[[
This module loads Blasr 1.3.1 into the environment.  Blasr is
the PacBio® long read aligner.

]])

whatis("Loads the Blasr long read aligner")

local version = "1.3.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/blasr/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('blasr')
prereq('hdf5/1.8.12')
