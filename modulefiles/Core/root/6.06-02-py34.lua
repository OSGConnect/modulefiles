help(
[[
This module loads ROOT 6.06-02 with python 3.4 support into the environment. ROOT is a 
physics analysis application.

]])

whatis("Loads the ROOT data analysis environmemt")

local version = "6.06-02-py34"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/root/"..version
pushenv("ROOTSYS", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib/root"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
prepend_path("PYTHONPATH", pathJoin(base, "lib", "root"))
d('fftw/3.3.4-gromacs')
load('gcc/4.9.2')
family('root')
