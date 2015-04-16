help(
[[
]])
whatis("")
local version = "2.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/protobuf/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "include"))
family('protobuf')

