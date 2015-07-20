help(
[[
Open Babel is a chemical toolbox designed to speak the many languages of chemical data. It's an open, collaborative
project allowing anyone to search, convert, analyze, or store data from molecular modeling, chemistry, solid-state
materials, biochemistry, or related areas.
]])
whatis("Open Babel is a chemical toolbox designed to speak the many languages of chemical data.")
local version = "2.3.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/openbabel/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "include"))
prepend_path("PATH", pathJoin(base, "lib"))
prepend_path("PATH", pathJoin(base, "scripts"))
prepend_path("PATH", pathJoin(base, "tools"))
prepend_path("PATH", pathJoin(base, "share"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('openbabel')

