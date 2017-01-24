help(
[[
This module loads Freesurfer 5.3.0 into the environment. Freesurfer is
an open source software suite for processing and analyzing (human) brain 
MRI images. 

]])

whatis("Loads the freesurfer application")

local version = "6.0.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/freesurfer/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "mni", "bin"))
prepend_path("PATH", pathJoin(base, "fsl", "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
pushenv("FREESURFER_HOME", base)
pushenv("SUBJECTS_DIR", pathJoin(base, "subjects"))
pushenv("FUNCTIONALS_DIR", pathJoin(base, "sessions"))

pushenv("FSFAST_HOME", pathJoin(base, "fsfast"))
pushenv("FMRI_ANALYSIS_DIR", pathJoin(base, "fsfast"))
pushenv("FSF_OUTPUT_FORMAT", "nii.gz")

pushenv("FSL_DIR", pathJoin(base, "fsl"))
pushenv("FSL_BIN", pathJoin(base, "fsl", "bin"))
pushenv("FSLOUTPUTTYPE", "NIFTI_GZ")

pushenv("MNI_DIR", pathJoin(base, "mni"))
pushenv("MINC_BIN_DIR", pathJoin(base, "mni", "bin"))
pushenv("MINC_LIB_DIR", pathJoin(base, "mni", "lib"))
pushenv("MNI_DATAPATH", pathJoin(base, "mni", "data"))
pushenv("MNI_PERL5LIB", pathJoin(base, "mni", "lib", "perl5", "5.8.5"))
prepend_path("PERL5LIB", pathJoin(base, "mni", "lib", "perl5", "5.8.5"))

pushenv("FIX_VERTEX_AREA", "1")
family('freesurfer')
