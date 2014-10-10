help(
[[

This is the LAMMPS software package.

LAMMPS stands for Large-scale Atomic/Molecular Massively Parallel
Simulator.

Copyright (2003) Sandia Corporation.  Under the terms of Contract
DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
certain rights in this software.  This software is distributed under
the GNU General Public License.

]])
whatis("Loads LAMMPS, which stands for Large-Scale Atomic/Molecular Massively Parallel")
local version = "2.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/lammps/"..version
prepend_path("PATH", base)
family('lammps')

