help(
[[
This module loads the connect client  into the environment.
The connect client is a setup of applications that allow users to
run jobs on the OSG Connect infrastructure from their local campus cluster.

]])

whatis("Loads the connect client tools")

local version = "0.5.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/connect-client/"..version

prepend_path("PATH", pathJoin(base, "bin"))

family('connectclient')
load('python/2.7', 'gcc')
load('all-pkgs')

