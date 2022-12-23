#!/bin/sh -x

function cut_data (){
  # $1: file type (a, h, r)
  # $2: cut start
  # $3: cut end
  if [ ! $# -eq 3 ]; then
    echo "[${0}] Four arguments must be specified."
    exit
  fi
  echo "processing $1 file"
  mv -f $cname.$cnum.${1}.${nnum0}.nc $cname.$cnum.${1}_cut_data.${nnum0}.nc
  ncks -d ocean_time,${2},${3} $cname.$cnum.${1}_cut_data.${nnum0}.nc -o $cname.$cnum.${1}.${nnum0}.nc
}

function join_data_2 (){
  # $1: file type (a, h, r)
  if [ ! $# -eq 1 ]; then
    echo "[${0}] One argument must be specified."
    exit
  fi
  echo $cname
  echo $cnum
  n=$(expr $2 + 1)
  nnum1=$(printf "%03d\n" "${n}")
  mv -f $cname.$cnum.${1}.${nnum0}.nc $cname.$cnum.${1}_join_data_2.${nnum0}.nc
  ncrcat $cname.$cnum.${1}_join_data_2.${nnum0}.nc $cname.$cnum.${1}.$nnum1.nc -o $cname.$cnum.${1}.${nnum0}.nc
}

function copy_data (){
  # $1 file type (a, h, r)
  if [ ! $# -eq 1 ]; then
    echo "[${0}] One argument must be specified."
    exit
  fi
  cp ${cname}.${cnum}.${1}.${nnum0}.nc ../out/
}

### main ###

cname="h010_l045_v001.190515"
cnum="101"
nnum0=070

### 070+071 -> 070
#cut_data a 0 2
#cut_data h 0 2
#cut_data r 0 0

#join_data_2 a
#join_data_2 h
#cut_data r 0 0

#copy_data a
#copy_data h
#copy_data r