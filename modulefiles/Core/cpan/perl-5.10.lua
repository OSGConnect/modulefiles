help(
[[
This module loads a variety of perl modules into the environment

The current module list includes:
Carp
Clone
Config::General
Cwd
Data::Dumper
Digest::MD5
File::Basename
File::Spec::Functions
File::Temp
FindBin
Font::TTF::Font
GD
GD::Image
Getopt::Long
IO::File
List::MoreUtils
List::Util
Math::Round
Math::Trig
Math::VecStat
Memoize
Params::Validate
Pod::Usage
POSIX
Readonly
Regexp::Common
Statistics::Basic
Storable
Sys::Hostname
Text::Balanced
Text::Format
Time::HiRes

]])

whatis("Loads cpan modules for perl 5.10")
local version = "5.10"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/cpan/perl-"..version
prepend_path("PERL5LIB", pathJoin(base, "share", "perl5"))
prepend_path("PERL5LIB", pathJoin(base, "lib64", "perl5"))
prepend_path("PERL5LIB", pathJoin(base, "lib", "perl5"))
load("gd/2.1.1")
family('cpan')
