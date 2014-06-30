help(
[[
This module loads Python 2.7.7 with a set of popular packages for scientific
computing (Numpy, matplotlib, Scipy, pandas, nltk)

]])

local version = "2.7.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-2.7/all"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
pushenv("PYTHONHOME", base)

prereq('atlas', 'lapack')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Python",version)
prepend_path("MODULEPATH", mdir)

