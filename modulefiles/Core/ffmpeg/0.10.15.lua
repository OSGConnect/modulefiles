help(
[[
This module loads ffmpeg into the environment. ffmpeg is a video and image
processing application.

]])

whatis("Loads the ffmpeg video processing app")

local version = "0.10.15"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ffmpeg/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('ffmpeg')
