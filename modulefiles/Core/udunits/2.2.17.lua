help(
[[
This module loads Udunits 2.2.17

The UDUNITS package supports units of physical quantities. Its C library
provides for arithmetic manipulation of units and for conversion of numeric
values between compatible units.

]])

whatis("Loads Udunits binaries and libraries")
local version = "2.2.17"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/udunits/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('udunits')
load('expat/2.1.0')
