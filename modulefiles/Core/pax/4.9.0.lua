help(
[[
This module loads PAX 4.9.0 reconstruction code into the environment. 

]])

whatis("Loads the PAX reconstruction code")

local version = "4.9.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/pax-"..version
prepend_path("PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/pax-4.9.0/envs/pax/bin")
setenv("ROOTSYS", "")
setenv("CONDA_DEFAULT_ENV", "pax")
setenv("CONDA_ENV_PATH", pathJoin(base, "envs", "pax"))
family('pax')

