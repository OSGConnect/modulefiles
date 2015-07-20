help(
[[
A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
]])
whatis("A dynamic, open source programming language with a focus on simplicity and productivity.")
local version = "2.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ruby/"..version
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('ruby')

