#!/bin/bash
# Dan Swain dan.t.swain at gmail.com 10/14/09

# Bash script to convert Keynote 2009 format to Keynote 2008.
#
# Many thanks to linux4research's blog post 
#  http://linux4research.blogspot.com/ (continued next line)
#    (continued url) 2009/09/mac-keynote-2009-format.html
#  for the .key to .zip step.

# input argument handling:  DISABLED - I don't trust it enough
#       not to erase your keynote file on accident...
# if -k is given as first argument, keep the original file
#   and the output has "2008" added before .key
# otherwise the original file is overwritten (may be desirable
#   because keynote files tend to be LARGE)
# if [ $# -ge 2 ]    # note we may throw away extra arguments
# then
#   if [ "$1" = "-k" ]
#   then
#     INPUT=$2
#     KEEP=1
#   else
#     echo "Unknown argument $1, use -k to keep original file."
#     exit
#   fi
# else
#   INPUT=$1
#   KEEP=0
# fi

# safe input handling - need at least one argument
if [ $# -ne 1 ]
then
  echo "Only one input argument allowed."
  exit
fi
INPUT=$1
KEEP=1

# basename doesn't work for keynote files...
BASE=${INPUT%.key}
ZIPFILE=$BASE".zip"

if [ $KEEP -eq 1 ]
then
  # output filename  
  OUTPUT=$BASE  
  OUTPUT=$OUTPUT" 2008.key"  
  # copy/rename to zipfile
  echo "Copying $INPUT to $ZIPFILE, this may take a moment.."
  cp $INPUT $ZIPFILE
  echo "Done."
else
  # output filename
  OUTPUT=$INPUT
  # rename to zipfile
  mv $INPUT $ZIPFILE
fi

# unzip
echo "Unzipping $ZIPFILE."
unzip $ZIPFILE -d "$OUTPUT"
# erase the zipfile
echo "Erasing $ZIPFILE."
rm $ZIPFILE
# change the version number in the index file
echo "Converting version string to 2008."
INDEXAPXL=$OUTPUT/index.apxl
sed -i '' 's/version=\"[0-9]*/version=\"72007061400/g' "$INDEXAPXL"

