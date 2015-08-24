help(
[[
This module loads SAGA 2.2.0.  SAGA is a GIS application

]])

whatis("Loads the SAGA GIS application")

local version = "2.2.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/saga/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PYTHON_PATH", pathJoin(base,
                                     "lib64",
                                     "python2.6",
                                     "site-packages"))

family('saga')
load('proj/4.9.1')
load('wxgtk/3.0.2')
load('unixodbc/2.3.2')
load('gdal/2.0.0')
load('jasper/1.900.1')
