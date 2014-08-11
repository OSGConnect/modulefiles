help(
[[
This module loads  Octace 3.8.1 into the environment

]])

local version = "3.8.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/octave/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('octave')
prereq('fftw/3.3.4', 'atlas', 'lapack', 'hdf5', 'qhull', 'pcre', 'SparseSuite', 'glpk')
