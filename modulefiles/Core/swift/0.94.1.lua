help(
[[
Swift is a data-oriented coarse grained scripting language that supports dataset typing and mapping, dataset iteration, conditional branching, and procedural composition.
Swift programs (or workflows) are written in a language called Swift scripts.
]])
whatis(" Swift programs (or workflows) are written in a language called Swift scripts.")
local version = "0.94.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/swift/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "libexec"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "libexec"))
family('swift')

