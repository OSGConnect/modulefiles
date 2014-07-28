help(
[[
This module loads HDF5 1.8.13

HDF5 is a library for storing and managing data in flexible, efficient file
format. See http://www.hdfgroup.org/HDF5/ for more information.

]])

local version = "1.8.13"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/hdf5/"..version

prepend_path("LD_LIBRARY_PATH", base)
family('hdf5')
