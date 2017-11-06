Here we have the code and the database file for updating the list of modules on osg connect. See the output from the file 
`alpha_list.md`. 

~~~
$ python extract_module_information.py (compares the list of modules in module_db.data and the list of modules under cvmfs path)

tag4 20
tag5 72
tag0 25
tag1 19
tag2 10
tag3 28
============================================================
total modules=  174
============================================================
missing module in module_db.data=  EINSTEIN
missing module in module_db.data=  PRODIGAL
missing module in module_db.data=  SPARSE
missing module in module_db.data=  RAXML-NG
============================================================
Number of Missing Modules=  4
~~~

Update the file  `module_db.data` based on the above output. Add description and tag for the missing modules. 

Rerun the python code again. Copy the resulting file `alpha_list.md` in the helpdesk article. 
