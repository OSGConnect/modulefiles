help(
[[
This module loads Gnuplot 4.6.5 into the environment. Gnuplot is a
set of tools for creating plots of data.

]])

whatis("Loads the gnuplot plotting software")

local version = "4.6.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gnuplot/"..version

pepend_path("PATH", pathJoin(base, "bin"))

family('gnuplot')
