help(
[[
Ab Initio macromolecular phasing has been traditionally limited to small proteins at atomic resolution (1.2Å or better unless heavy atoms are present). ARCIMBOLDO constitutes a general method for 2Å data, based on combination of location of model fragments like small α-helices with PHASER and density modification with SHELXE, distributed over a grid of computers. 
]])

whatis("Loads ARCIMBOLDO_LITE into the environment")

local version = "2015"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/arc-lite/"..version

prepend_path("PATH", pathJoin(base))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "libraries"))


family('ARCIMBOLDO_LITE')
