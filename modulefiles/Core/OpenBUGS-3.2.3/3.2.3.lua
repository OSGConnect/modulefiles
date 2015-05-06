help(
[[
OpenBUGS is a software package for performing Bayesian inference Using Gibbs Sampling. The user specifies a statistical model, of (almost) arbitrary complexity, by simply stating the relationships between related variables. The software includes an ‘expert system’, which determines an appropriate MCMC (Markov chain Monte Carlo) scheme (based on the Gibbs sampler) for analysing the specified model. The user then controls the execution of the scheme and is free to choose from a wide range of output types.
]])
whatis("OpenBUGS is a software package for performing Bayesian inference Using Gibbs Sampling. ")
local version = "3.2.3"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/OpenBUGS-"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('OpenBUGS')

