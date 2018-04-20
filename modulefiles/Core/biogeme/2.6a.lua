help(
[[
This module loads Biogeme 2.6a into the environment. 
Biogeme is an open source freeware designed for the maximum likelihood
estimation of parametric models in general, with a special emphasis on discrete
choice models.

]])

whatis("Loads the biogeme scripts")

local version = "2.6a"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/biogeme/"..version

prepend_path("PATH", base)
load("python/3.5.2")
load("gcc/6.2.0")
load("ipopt/3.12.6")
family('biogeme')
