help(
[[
TopHat is a program that aligns RNA-Seq reads to a genome in order to identify exon-exon splice junctions. It is built on the ultrafast short read mapping program

]])

whatis("Loads TopHat program that aligns RNA-Seq")

local version = "2.1.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/tophat/"..version

prepend_path("PATH", base)

family('tophat')

