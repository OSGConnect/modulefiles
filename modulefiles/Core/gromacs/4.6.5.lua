help(
[[
This module loads a Gromacs 4.6.5 into the environment

]])

local version = "4.6.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gromacs/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('gromacs')
prereq('fftw/fftw-3.3.4-gromacs')
