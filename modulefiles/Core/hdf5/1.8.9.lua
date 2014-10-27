help(
[[
This module loads HDF5 1.8.9

HDF5 is a library for storing and managing data in flexible, efficient file
format. See http://www.hdfgroup.org/HDF5/ for more information.

]])

whatis("Loads HDF5 libraries which provide support for reading and writing hdf5 files")
local version = "1.8.9"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/hdf5/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('hdf5')
