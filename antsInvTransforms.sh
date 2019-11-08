#!/bin/bash

dir=/Volumes/FunTown/allAnalyses/BangRS/AnalysisData3
temp=/Users/cinnamon/Documents/structSDmethod

cd ${dir}

sub=(`ls`)

for ((i=0; i<${#sub[*]}; i++)); do

antsApplyTransforms -d 3 -i ${temp}/infant-neo-seg-gm.nii -o ${temp}/${sub[i]}_gm.nii -r ${temp}/N4_2065_noSkull.nii -t [${dir}/${sub[i]}/struct/unc0GenericAffine.mat,1] -t ${dir}/${sub[i]}/struct/unc1InverseWarp.nii.gz

antsApplyTransforms -d 3 -i ${temp}/infant-neo-seg-wm.nii -o ${temp}/${sub[i]}_wm.nii -r ${temp}/N4_2065_noSkull.nii -t [${dir}/${sub[i]}/struct/unc0GenericAffine.mat,1] -t ${dir}/${sub[i]}/struct/unc1InverseWarp.nii.gz

antsApplyTransforms -d 3 -i ${temp}/infant-neo-seg-csf.nii -o ${temp}/${sub[i]}_csf.nii -r ${temp}/N4_2065_noSkull.nii -t [${dir}/${sub[i]}/struct/unc0GenericAffine.mat,1] -t ${dir}/${sub[i]}/struct/unc1InverseWarp.nii.gz


done

echo done transforming
