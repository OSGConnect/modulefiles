help(
[[
SCons is a build system (build tool, make tool or software construction tool) written in pure Python. SCons uses Python scripts as "configuration files" for software builds. Based on the design that won the Software Carpentry build tool competition, SCons solves a number of problems associated with build automation, especially with the classic and ubiquitous Make itself.

]])
whatis("SCons is a build system (build tool, make tool or software construction tool) written in pure Python.")
local version = "2.3.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/scons/"..version
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('scons')

