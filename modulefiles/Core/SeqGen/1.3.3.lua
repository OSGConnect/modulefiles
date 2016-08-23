help(
[[
Seq-Gen is a program that will simulate the evolution of nucleotide or amino acid sequences along a phylogeny, using common models of the substitution process. A range of models of molecular evolution are implemented including the general reversible model. State frequencies and other parameters of the model may be given and site-specific rate heterogeneity may also be incorporated in a number of ways. Any number of trees may be read in and the program will produce any number of data sets for each tree. Thus large sets of replicate simulations can be easily created. It has been designed to be a general purpose simulator that incorporates most of the commonly used (and computationally tractable) models of molecular sequence evolution.

]])

whatis("Seq-Gen is a program that will simulate the evolution of nucleotide or amino acid sequences along a phylogeny ")

local version = "1.3.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/SeqGen/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))

family('SeqGen')


