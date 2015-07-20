help(
[[
Poppler is a PDF rendering library based on the xpdf-3.0 code base
bin:
pdfdetach  pdffonts  pdfimages	pdfinfo  pdfseparate  pdftohtml  pdftoppm  pdftops  pdftotext  pdfunite

]])
whatis("Poppler is a PDF rendering library based on the xpdf-3.0 code base")
local version = "0.24.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/poppler/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PATH", pathJoin(base, "utils"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
family('poppler')
