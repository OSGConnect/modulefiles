help(
[[
This module loads gtk+ 2.24.23

GTK+, or the GIMP Toolkit, is a multi-platform toolkit for creating graphical
user interfaces. Offering a complete set of widgets, GTK+ is suitable for
projects ranging from small one-off tools to complete application suites.

]])

whatis("Loads gtk libraries")
local version = "2.24.23"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gtk/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
family('gtk')
