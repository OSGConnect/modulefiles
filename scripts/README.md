scripts
===========

The following scripts are provided to make publishing to OASIS easier

fix_perms - script to check and fix permissions on files being published, it
will make files world and group readable.  If the file has 700 permissions, the
script will also add world and group executable bits as well.  Finally
directories will be changes so that they are world and group
readable/executable.

prep_modulefiles - script to generate a tarball of the latest modulefiles in the github repo.  Run the script, copy the tarball to the oasis machine and then untar the files while in the /stage/oasis/osg/modules/modulefiles directory.

update_timestamps - script to go through a directory and subdirectories and
update the mtime to the current time, will also update symlink mtimes as well
