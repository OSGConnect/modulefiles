help(
[[
Parsl is a Python-based parallel scripting library that supports development and execution of asynchronous and parallel data-oriented workflows (dataflows) that glue together existing executables (called Apps) and functions. Building upon the Swift parallel scripting language, Parsl brings implicit parallel execution support to standard Python scripts. Rather than explicitly defining a graph and/or modifying data structures, instead developers simply annotate selected existing Python functions and Apps. Parsl constructs a dynamic, parallel execution graph derived from the implicit linkage between Apps based on shared input/output data objects. Parsl is resource-independent, that is, the same Parsl script can be executed on arbitrary computational resources from multicore processors through to clusters, clouds, and supercomputers.
]])

local version = "0.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-3.5/parsl"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64/python3.5/site-packages/ "))
prepend_path("LIBRARY_PATH", pathJoin(base, "lib64/python3.5/site-packages/ "))

load('gcc/6.2.0')
