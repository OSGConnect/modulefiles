help(
[[
Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF. While each individual tool is designed to do a relatively simple task (e.g., intersect two interval files), quite sophisticated analyses can be conducted by combining multiple bedtools operations on the UNIX command line.
]])
whatis("bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks.")
local version = "2.21"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/bedtools/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "scripts"))
family('bedtools')

