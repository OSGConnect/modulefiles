help(
[[
Globus CLI, a standalone application that can be installed on the user’s machine and used to access the Globus service.

The CLI provides an interface to Globus services from the shell, and is suited to both interactive and simple scripting use cases. 

]])

local version = "1.2.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-2.7/globus-cli"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
