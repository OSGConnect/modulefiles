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
whatis("Loads LAMMPS, which stands for Large-Scale Atomic/Molecular Massively Parallel Simulator")
local version = "15May15"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/lammps/"..version
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "tools"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('lammps')
