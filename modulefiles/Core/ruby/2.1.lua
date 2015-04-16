help(
[[
A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
]])
whatis("A dynamic, open source programming language with a focus on simplicity and productivity.")
local version = "2.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ruby/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "share"))
prepend_path("PATH", pathJoin(base, "tool"))
prepend_path("PATH", pathJoin(base, "symbian"))
prepend_path("PATH", pathJoin(base, "spec"))
prepend_path("PATH", pathJoin(base, "cygwin"))
family('ruby')

