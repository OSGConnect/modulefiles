help(
[[
SHELX is a set of programs for the determination of small (SM) and macromolecular (MM) crystal structures by single crystal X-ray and neutron diffraction.
]])

whatis("Loads Shelx into the environment")

local version = "2015"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/Shelx/"..version

prepend_path("PATH", pathJoin(base))


family('Shelx')
