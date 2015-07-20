help(
[[
This module loads PCRE 8.35 libraries. The Perl Compatible Regular Expressions library
provides functions for running regexes on strings using perl compatible syntax.

]])

whatis("Loads the PCRE library for running perl compatible regexes")

local version = "8.35"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/pcre/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", base.."/lib")
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('pcre')
