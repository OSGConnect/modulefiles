help(
[[
This module loads Mono 4.2.1 into the environment. Mono is a software platform
designed to allow developers to easily create cross platform applications. It is
an open source implementation of Microsoft's .NET Framework based on the ECMA
standards for C# and the Common Language Runtime.

]])

whatis("Loads the Mono software platform")

local version = "4.2.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mono/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("PKG_CONFIG_PATH", pathJoin(base, "lib", "pkgconfig"))
family('mono')
