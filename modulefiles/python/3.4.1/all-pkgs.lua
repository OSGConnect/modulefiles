help(
[[
This module loads Python 3.4.1 with a set of popular packages for scientific
computing (Numpy, matplotlib, Scipy, pandas, nltk)

]])

local version = "3.4.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-3.4/all"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))

-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Python",version)
prepend_path("MODULEPATH", mdir)

