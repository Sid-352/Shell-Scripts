#!/bin/bash

for x in $(cat cities.txt);
do
  weather=$(curl -s http://wttr.in/$x?format=3)
  echo $weather 
done
