help(
[[
RAxML: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies

]])

whatis(" A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies ")

local version = "8.2.9"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/RAxML/"..version

prepend_path("PATH", pathJoin(base, "usefulScripts"))
prepend_path("PATH", pathJoin(base,"bin"))
prepend_path("CPATH",  pathJoin(base, "include"))

family('RAxML')

