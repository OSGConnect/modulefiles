help(
[[
PAPI provides the tool designer and application engineer with a consistent interface and methodology for use of the
performance counter hardware found in most major microprocessors. PAPI enables software engineers to see, in near
real time, the relation between software performance and processor events.
]])
local version = "5.3.2"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/papi/"..version
whatis("PAPI enables software engineers to seethe relation between software performance and processor events.")
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH", base.."/include")
prepend_path("LIBRARY_PATH", base.."/lib")
family('papi')



