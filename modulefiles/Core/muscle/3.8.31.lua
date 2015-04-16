help(
[[
MUSCLE stands for MUltiple Sequence Comparison by Log- Expectation. MUSCLE is claimed to achieve both better average accuracy and better speed than ClustalW2 or T-Coffee, depending on the chosen options. 
]])
whatis("MUSCLE stands for MUltiple Sequence Comparison by Log- Expectation.")
local version = "3.8.31"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/muscle/"..version
prepend_path("PATH", base)
family('muscle')

