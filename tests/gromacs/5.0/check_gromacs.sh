#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load fftw/fftw-3.3.4-gromacs 
module load atlas
module load lapack
module load gromacs/5.0.0
cd input_files
mdrun -s topol.tpr -dn index.ndx
mv traj.trr ..

