#! /bin/bash

ran=$((RANDOM%2))

if [ $ran -eq 0 ]
then
   echo "Head is Winner"
else
   echo "Tail is Winner"
fi
