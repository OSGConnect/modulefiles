help(
[[
FSL is a comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data. It runs on Apple and PCs (both Linux, and Windows via a Virtual Machine), and is very easy to install. Most of the tools can be run both from the command line and as GUIs ("point-and-click" graphical user interfaces). 
]])

whatis("Loads FSL into the environment")

local version = "5.0.8"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/fsl/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "data"))
prepend_path("PATH", pathJoin(base, "extra"))
prepend_path("PATH", pathJoin(base, "etc"))
prepend_path("PATH", pathJoin(base, "tcl"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))


family('fsl')

