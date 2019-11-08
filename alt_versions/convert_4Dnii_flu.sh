#!/bin/bash

#originally written by Xi Yu. edited by Ted

#This will create 4Dniis and move them to a new folder
 

dir=/Users/SilverSalmon/Documents/fluencyPract 
cd $dir

sub=(`ls | grep -vi "proc"`)
long=${#sub[*]}


for ((k=0; k<long; k++)); do  
   
    echo "Converting to 4D ${sub[k]}"

    #set variable for all nii files and make 4d nii - discard first 4 vols
    cd $dir/${sub[k]}/flu1
    vol1=(`ls f*.nii`);
    fslmerge -t ../flu1_4d  ${vol1[*]} #${vol1[@]:4}
    fslmerge -tr ../flu1_4d  ${vol1[*]} 2

    cd $dir/${sub[k]}/flu2
    vol2=(`ls f*.nii`);
    fslmerge -t ../flu2_4d  ${vol2[*]}   #${vol2[@]:4}
    fslmerge -tr ../flu2_4d  ${vol2[*]} 2

done
