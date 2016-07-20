help(
[[
This module loads Imagemagick 7.0.2 into the environment. Imagemagick is a
set of image manipulation tools. 

]])

whatis("Loads the Imagemagick image tools")

local version = "7.0.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/imagemagick/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))

family('imagemagick')
