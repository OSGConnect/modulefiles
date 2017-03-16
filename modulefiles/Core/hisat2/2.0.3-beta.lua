help(
[[
HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) against the general human population (as well as against a single reference genome).
]])

whatis("Loads HISAT2 program that aligns RNA-Seq")

local version = "2.0.3-beta"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/hisat2/"..version

prepend_path("PATH", base)

family('hisat2')

