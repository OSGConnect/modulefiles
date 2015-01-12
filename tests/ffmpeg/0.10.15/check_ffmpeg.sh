#!/bin/bash

hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"


FFMPEG_OUTPUT="ffmpeg version 0.10.15
built on Dec 30 2014 10:26:28 with gcc 4.4.7 20120313 (Red Hat 4.4.7-3)
configuration:
--prefix=/cvmfs/oasis.opensciencegrid.org/osg/modules/ffmpeg/0.10.15
libavutil      51. 35.100 / 51. 35.100
libavcodec     53. 61.100 / 53. 61.100
libavformat    53. 32.100 / 53. 32.100
libavdevice    53.  4.100 / 53.  4.100
libavfilter     2. 61.100 /  2. 61.100
libswscale      2.  1.100 /  2.  1.100
libswresample   0.  6.100 /  0.  6.100"
FFMPEG_OUTPUT=`echo $FFMPEG_OUTPUT | perl -pe 's/\s+/ /g'`
source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load ffmpeg/0.10.15
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

