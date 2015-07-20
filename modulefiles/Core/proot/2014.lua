help(
[[
PRoot is a user-space implementation of chroot, mount --bind, and binfmt_misc. This means that users don't need any
privileges or setup to do things like using an arbitrary directory as the new root filesystem, making files accessible
somewhere else in the filesystem hierarchy, or executing programs built for another CPU architecture transparently
through QEMU user-mode
]])
whatis("PRoot is a user-space implementation of chroot, mount --bind, and binfmt_misc. ")
local version = "2014"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/proot/"..version
prepend_path("PATH", base)
family('proot')

