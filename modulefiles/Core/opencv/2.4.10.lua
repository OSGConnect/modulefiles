help(
[[
This module loads OpenCV 2.4.10 into the environment. OpenCV is 
an image processing library.

]])

whatis("Loads the OpenCV image processing library")

local version = "2.4.10"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/opencv/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('opencv')
prereq('gnome_libs', 'ffmpeg')
