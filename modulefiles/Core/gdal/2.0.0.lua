help(
[[
This module loads GDAL 2.0.0

GDAL is a translator library for raster and vector geospatial data formats that is
released under an X/MIT style Open Source license by the Open Source Geospatial
Foundation.

]])

whatis("Loads GDAL libraries")
local version = "2.0.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gdal/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('gdal')
