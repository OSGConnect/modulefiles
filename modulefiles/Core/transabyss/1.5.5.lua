
help(
[[
de novo assembly of RNA-Seq data using ABySS
]])

whatis("de novo assembly of RNA-Seq data using ABySS")

local version = "1.5.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/transabyss/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "transabyss-1.5.5"))

load('python/2.7')
load('abyss')


