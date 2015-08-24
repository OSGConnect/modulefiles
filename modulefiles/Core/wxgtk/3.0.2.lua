help(
[[
This module loads wxGTK 3.0.2

wxWidgets is a C++ library that lets developers create applications for Windows,
Mac OS X, Linux and other platforms with a single code base.

]])

whatis("Loads wxGTK libraries")
local version = "3.0.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/wxgtk/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
load("gnome_libs/1.0")
family('wxgtk')
