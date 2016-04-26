help(
[[
This module loads CAX code into the environment. 

]])

whatis("Loads the CAX reconstruction code")

local version = "head"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0"
prepend_path("PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/envs/cax"..version.."/bin")
setenv("CONDA_DEFAULT_ENV", "cax-head")
setenv("CONDA_ENV_PATH", pathJoin(base, "envs", "cax-head"))
family('cax')

