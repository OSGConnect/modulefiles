help(
[[
This module loads ectools into the environment.  Ectools 
is a set of tools for error correction and working with 
long read data. ( https://github.com/jgurtowski/ectools )

]])

whatis("Loads the ectools scripts")

local version = "trunk"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ectools/"

prepend_path("PATH", base)

family('ectools')
