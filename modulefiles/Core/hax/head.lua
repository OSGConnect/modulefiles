help(
[[
This module loads HAX code into the environment. 

]])

whatis("Loads the HAX analysis code")

local version = "head"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0"
prepend_path("PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/envs/hax-"..version.."/bin")
prepend_path("PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/hax-"..version.."/envs/hax/bin")
setenv("ROOTSYS", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/envs/hax-"..version)
setenv("CONDA_DEFAULT_ENV", "hax-head")
setenv("CONDA_ENV_PATH", pathJoin(base, "envs", "hax-head"))
family('hax')



