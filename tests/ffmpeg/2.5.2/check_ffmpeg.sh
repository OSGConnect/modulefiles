#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


FFMPEG_OUTPUT="ffmpeg version 2.5.2 Copyright (c) 2000-2014 the FFmpeg
developers
built on Dec 29 2014 16:19:47 with gcc 4.4.7 (GCC) 20120313 (Red Hat 4.4.7-3)
configuration:
--prefix=/cvmfs/oasis.opensciencegrid.org/osg/modules/ffmpeg/2.5.2
libavutil      54. 15.100 / 54. 15.100
libavcodec     56. 13.100 / 56. 13.100
libavformat    56. 15.102 / 56. 15.102
libavdevice    56.  3.100 / 56.  3.100
libavfilter     5.  2.103 /  5.  2.103
libswscale      3.  1.101 /  3.  1.101
libswresample   1.  1.100 /  1.  1.100"
FFMPEG_OUTPUT=`echo $FFMPEG_OUTPUT | perl -pe 's/\s+/ /g'`
source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load ffmpeg/2.5.2
output=`ffmpeg -version`
output=`echo $output | perl -pe 's/\s+/ /g'`

if [ "$output" != "$FFMPEG_OUTPUT" ];
then
  echo "Output doesn't match"
  echo "******** Binary output ***********"
  echo $output
  echo "******** Reference output ***********"
  echo $FFMPEG_OUTPUT
  exit 1
fi

echo "Test successful"

