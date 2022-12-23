#!/bin/sh -x

function org_cut_data (){
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
  ncrcat $cname.$cnum.${1}.${2}.nc $cname.$cnum.${1}.$nnum1.nc -o ../out/$cname.$cnum.${1}.${2}.nc
}

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
  n=$(expr $2 + 1)
  nnum1=$(printf "%03d\n" "${n}")
  ncks -d ocean_time,${3},${4} $cname.$cnum.${1}.$nnum1.nc -o ../out/$cname.$cnum.${1}.${2}.nc
}


cname="h010_l045_v001.190515"
cnum="101"

### 076+077 -> 076
nnum0=076
join_data_2 a $nnum0
join_data_2 h $nnum0
cut_data r $nnum0 0 0

### 070+071 -> 070 step1
#nnum0=070
#org_cut_data a $nnum0 0 2
#org_cut_data h $nnum0 0 2
#org_cut_data r $nnum0 0 0

### 070+071 -> 070 step2
#join_data_2 a $nnum0
#join_data_2 h $nnum0
#cut_data r $nnum0 0 0


#mv -f $cname.$cnum.a.$nnum0.nc $cname.$cnum.aorg.$nnum0.nc 
#mv -f $cname.$cnum.h.$nnum0.nc $cname.$cnum.horg.$nnum0.nc 
#echo "processing a file"
#ncks -d ocean_time,0,2 $cname.$cnum.aorg.$nnum0.nc -o $cname.$cnum.a.$nnum0.nc
#echo "processing h file"
#ncks -d ocean_time,0,2 $cname.$cnum.aorg.$nnum0.nc -o $cname.$cnum.a.$nnum0.nc
#
#mv -f $cname.$cnum.h.$nnum1.nc $cname.$cnum.horg.$nnum1.nc 
#ncks -d ocean_time,0,0 $cname.$cnum.horg.$nnum1.nc -o $cname.$cnum.h.$nnum1.nc

### 026+027+028 -> 026 step 2
#echo "processing a file"
#ncrcat $cname.$cnum.a.$nnum0.nc $cname.$cnum.a.$nnum1.nc $cname.$cnum.a.$nnum2.nc -o ../out/$cname.$cnum.a.$nnum0.nc
#echo "processing h file"
#ncrcat $cname.$cnum.h.$nnum0.nc $cname.$cnum.h.$nnum1.nc $cname.$cnum.h.$nnum2.nc -o ../out/$cname.$cnum.h.$nnum0.nc
#echo "processing r file"
#cp $cname.$cnum.r.$nnum2.nc ../out/$cname.$cnum.r.$nnum0.nc


### 026+027+028 -> 026 step 1
#nnum0=026
#nnum1=027
#nnum2=028
#echo "processing h file"
#mv -f $cname.$cnum.h.$nnum0.nc $cname.$cnum.horg.$nnum0.nc 
#mv -f $cname.$cnum.h.$nnum1.nc $cname.$cnum.horg.$nnum1.nc 
#ncks -d ocean_time,0,0 $cname.$cnum.horg.$nnum0.nc -o $cname.$cnum.h.$nnum0.nc
#ncks -d ocean_time,0,0 $cname.$cnum.horg.$nnum1.nc -o $cname.$cnum.h.$nnum1.nc

### 026+027+028 -> 026 step 2
#echo "processing a file"
#ncrcat $cname.$cnum.a.$nnum0.nc $cname.$cnum.a.$nnum1.nc $cname.$cnum.a.$nnum2.nc -o ../out/$cname.$cnum.a.$nnum0.nc
#echo "processing h file"
#ncrcat $cname.$cnum.h.$nnum0.nc $cname.$cnum.h.$nnum1.nc $cname.$cnum.h.$nnum2.nc -o ../out/$cname.$cnum.h.$nnum0.nc
#echo "processing r file"
#cp $cname.$cnum.r.$nnum2.nc ../out/$cname.$cnum.r.$nnum0.nc

### 040+041 -> 040 step 1
#nnum0=040
#nnum1=041
#echo "processing h file"
#mv -f $cname.$cnum.h.$nnum0.nc $cname.$cnum.horg.$nnum0.nc 
#ncks -d ocean_time,0,2 $cname.$cnum.horg.$nnum0.nc -o $cname.$cnum.h.$nnum0.nc

### 040+041 -> 040 step 2
#echo "processing a file"
#ncrcat $cname.$cnum.a.$nnum0.nc $cname.$cnum.a.$nnum1.nc -o ../out/$cname.$cnum.a.$nnum0.nc
#echo "processing h file"
#ncrcat $cname.$cnum.h.$nnum0.nc $cname.$cnum.h.$nnum1.nc -o ../out/$cname.$cnum.h.$nnum0.nc
#echo "processing r file"
#ncks -d ocean_time,0,0 $cname.$cnum.r.$nnum1.nc -o ../out/$cname.$cnum.r.$nnum0.nc





### 009+010 -> 009 step 1
#nnum0=009
#nnum1=010
###echo "processing a file" # this part is not used.
###mv -f $cname.$cnum.a.$nnum0.nc $cname.$cnum.aorg.$nnum0.nc 
###ncks -d ocean_time,0,3 $cname.$cnum.aorg.$nnum0.nc -o $cname.$cnum.a.$nnum0.nc
#echo "processing h file"
#mv -f $cname.$cnum.h.$nnum0.nc $cname.$cnum.horg.$nnum0.nc 
#ncks -d ocean_time,0,2 $cname.$cnum.horg.$nnum0.nc -o $cname.$cnum.h.$nnum0.nc
###echo "processing r file" # this part is not used.
###mv -f $cname.$cnum.r.$nnum0.nc $cname.$cnum.rorg.$nnum0.nc 
###ncks -d ocean_time,1,1 $cname.$cnum.rorg.$nnum0.nc -o $cname.$cnum.r.$nnum0.nc

### 009+010 -> 009 step 2
#echo "processing a file"
#ncrcat $cname.$cnum.a.$nnum0.nc $cname.$cnum.a.$nnum1.nc -o ../out/$cname.$cnum.a.$nnum0.nc
###echo "processing d file"
###ncrcat $cname.$cnum.d.$nnum0.nc $cname.$cnum.d.$nnum1.nc -o ../out/$cname.$cnum.d.$nnum0.nc
#echo "processing h file"
#ncrcat $cname.$cnum.h.$nnum0.nc $cname.$cnum.h.$nnum1.nc -o ../out/$cname.$cnum.h.$nnum0.nc
#echo "processing r file"
#ncks -d ocean_time,0,0 $cname.$cnum.r.$nnum1.nc -o ../out/$cname.$cnum.r.$nnum0.nc

