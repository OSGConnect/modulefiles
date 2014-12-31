help(
[[
This module loads atk 1.30.0

ATK (Accessibility Toolkit) is an open source and free comand-line software that
has been designed from the ground up to act as an accessibility library for the
GNOME desktop environmen

]])

whatis("Loads atk libraries ")
local version = "1.30.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/atk/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('atk')
