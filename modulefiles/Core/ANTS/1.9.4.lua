help(
[[
ANTs is popularly considered a state-of-the-art medical image registration and segmentation toolkit. ANTs extracts information from complex datasets that include imaging (Word Cloud). 
]])
whatis("Loads ANTs, which stands for Advanced Normalization Tools")
local version = "1.9.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ANTs/"..version
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("ANTSPATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('ANTs')
