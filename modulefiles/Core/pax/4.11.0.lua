help(
[[
This module loads PAX 4.11.0 reconstruction code into the environment. In
addition, HAX 0.3.1 and CAX 2.0.3 are loaded as well.

]])

whatis("Loads the Xenon1T PAX, CAX, and HAX tools")

local version = "4.11.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/"
prepend_path("PATH", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/envs/pax-"..version.."/bin")
setenv("ROOTSYS", "/cvmfs/oasis.opensciencegrid.org/osg/modules/anaconda/2.4.0/envs/pax-"..version)
setenv("CONDA_DEFAULT_ENV", "pax")
setenv("CONDA_ENV_PATH", pathJoin(base, "envs", "pax"..version))
family('pax')

