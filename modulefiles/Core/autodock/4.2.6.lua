help(
[[
AutoDock is a suite of automated docking tools. It is designed to
predict how small molecules, such as substrates or drug candidates,
bind to a receptor of known 3D structure.

]])
whatis("autodock, is a suite of automated docking tools")
local version = "4.2.6"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/autodock/"..version
prepend_path("PATH", base)
family('autodock')

