
help(
[[
This module loads Healpix.3.30.HEALPix is an acronym for Hierarchical Equal Area isoLatitude Pixelation of a sphere. As suggested in the name, this pixelation produces a subdivision of a spherical surface in which each pixel covers the same surface area as every other pixel. 

]])

whatis("Loads Healpix 3.30")

local version = "3.30"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/Healpix/"..version

prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH",  pathJoin(base, "lib"))

pushenv("HEALPIX","/cvmfs/oasis.opensciencegrid.org/osg/modules/Healpix/3.30")
pushenv("HPX_CONF_DIR","/cvmfs/oasis.opensciencegrid.org/osg/modules/Healpix/3.30/confdir/3_30_Linux")

family('healpix')
load('gcc/4.9.2')

