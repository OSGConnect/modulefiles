help(
[[
This module loads Python 3.4.1 with a set of packages needed for
the Xenon1T PAX code

]])

local version = "3.4.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-3.4/xenon1t"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))

load('atlas/3.10.1', 'lapack', 'hdf5/1.8.13', 'llvm/3.6', 'gcc/4.9.2', 'root/5.34-32-py34', 'snappy/1.1.3')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Python",version)
prepend_path("MODULEPATH", mdir)
