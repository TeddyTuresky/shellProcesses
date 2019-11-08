#!/bin/bash

#originally written by Xi Yu. edited by Ted

#This will create 4Dniis and move them to a new folder


#Enable fsl
    . $FSLDIR/etc/fslconf/fsl.sh 

dir=/Volumes/FunTown/allAnalyses/BangRS/4fsl 
cd $dir

sub=(`ls`)
long=${#sub[*]}


for ((k=0; k<long; k++)); do  
   
    echo "Converting to 4D ${sub[k]}"

    cd $dir/${sub[k]}/resting
    
    #set up to remove first 10 volumes
    vol=(`ls rest* | grep -vi "rest_00" | grep -vi "rest_010"`)
 
    #Make 4d nii
    fslmerge -t ${sub[k]}_rest4d-red ${vol[*]}

    #Move 4d nii
    mv ${sub[k]}_rest4d-red.nii.gz $dir/${sub[k]}

done
