help(
[[
This module loads a clean install of Python 2.7.7.

]])

whatis("Loads a clean installation of the python 2.7.7 interpreter")
local version = "2.7.7"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/python-"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('python')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"python",version)
prepend_path("MODULEPATH", mdir)

