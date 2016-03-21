help(
[[
The IRIS DMC distributes the Seismic Analysis Code (SAC) software for scientists conducting research using IRIS data.
]])

whatis("Loads sac 10.1.6a")

local version = "10.1.6a"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/sac/"..version

prepend_path("PATH",  pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))

pushenv("SACHOME","/cvmfs/oasis.opensciencegrid.org/osg/modules/sac/10.1.6a")
pushenv("SACAUX","/cvmfs/oasis.opensciencegrid.org/osg/modules/sac/10.1.6a/aux")

