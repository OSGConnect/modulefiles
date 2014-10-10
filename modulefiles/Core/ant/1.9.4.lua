help(
[[
This module loads Ant 1.9.4 into the environment.  Ant is a java 
based build system.

]])

whatis("Loads the Ant build system into the environment")

local version = "1.9.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ant/"..version

prepend_path("PATH", pathJoin(base, "bin"))
pushenv('ANT_HOME', base)

family('ant')
