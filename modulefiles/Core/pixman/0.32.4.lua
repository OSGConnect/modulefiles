help(
[[
This module loads pixman 0.32.4

Pixman is a low-level software library for pixel manipulation, providing
features such as image compositing and trapezoid rasterization. Important users
of pixman are the cairo graphics library and the X server. 

]])

whatis("Loads pixman libraries")
local version = "0.32.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/pixman/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('pixman')
