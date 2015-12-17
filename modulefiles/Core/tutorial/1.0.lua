help(
[[
Tutorial script for OSG Connect that lists and installs tutorial files.
This script assumes that any repo in the OSGConnect github repo that has
a name like tutorial-* is a tutorial file.

tutorial info modulename or tutorial --info modulename gives the description
stored on github for the appropriate tutorial

tutorial list or tutorial --list gives a list of available tutorials

tutorial modulename or tutorial --install modulename installs specified tutorial
]])
whatis("Tutorial script for OSG Connect that lists and installs tutorial files.")
local version = "1.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/tutorial/"..version
prepend_path("PATH", base)
family('tutorial')
load('python/2.7')
