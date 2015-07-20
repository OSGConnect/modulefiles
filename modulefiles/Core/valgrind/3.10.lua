help(
[[
Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail. You can also use Valgrind to build new tools.

The Valgrind distribution currently includes six production-quality tools: a memory error detector, two thread error detectors, a cache and branch-prediction profiler, a call-graph generating cache and branch-prediction profiler, and a heap profiler. It also includes three experimental tools: a stack/global array overrun detector, a second heap profiler that examines how heap blocks are used, and a SimPoint basic block vector generator. It runs on the following platforms: X86/Linux, AMD64/Linux, ARM/Linux, ARM64/Linux, PPC32/Linux, PPC64/Linux, PPC64BE/Linux, S390X/Linux, MIPS32/Linux, MIPS64/Linux, ARM/Android (2.3.x and later), X86/Android (4.0 and later), MIPS32/Android, X86/Darwin and AMD64/Darwin (Mac OS X 10.9, with limited support for 10.8).
 
]])
whatis("Valgrind tools can automatically detect many memory management and threading bugs, and profile your programs in detail")
local version = "3.10"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/valgrind/"..version
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "coregrind"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))

family('valgrind')

