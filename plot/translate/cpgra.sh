#/*************************************************************************
#	> File Name: cpgra.sh
#	> Author:PengZhong 
#	> Mail: 
#	> Created Time: Tue Nov 13 14:47:25 2018
# ************************************************************************/

#!/bin/bash
cd ../inv/
FI_den=`ls gzinv3d_*.den | sort |tail -n1`
FI_1=`echo ${FI_den%.*}`
FI_for=`echo ${FI_1##*/}`
FI_pre=${FI_for}.pre
cp $FI_den ../output/gravity_density.txt 
cp $FI_pre ../output/gravity_prediction.txt
