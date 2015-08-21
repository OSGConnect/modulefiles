help(
[[
This module loads Freesurfer 5.3.0 into the environment. Freesurfer is
an open source software suite for processing and analyzing (human) brain 
MRI images. 

]])

whatis("Loads the freesurfer application")

local version = "5.3.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/freesurfer/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
pushenv("FREESURFER_HOME", base)
pushenv("SUBJECTS_DIR", pathJoin(base, "subjects"))
pushenv("FUNCTIONALS_DIR", pathJoin(base, "sessions"))
family('freesurfer')
