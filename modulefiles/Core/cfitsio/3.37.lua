help(
[[

This module loads cfitsio 3.37.   CFITSIO is a library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format. CFITSIO provides simple high-level routines for reading and writing FITS files that insulate the programmer from the internal complexities of the FITS format. CFITSIO also provides many advanced features for manipulating and filtering the information in FITS files.

]])

whatis("Loads cfitsio 3.37")

local version = "3.37"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cfitsio/"..version

prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib"))

family('cfitsio')

