#!/bin/bash

read -p "Von (1) oder zu server (2)? " GELD1
read -p "Von wo kopieren? " GELD2
read -p "Wohin kopieren? " GELD3
read -p "Ordner y/n " GELD4

if [ $GELD1 == 2 ];then
   if [ "$GELD4" == "y" ];then
       scp -r "$GELD2" "laptopserver:$GELD3"
   else
       scp "$GELD2" "laptopserver:$GELD3"
   fi
else
   if [ "$GELD4" == "y" ];then
       scp -r "laptopserver:$GELD2" "$GELD3"
   else
       scp "laptopserver:$GELD2" "$GELD3"
   fi
fi
