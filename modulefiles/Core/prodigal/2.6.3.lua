help(
[[
This module loads Prodigal 2.6.3

Fast, reliable protein-coding gene prediction for prokaryotic genomes.

]])

whatis("Loads Prodigal")
local version = "2.6.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/prodigal/"..version

prepend_path("PATH", base)
family('prodigal')

