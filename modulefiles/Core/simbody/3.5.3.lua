help(
[[
This module loads simbody 3.5.3. 
]])

whatis("Loads simbody 3.5.3 ")

local version = "3.5.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/simbody/"..version

prepend_path("CPATH",  pathJoin(base, "include/simbody"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib64"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib64"))

family('simbody')
load('gcc/4.9.2')
load('libgfortran/4.4.7')
load('gmp/6.0.0')
load('lapack/3.6.1')
