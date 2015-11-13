help(
[[
This package contains X.Org X11 libXpm runtime library

]])

whatis("Loads X.Org X11 libXpm runtime library")
local version = "3.5.10"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/libxpm/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, 'lib'))
prepend_path("LIBRARY_PATH", pathJoin(base, 'lib'))
prepend_path("CPATH", pathJoin(base, 'include'))
prepend_path("PATH", pathJoin(base, 'bin'))
prepend_path("PKG_CONFIG_PATH", pathJoin(base, "lib", "pkgconfig"))
family('libxpm')
