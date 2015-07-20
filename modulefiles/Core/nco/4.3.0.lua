help(
[[
This module loads NCO 4.3.0

The NCO toolkit manipulates and analyzes data stored in netCDF-accessible
formats, including DAP, HDF4, and HDF5. 

]])

whatis("Loads NCO toolkit ")
local version = "4.3.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/nco/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('nco')
load('hdf5/1.8.9')
load('netcdf/4.2.0')
load('udunits/2.2.17')

