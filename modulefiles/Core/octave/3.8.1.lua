help(
[[
This module loads Octave 3.8.1 into the environment.  Octave provides an open
source alternative to matlab that is mostly compatible.

]])

whatis("Loads Octave, an open source alternative to matlab")
local version = "3.8.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/octave/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('octave')
load('fftw/3.3.4')
load('atlas/3.10.1')
load('lapack')
load('hdf5/1.8.12')
load('qhull')
load('pcre')
load('SparseSuite/4.2.1')
load('glpk/4.54')
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
