help(
[[
This module loads PAX 4.9.1 reconstruction code into the environment. 

]])

whatis("Loads the PAX reconstruction code")

local version = "4.9.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/"
prepend_path("PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/envs/pax-"..version.."/bin")
setenv("ROOTSYS", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/envs/pax-"..version)
setenv("CONDA_DEFAULT_ENV", "pax")
setenv("CONDA_ENV_PATH", pathJoin(base, "envs", "pax"..version))
family('pax')

