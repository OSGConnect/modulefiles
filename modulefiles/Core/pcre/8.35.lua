help(
[[
This module loads PCRE 8.35. (Perl Compatible Regular Expressions library) 

]])

local version = "8.35"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/pcre/"..version

prepend_path("LD_LIBRARY_PATH", base)
family('pcre')
