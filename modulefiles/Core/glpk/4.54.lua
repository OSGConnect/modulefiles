help(
[[
This module loads GLPK 4.54

The GNU Linear Programming Kit (GLPK) is a library for solving linear
programming problems. See http://www.gnu.org/software/glpk/ for more 
information.

]])

whatis("Loads the GLPK library for linear programming functions")

local version = "4.54"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/glpk/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('glpk')
