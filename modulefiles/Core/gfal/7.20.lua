help(
[[
This module loads GFAL2 7.20 into the environment. GFAL2 is
a set of file access utilities.

]])

whatis("Loads the GFAL2 tools")

local version = "7.20"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gfal/"..version

setenv('GFAL_CONFIG_DIR', pathJoin(base, "etc", "gfal2.d"))
setenv('GFAL_PLUGIN_DIR', pathJoin(base, "usr", "lib64", "gfal2-plugins"))
setenv('GLOBUS_LOCATION', pathJoin(base, "usr"))
setenv('X509_CERT_DIR', '/cvmfs/oasis.opensciencegrid.org/osg-software/osg-wn-client/3.3/current/el6-x86_64/etc/grid-security/certificates/')
setenv('X509_VOMS_DIR', '/cvmfs/oasis.opensciencegrid.org/osg-software/osg-wn-client/3.3/current/el6-x86_64/etc/grid-security/vomsdir/')
setenv('VOMS_USERCONF', '/cvmfs/oasis.opensciencegrid.org/osg-software/osg-wn-client/3.3/current/el6-x86_64/etc/vomses')


prepend_path("PATH", pathJoin(base, "usr", "bin"))

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "usr", "lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "usr", "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "usr", "lib", "dcap"))

prepend_path("PYTHONPATH", pathJoin(base, "usr", "lib", "python2.6", "site-packages"))
prepend_path("PYTHONPATH", pathJoin(base, "usr", "lib64", "python2.6", "site-packages"))

prepend_path("PERL5LIB", pathJoin(base, "usr", "share", "perl5", "vendor_perl"))
prepend_path("PERL5LIB", pathJoin(base, "usr", "share", "perl5"))
prepend_path("PERL5LIB", pathJoin(base, "usr", "lib64", "perl5", "vendor_perl"))
prepend_path("PERL5LIB", pathJoin(base, "usr", "lib", "perl5"))

family('gfal')
