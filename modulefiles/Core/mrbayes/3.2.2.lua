help(
[[
MrBayes is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models. MrBayes uses Markov chain Monte Carlo (MCMC) methods to estimate the posterior distribution of model parameters.

]])

local version = "3.2.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/mrbayes/"..version
whatis("MrBayes is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models. ")
prepend_path("PATH", base)
family('mrbayes')
