help(
[[
MPlayer comes with support for over 192 video and 85 audio codecs, which is outstanding by all standards. The fact that it can play some of the most popular formats (AVI, MPEG/VOB, ASF/WMA/WMV, RM, QT/MOV/MP4, Ogg/OGM, MKV, VIVO, FLI, NuppelVideo, yuv4mpeg, FILM and RoQ), you can also use it to watch VCD, DVD, SVCD, Blu−ray, 3ivx, DivX 3/4/5, WMV and even H.264 movies, too.
]])
whatis("MPlayer comes with support for over 192 video and 85 audio codecs")
local version = "1.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mplayer/"..version
prepend_path("PATH", base)
family('mplayer')

