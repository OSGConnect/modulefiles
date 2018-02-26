help(
[[
This module loads Python 2.7.7 with rucio 1.14.2 

]])

local version = "2.7.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-2.7/rucio-1.14.2"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
pushenv("PYTHONHOME", base)
setenv("RUCIO_HOME", pathJoin(base, "rucio"))

-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Python",version)
prepend_path("MODULEPATH", mdir)

