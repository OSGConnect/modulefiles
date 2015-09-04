help(
[[

The Collaborative Computational Project Number 4 in Protein Crystallography (CCP4)  exists to produce and support a world-leading, integrated suite of programs that allows researchers to determine macromolecular structures by X-ray crystallography, and other biophysical techniques. CCP4 aims to develop and support the development of cutting edge approaches to experimental determination and analysis of protein structure, and integrate these approaches into the suite. CCP4 is a community based resource that supports the widest possible researcher community, embracing academic, not for profit, and for profit research. CCP4 aims to play a key role in the education and training of scientists in experimental structural biology. It encourages the wide dissemination of new ideas, techniques and practice.
History and Constitution

]])

whatis("Loads ccp4 suit of programs")

local version = "2015"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/ccp4/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(base, "libexec"))
prepend_path("CPATH",  pathJoin(base, "include"))
family('ccp4')
