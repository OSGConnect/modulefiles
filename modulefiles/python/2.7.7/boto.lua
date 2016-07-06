help(
[[

Boto is a Python package that provides interfaces to Amazon Web Services. 
This module loads Python 2.7.7 with a set of packages for needed for the boto

]])

local version = "2.7.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-2.7/boto"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
pushenv("PYTHONHOME", base)

load('atlas/3.10.1', 'lapack', 'hdf5/1.8.13')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Python",version)
prepend_path("MODULEPATH", mdir)
