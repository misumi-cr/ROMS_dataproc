#!/bin/sh -x

function cut_data (){
# $1: file type (a, h, r)
# $2: file number (nnumX)
# $3: cut start
# $4: cut end
  if [ ! $# -eq 4 ]; then
    echo "[${0}] Four arguments must be specified."
    exit
  fi
  echo "processing $1 file"
  mv $cname.$cnum.${1}.${2}.nc $cname.$cnum.${1}org.${2}.nc
  ncks -d ocean_time,${3},${4} $cname.$cnum.${1}org.${2}.nc -o $cname.$cnum.${1}.${2}.nc
}

function join_data_2 (){
# $1: file type (a, h, r)
# $2: file number (nnum0)
  if [ ! $# -eq 2 ]; then
    echo "[${0}] Two arguments must be specified."
    exit
  fi
  echo $cname
  echo $cnum
  n=$(expr $2 + 1)
  nnum1=$(printf "%03d\n" "${n}")
  mv $cname.$cnum.${1}.${2}.nc $cname.$cnum.${1}org.${2}.nc
  ncrcat $cname.$cnum.${1}org.${2}.nc $cname.$cnum.${1}.$nnum1.nc -o $cname.$cnum.${1}.${2}.nc
}

### main ###

cname="h010_l045_v001.190515"
cnum="101"

### 070+071 -> 070 step1
#nnum0=070
#cut_data a $nnum0 0 2
#cut_data h $nnum0 0 2
#cut_data r $nnum0 0 0

### 070+071 -> 070 step2
#join_data_2 a $nnum0
#join_data_2 h $nnum0
#cut_data r $nnum0 0 0