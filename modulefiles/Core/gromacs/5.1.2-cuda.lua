help(
[[
This module loads Gromacs 5.1.2 with cuda support into 
the environment. Gromacs is a molecular dynamics application.

]])

whatis("Loads the Gromacs molecular dynamics simulator")

local version = "5.1.2-cuda"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gromacs/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))

family('gromacs')
load('atlas/3.10.2')
load('lapack')
load('gcc/4.8.1')
load('llvm/3.6')
