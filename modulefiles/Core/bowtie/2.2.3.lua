help(
[[

Bowtie is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small: typically about 2.2 GB for the human genome (2.9 GB for paired-end).
]])
whatis("bowtie is an ultrafast, memory-efficient short read aligner.")
local version = "2.2.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/bowtie/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "scripts"))
prepend_path("PATH", pathJoin(base, "third_party"))
family('bowtie')


