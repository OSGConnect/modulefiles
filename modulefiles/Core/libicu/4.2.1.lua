help(
[[
This package contains ICU shared library. The International Components for
Unicode (ICU) libraries provide
robust and full-featured Unicode services on a wide variety of
platforms.

]])

whatis("Loads icu shared library ")
local version = "4.2.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/libicu/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base))
family('libicu')
