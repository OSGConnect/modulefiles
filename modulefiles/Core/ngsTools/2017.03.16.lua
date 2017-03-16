
help(
[[
S (Next-Generation Sequencing) technologies have revolutionised population genetic research by enabling unparalleled data collection from the genomes or subsets of genomes from many individuals. 
ngsTools is a collection of programs for population genetics analyses from NGS data, taking into account its statistical uncertainty. The methods implemented in these programs do not rely on SNP or genotype calling, and are particularly suitable for low sequencing depth data. An application note illustrating its application has published (Fumagalli et al., 2014).
https://github.com/mfumagalli/ngsTools

]])

whatis("Loads the ngsTools")

local version = "2017.03.16"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ngsTools/"..version

prepend_path("PATH", pathJoin(base, "angsd"))
prepend_path("PATH", pathJoin(base, "htslib"))
prepend_path("PATH", pathJoin(base, "ngsDist"))
prepend_path("PATH", pathJoin(base, "ngsF"))
prepend_path("PATH", pathJoin(base, "ngsF-HMM"))
prepend_path("PATH", pathJoin(base, "ngsPopGen"))
prepend_path("PATH", pathJoin(base, "ngsSim"))
prepend_path("PATH", pathJoin(base, "ngsUtils"))
prepend_path("PATH", pathJoin(base, "ngsScripts"))


family('ngsTools')
load('zlib/1.2.8')
load('gsl/2.3')
load('hdf5/1.8.12')


