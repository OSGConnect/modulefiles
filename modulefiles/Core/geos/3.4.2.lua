help(
[[
GEOS (Geometry Engine - Open Source) is a C++ port of the  Java Topology Suite (JTS). As such, it aims to contain the complete functionality of JTS in C++. This includes all the  OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced topology functions.
]])

local version = "3.4.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/geos/"..version
whatis("GEOS (Geometry Engine - Open Source) is a C++ port of the  Java Topology Suite (JTS)")
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "bin/bin"))
prepend_path("PATH", pathJoin(base, "bin/lib"))
family('geos')

