help(
[[
This module loads a clean install of Python 2.7.7

]])

local version = "2.7.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/python-"..version

prepend_path("PATH", pathJoin(base, "bin"))


-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"python",version)
prepend_path("MODULEPATH", mdir)

