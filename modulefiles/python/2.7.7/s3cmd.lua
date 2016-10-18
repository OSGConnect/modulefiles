help(
[[
S3cmd is a free command line tool and client for uploading, retrieving and managing data in Amazon S3 and other cloud storage service providers that use the S3 protocol, such as Google Cloud Storage or DreamHost DreamObjects. It is best suited for power users who are familiar with command line programs. It is also ideal for batch scripts and automated backup to S3, triggered from cron, etc.
]])

local version = "1.6.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/virtualenv-2.7/s3cmd"

pushenv("VIRTUAL_ENV", base)
prepend_path("PATH", pathJoin(base, "bin"))
pushenv("PYTHONHOME", base)

-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Python",version)
prepend_path("MODULEPATH", mdir)
