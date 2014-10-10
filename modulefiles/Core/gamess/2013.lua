help(
[[

This is the GAMESS package.  GAMESS is an abbreviation for General Atomic and Molecular Electronic Structure System. 
literature citations:

   "General Atomic and Molecular Electronic Structure System"
   M.W.Schmidt, K.K.Baldridge, J.A.Boatz, S.T.Elbert,
   M.S.Gordon, J.H.Jensen, S.Koseki, N.Matsunaga,
   K.A.Nguyen, S.J.Su, T.L.Windus, M.Dupuis, J.A.Montgomery
   J.Comput.Chem. 14, 1347-1363(1993)
   doi:10.1002/jcc.540141112


   "Advances in electronic structure theory:
    GAMESS a decade later"
   M.S.Gordon, M.W.Schmidt
   Chapter 41, pp 1167-1189, in
    "Theory and Applications of Computational Chemistry, the first forty years"
   C.E.Dykstra, G.Frenking, K.S.Kim, G.E.Scuseria, editors
   Elsevier, Amsterdam, 2005.

http://www.msg.chem.iastate.edu/GAMESS/GAMESS.html



]])
whatis("Loads GAMESS, which stands for General Atomic and Molecular Electronic Structure System")
local version = "2013"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/gamess/"..version
prepend_path("PATH", base)
family('gamess')


