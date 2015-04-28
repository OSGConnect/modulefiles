help(
[[
SIESTA is both a method and its computer program implementation, to perform efficient electronic structure calculations and ab initio molecular dynamics simulations of molecules and solids. SIESTA's efficiency stems from the use of strictly localized basis sets and from the implementation of linear-scaling algorithms which can be applied to suitable systems. A very important feature of the code is that its accuracy and cost can be tuned in a wide range, from quick exploratory calculations to highly accurate simulations matching the quality of other approaches, such as plane-wave and all-electron methods.

]])




local version = "3.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/siesta/"..version
whatis("SIESTA is both a method and its computer program implementation, to perform efficient electronic structure calculations and ab initio molecular dynamics simulations of molecules and solids.  ")
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "Obj"))
prepend_path("PATH", pathJoin(base, "Pseudo"))
prepend_path("PATH", pathJoin(base, "Util"))
family('siesta')