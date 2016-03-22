help(
[[
This module loads PAX 4.6.1 reconstruction code into the environment. 

]])

whatis("Loads the PAX reconstruction code")

local version = "4.6.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/pax-"..version
prepend_path("PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/pax-4.6.1/envs/pax/bin")
setenv("ROOTSYS", "")
setenv("CONDA_DEFAULT_ENV", "pax")
setenv("CONDA_ENV_PATH", pathJoin(base, "envs", "pax"))
family('pax')

