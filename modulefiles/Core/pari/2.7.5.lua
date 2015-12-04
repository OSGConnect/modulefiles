help(
[[
This module loads PARI 2.7.5

PARI/GP is a widely used computer algebra system designed for fast computations
in number theory (factorizations, algebraic number theory, elliptic curves...),
but also contains a large number of other useful functions to compute with
mathematical entities such as matrices, polynomials, power series, algebraic
numbers etc., and a lot of transcendental functions. 

]])

whatis("Loads PARI")
local version = "2.7.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/pari/"..version

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('pari')
