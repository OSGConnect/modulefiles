help(
[[
This module loads libffi 

The libffi library provides a portable, high level programming interface to
various calling conventions. This allows a programmer to call any function
specified by a call interface description at run-time. 

]])

whatis("Loads the libffi library for portable foreign function calls")

local version = "3.2.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/libffi/"..version

prepend_path("LD_LIBRARY_PATH", base)
family('libffi')
