help(
[[
This module loads Python 2.7.7 with a set of packages for needed for the 
PSIMS (numpy, h5py, netcdf4)

]])

local version = "2.7.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-2.7/psims"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
pushenv("PYTHONHOME", base)

prereq('atlas', 'lapack', 'netcdf/4.2.0', 'hdf5/1.8.9')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Python",version)
prepend_path("MODULEPATH", mdir)

