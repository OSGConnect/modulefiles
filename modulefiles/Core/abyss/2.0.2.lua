
help(
[[
ABySS is a de novo, parallel, paired-end sequence assembler that is designed for short reads. The single-processor version is useful for assembling genomes up to 100 Mbases in size. 
]])

whatis("ABySS is a de novo, parallel, paired-end sequence assembler that is designed for short reads.")

local version = "2.0.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/abyss/"..version

prepend_path("PATH", pathJoin(base, "bin"))


