help(
[[
This module loads bitstring 3.1.5 into the environment. bitstring is a pure
Python module designed to help make the creation and analysis of binary data as
simple and natural as possible.

]])

whatis("Loads bitstring 3.1.5")

local version = "3.1.5"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/bitstring/"..version

prepend_path("PYTHONPATH", base)

family('bitstring')
