help(
[[
This module loads R 3.3.1 into the environment

]])

whatis("Loads R, a tool for statistical analysis")
local version = "3.3.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/R/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("LIBRARY_PATH", pathJoin(base, "lib64"))

load('libicu/4.2.1')
load('gcc/4.9.2')
load('zlib/1.2.8')
load('libgfortran/4.4.7')
load('pcre/8.35')
load('mpfr/3.1.3')
load('mpc/1.0.3')
load('xz/5.2.2')
load('curl/7.37.1')
load('gmp/6.0.0')
load('bzip2/1.0.6')
family('R')
