help(
[[
This module loads opensim 3.3. 
]])

whatis("Loads simbody 3.3 ")

local version = "3.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/opensim/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("PATH",  pathJoin(base, "sdk"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib"))

family('opensim')
load('gcc/4.9.2')
load('libgfortran/4.4.7')
load('gmp/6.0.0')
load('lapack/3.6.1')
load('simbody/3.5.3')
