#!/bin/bash

    #Enable fsl
#    . /etc/fsl/5.0/fsl.sh


dir=/Users/cinnamon/Documents/fluencyPract
cd $dir

sub=(`ls | grep -vi "proc"`)
long=${#sub[*]}


for ((k=0; k<long; k++)); do

    echo "Preprocessing for subject ${sub[k]}\n"

    cd $dir/${sub[k]}
    tempstr=`(echo bstruct.nii.gz)`

    cd $dir/${sub[k]}
    tempimg1=`(echo flu1_4d.nii.gz)`
    tempimg2=`(echo flu2_4d.nii.gz)`
    

    #get the number of volumes run1
    tmp=`fslinfo flu1_4d.nii.gz |grep dim4 | grep -v pix`
    volno1=`echo ${tmp:5}` # use echo to remove leading and trailling spaces and newlines
    

    # get the number of volumes run2
    tmp=`fslinfo flu2_4d.nii.gz |grep dim4 | grep -v pix`
    volno2=`echo ${tmp:5}` # use echo to remove leading and trailling spaces and newlines

   
    cd $dir/${sub[k]}

 
    #Copy the fsf templates across
    cp $dir/proc/template_preprocessing1.fsf pre1_design.fsf
    cp $dir/proc/template_preprocessing2.fsf pre2_design.fsf

    
    #update to our current participant's ID
    sed -i '' s/sub1/${sub[k]}/g pre*.fsf
   # sed -i s/STRNAME/${tempstr}/g pre*.fsf
   # sed -i s/IMG1/${tempimg1}/g pre1_design.fsf
   # sed -i s/IMG2/${tempimg2}/g pre2_design.fsf

   # sed -i s/img1no/${volno1}/g pre1_design.fsf
   # sed -i s/img2no/${volno2}/g pre2_design.fsf

     echo ${sub[k]}
     echo ${tempstr}
     echo ${tempimg1}
     echo ${tempimg2}
     echo ${volno1}
     echo ${volno2}
    
    

    #Enable fsl
#    . /etc/fsl/5.0/fsl.sh

    #Run the scripts
    feat pre1_design.fsf
    feat pre2_design.fsf

    #After this you need to stop and then do art detection.
done

