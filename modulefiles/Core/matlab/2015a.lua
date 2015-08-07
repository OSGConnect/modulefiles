help(
[[
MATLAB Compiler Runtime r2015a.
-------------------------------

This module loads a standalone set of libraries for executing MATLAB code.

The MCR is freely distributable as described by the license file located at:
  /cvmfs/oasis.opensciencegrid.org/osg/modules/matlab/2015a/v85/MCR_license.txt

]])

local version = "2015a"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/matlab/"..version.."/v85"

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "runtime/glnxa64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "bin/glnxa64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "sys/os/glnxa64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "sys/java/jre/glnxa64/jre/lib/amd64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "sys/java/jre/glnxa64/jre/lib/amd64/headless"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "sys/java/jre/glnxa64/jre/lib/amd64/jli"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "sys/java/jre/glnxa64/jre/lib/amd64/server"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "sys/java/jre/glnxa64/jre/lib/amd64/xawt"))
family('matlab')
