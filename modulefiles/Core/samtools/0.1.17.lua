help(
[[
This module loads SAMtools 0.1.17 into the environment. 
SAM Tools provide various utilities for manipulating alignments in the SAM
format, including sorting, merging, indexing and generating alignments in a
per-position format.

]])

whatis("Loads the SAMtools scripts")

local version = "0.1.17"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/samtools/"..version

prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bcftools"))
prepend_path("PATH", pathJoin(base, "misc"))

family('samtools')
