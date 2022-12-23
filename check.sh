#!/bin/sh

if [ ! $# -eq 1 ]; then
  echo "One argument must be specified."
  exit
fi

cname="h010_l045_v001.190515.101"
nnum=`printf %03d ${1}`

set a h r
while [ $# -ge 1 ]
do
  echo $1
  ncks -v ocean_time h010_l045_v001.190515.101.${1}.${nnum}.nc | \
  sed -n -e '/ocean_time = [0123456789]/p' | \
  awk '{n=split($0, ary, "="); print(ary[n])}' | \
  awk '{n=split($0, ary, ";"); print(ary[1])}' | \
  awk '{gsub (/ /,""); print }' |\
  awk '{n=split($0, ary, ","); for( i=1; i<=length(ary); i++ )  { printf("%.6f\n",ary[i]/86400/365.25) }}'
  echo ""
  shift
done
