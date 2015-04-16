help(
[[
UCLUST is a high-performance clustering, alignment and search algorithm that is capable of handling millions of sequences.
 
Applications include:
 
        Generating non-redundant protein and nucleotide sequence databases.
 
        OTU-picking by clustering 16S/18S rRNA sequences.
 
        Clustering reads from meta-genomic and environmental sequencing studies.
 
        Taxonomy assignment of sequences to curated databases such as Greengenes, RDP and SILVA.
 
        Phylogenetic analysis of very large sequence sets.
 
This is copyrighted software that is currently offered free for academic use.
 
]])
whatis("Loads uclust, which is a high-performance clustering, alignment and search algorithm")
local version = "2.22"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/uclust/"..version
prepend_path("PATH", base)
family('uclust')

