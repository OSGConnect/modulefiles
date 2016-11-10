help(
[[
This module sets up the EL 7 modules for OASIS

]])

whatis("Sets up EL 7 modules for OASIS")
local version = "7"
family('distro')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"el",version)
prepend_path("MODULEPATH", mdir)

