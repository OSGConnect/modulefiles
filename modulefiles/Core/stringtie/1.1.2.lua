help(
[[
StringTie is a fast and highly efficient assembler of RNA-Seq alignments into potential transcripts.
]])

whatis("Loads StringTie, an assembler of RNA-Seq alignments")

local version = "1.2.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/stringtie/"..version

prepend_path("PATH", base)

family('stringtie')

