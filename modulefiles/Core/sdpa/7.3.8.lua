help(
[[
"SDPA (SemiDefinite Programming Algorithm)" is one of the most efficient 
and stable software packages for solving SDPs based on the primal-dual 
interior-point method. It fully exploits the sparsity of given problems.
]])
whatis("SDPA (SemiDefinite Programming Algorithm) is an efficient software packages for solving SDPs ")
local version = "7.3.8"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/sdpa/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH", base)
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('sdpa')

