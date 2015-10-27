help(
[[
This module loads Circos 0.68

Circos is a software package for visualizing data and information. It visualizes
data in a circular layout — this makes Circos ideal for exploring relationships
between objects or positions. There are other reasons why a circular layout is
advantageous, not the least being the fact that it is attractive.


]])

whatis("Loads Circos")
local version = "0.68"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/circos/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PERL5LIB", pathJoin(base,"lib"))
load('cpan/perl-5.10')
family('circos')
