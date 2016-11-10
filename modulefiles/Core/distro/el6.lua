help(
[[
This module sets up the EL 6 modules for OASIS

]])

whatis("Sets up EL 6 modules for OASIS")
local version = "6"
family('distro')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"el",version)
prepend_path("MODULEPATH", mdir)

