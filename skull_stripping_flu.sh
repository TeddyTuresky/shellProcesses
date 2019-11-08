#!/bin/bash

#originally written by Xi Yu. edited by Ted.

#This is used for skull-stripping of the structural iamges




#Enable fsl
    . $FSLDIR/etc/fslconf/fsl.sh 

dir=/Users/SilverSalmon/Documents/fluencyPract 
cd $dir

sub=(`ls | grep -vi "proc"`)
long=${#sub[*]}


for ((k=0; k<long; k++)); do  
   
    echo "Stripping skull of ${sub[k]}"

    #strip skull
    bet $dir/${sub[k]}/mprage/s*.nii $dir/${sub[k]}/bstruct.nii -f 0.4


done
