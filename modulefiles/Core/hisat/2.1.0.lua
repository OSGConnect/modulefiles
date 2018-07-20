help(
[[
This module loads hisat 2.1.0 . HISAT2 is a fast and sensitive alignment program
for mapping next-generation sequencing reads.

]])

whatis("Loads the hisat tool ")

local version = "2.1.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/hisat/"..version

prepend_path("PATH", base)
prepend_path("PYTHONPATH", base)
family('hisat')
