help(
[[
This module loads various gnome libraries and supporting libraries

GNOME is a desktop envionrment for X11, however it provides several 
libraries that are used in other contexts for image processing.  This
module loads the following:

Glib 2.28.8
ATK 1.30.0
Cairo 1.8.8
GTK+ 2.24.23
Pango 1.28.1
Pixman 0.32.4

]])

whatis("Loads gnome libraries")
local version = "1.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gnome-libs/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", pathJoin(base, "include"))
prepend_path("CPATH", pathJoin(base, "include", "gtk-2.0"))
prepend_path("CPATH", pathJoin(base, "lib64", "gtk-2.0", "include"))
prepend_path("CPATH", pathJoin(base, "include", "cairo"))
prepend_path("CPATH", pathJoin(base, "include", "pango-1.0"))
prepend_path("CPATH", pathJoin(base, "include", "gdk-pixbuf-2.0"))
prepend_path("CPATH", pathJoin(base, "include", "atk-1.0"))
pushenv("PKG_CONFIG_PATH", pathJoin(base, "lib64", "pkgconfig/"))
prepend_path("LIBRARY_PATH", pathJoin(base, "lib64"))
setenv("G_BROKEN_FILENAMES", "1")
family('gnome_libs')
