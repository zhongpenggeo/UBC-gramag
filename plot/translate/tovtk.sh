#!/bin/bash
#gfortran xyz2vtk.f90 -o xyz2vtk
#3d volume

FI=../output/density_formated.txt

OUTFI=tmp.dat
OUTVTK=den.vtk
cat $FI | awk '{print $1,$2,$3,$4}' | sort -k3n -k2n -k1n >$OUTFI
N1=`gawk '{print $1}' $OUTFI |sort -n | uniq | wc -l`
N2=`gawk '{print $2}' $OUTFI |sort -n | uniq | wc -l`
N3=`gawk '{print $3}' $OUTFI |sort -n | uniq | wc -l`
#echo $N1 
#echo $N2
#echo $N3
./xyz2vtk.exe -I$OUTFI   -N${N1}/${N2}/${N3} -O$OUTVTK     -Dv -Cc
cp $OUTVTK ..
rm $OUTVTK
