help(
[[
SQLite is a software library that implements a self-contained, serverless, zero-configuration, transactional SQL database engine. SQLite is the most widely deployed database engine in the world. 
]])

whatis("Loads sqlite")

local version = "3.8.11.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/sqlite/"..version

prepend_path("PATH", pathJoin(base, "bin"))
family('sqlite')
