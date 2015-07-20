help(
[[
Fiji is an image processing package. It can be described as a "batteries-included" distribution of ImageJ (and ImageJ2), bundling Java, Java3D and a lot of plugins organized into a coherent menu structure. Fiji compares to ImageJ as Ubuntu compares to Linux.
]])
whatis("Fiji is an image processing package with ImageJ.")
local version = "2.0"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/fiji/"..version
prepend_path("PATH", base)
prepend_path("PATH", pathJoin(base, "jars"))
prepend_path("PATH", pathJoin(base, "luts"))
prepend_path("PATH", pathJoin(base, "macros"))
prepend_path("PATH", pathJoin(base, "scripts"))
prepend_path("PATH", pathJoin(base, "retro"))
prepend_path("PATH", pathJoin(base, "java"))
family('Fiji')

