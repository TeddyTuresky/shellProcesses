#!/bin/bash

#originally written by Xi Yu. edited by Ted.

#This is used for skull-stripping of the structural iamges




#Enable fsl
    . $FSLDIR/etc/fslconf/fsl.sh 

#dir=/Users/cinnamon/Documents/pract
dir=/Volumes/FunTown/allAnalyses/BangRS/4fsl 
cd $dir

sub=(`ls`)
long=${#sub[*]}


for ((k=0; k<long; k++)); do  
   
    echo "Stripping skull of ${sub[k]}"

    cd $dir/${sub[k]}/struct
    
    #strip skull
    bet N4${sub[k]}_001.nii N4struct_001_brain.nii -f 0.6 -R

    #Move 4d nii
    #mv ${sub[k]}_brain* $dir/${sub[k]}

done
