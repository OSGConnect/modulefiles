help(
[[
This module loads cairo 1.8.8

Cairo is a 2D graphics library with support for multiple output devices.
Currently supported output targets include the X Window System (via both Xlib
and XCB), Quartz, Win32, image buffers, PostScript, PDF, and SVG file output.
Experimental backends include OpenGL, BeOS, OS/2, and DirectFB.

]])

whatis("Loads cairo libraries")
local version = "1.8.8"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cairo/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('cairo')
