help(
[[
]])
whatis("")
local version = "2.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/protobuf/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", base.."/lib")
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('protobuf')

