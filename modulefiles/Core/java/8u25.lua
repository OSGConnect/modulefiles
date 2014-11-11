help(
[[
This module loads JDK 8u25

The Java JDK provides binaries to compile and run java applications
]])

whatis("Loads Java JDK ")
local version = "8u25"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/java/jdk1.8.0_25"

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
setenv("JAVA_HOME", base)
family('jdk')
