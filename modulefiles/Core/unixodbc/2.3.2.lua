help(
[[
This module loads unixODBC 2.3.2

The unixODBC Project goals are to develop and promote unixODBC to be the
definitive standard for ODBC on non MS Windows platforms. 

]])

whatis("Loads unixODBC libraries")
local version = "2.3.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/unixodbc/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('unixODBC')
