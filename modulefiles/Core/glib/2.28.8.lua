help(
[[
This module loads glib 2.28.8

GLib provides the core application building blocks for libraries and
applications written in C. It provides the core object system used in GNOME, the
main loop implementation, and a large set of utility functions for strings and
common data structures.

]])

whatis("Loads glib libraries")
local version = "2.28.8"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/glib/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
setenv("G_BROKEN_FILENAMES", "1")
family('glib')
