help(
[[
mothur is a project that seeks to develop a single piece of open-source, expandable software to fill the bioinformatics needs of the microbial ecology community. We have incorporated the functionality of dotur, sons, treeclimber, s-libshuff, unifrac, and much more. 
]])

whatis(" collection of bioinformatics tool for micobiological community ")

local version = "1.39.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mothur/"..version

prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "/blast/bin"))

family('mothur')
