help(
[[
The NCBI SRA Toolkit enables reading ("dumping") of sequencing files from the SRA database and writing ("loading") files into the .sra format 

]])

whatis("Loads sra suit of programs")

local version = "2.5.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/sra/"..version

prepend_path("PATH", pathJoin(base, "bin"))
family('sra')
