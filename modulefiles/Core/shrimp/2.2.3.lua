help(
[[
SHRiMP is a software package for aligning genomic reads against a target genome. It was primarily developed with the multitudinous short reads of next generation sequencing machines in mind, as well as Applied Biosystem's colourspace genomic representation. 

]])
whatis("SHRiMP is a software package for aligning genomic reads against a target genome.")
local version = "2.2.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/shrimp/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "utils"))
family('shrimp')

