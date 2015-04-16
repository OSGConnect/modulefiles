help(
[[
SUNDIALS (SUite of Nonlinear and DIfferential/ALgebraic equation Solvers) consists of the following five solvers: 

CVODE	solves initial value problems for ordinary differential equation (ODE) systems.
CVODES	solves ODE systems and includes sensitivity analysis capabilities (forward and adjoint).
IDA	solves initial value problems for differential-algebraic equation (DAE) systems.
IDAS	solves DAE systems and includes sensitivity analysis capabilities (forward and adjoint).
KINSOL	solves nonlinear algebraic systems.

]])
whatis("SUNDIALS (SUite of Nonlinear and DIfferential/ALgebraic equation Solvers) ")
local version = "2.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/sundials/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH", base)
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('sundials')

