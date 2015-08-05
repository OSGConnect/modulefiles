help(
[[
elastix is open source software, based on the well-known Insight Segmentation and Registration Toolkit (ITK). The software consists of a collection of algorithms that are commonly used to solve (medical) image registration problems. The modular design of elastix allows the user to quickly configure, test, and compare different registration methods for a specific application. A command-line interface enables automated processing of large numbers of data sets, by means of scripting.
]])

whatis("Loads elastix into the environment")

local version = "2015"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/elastix/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))


family('elastix')

