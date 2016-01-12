help(
[[
This module loads xz 5.2.2 into the environment.  XZ Utils is free
general-purpose data compression software with a high compression ratio. XZ
Utils were written for POSIX-like systems, but also work on some not-so-POSIX
systems. XZ Utils are the successor to LZMA Utils.

]])

whatis("Loads the xz compression software")

local version = "5.2.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/xz/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('xz')
