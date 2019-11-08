#!/bin/bash

# originally written by Xi Yu.
# for questions, please contact theodore.turesky@harvard.edu

# This will create 4Dniis from 3D files

dir=/neuro/labs/gaablab/data/FHD/data4Dana


for p in {A..B}; do

    cd $dir
    flu=(`echo */*/fluency$p`)

for ((k=0; k<${#flu[@]}; k++)); do  
   
    #set variable for all nii files and make 4d nii - discard first 4 vols
    cd $dir/${flu[k]}

    echo Running ${flu[k]}
    vol1=(`echo f*.nii`);
    fslmerge -tr flu${p}_4doff  ${vol1[@]:5} 2


done
done
