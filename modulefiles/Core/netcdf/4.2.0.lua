help(
[[
This module loads NetCDF 4.2.0

NetCDF is a set of software libraries and self-describing, machine-independent
data formats that support the creation, access, and sharing of array-oriented
scientific data.

]])

whatis("Loads NetCDF libraries which provide support for reading and writing files")
local version = "4.2.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/netcdf/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('netcdf')
