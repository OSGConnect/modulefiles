help(
[[
CP2K: A general program to perform molecular dynamics simulations         
   Copyright (C) 2000, 2001, 2002, 2003  CP2K developers group          
   Copyright (C) 2004, 2005, 2006, 2007  CP2K developers group         
   Copyright (C) 2008, 2009, 2010, 2011  CP2K developers group        
   Copyright (C) 2012, 2013              CP2K developers group               
                                                                             
   This program is free software; you can redistribute it and/or modify      
   it under the terms of the GNU General Public License as published by      
   the Free Software Foundation; either version 2 of the License, or         
   (at your option) any later version.                              

   CP2K, including its sources and pointers to the authors                   
   can be found at  http://www.cp2k.org/ 

]])
whatis("Loads CP2K, which is a first-principles molecular dynamics package")
local version = "2.5.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cp2k/"..version
prepend_path("PATH", base)
family('cp2k')


