#!/bin/bash

dir=/Volumes/FunTown/allAnalyses/BangRS/AnalysisData3
temp=/Users/cinnamon/Documents/tempTransform
ref=/Users/cinnamon/Documents/BETA_Subject001_Condition001_Source011.nii

cd ${dir}

sub=(`ls`)

for ((i=0; i<${#sub[*]}; i++)); do

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/struct/N4_struct_001.nii -o ${dir}/${sub[i]}/struct/w3N4_struct_001.nii -r ${temp}/nihpd_asym_02-05_t1w.nii -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/struct/gm-mask.nii -o ${dir}/${sub[i]}/struct/w3gm-mask.nii -r ${temp}/nihpd_asym_02-05_t1w.nii -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/struct/wm-mask.nii -o ${dir}/${sub[i]}/struct/w3wm-mask.nii -r ${temp}/nihpd_asym_02-05_t1w.nii -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/struct/csf-mask.nii -o ${dir}/${sub[i]}/struct/w3csf-mask.nii -r ${temp}/nihpd_asym_02-05_t1w.nii -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/meanarest_005.nii -o ${dir}/${sub[i]}/resting/w3meanarest_011.nii -r ${ref} -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

for ((k=11; k<=205; k++)); do

#if [ "$k" -lt 10 ]; then

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/rarest_00${k}.nii -o ${dir}/${sub[i]}/resting/w3rarest_00${k}.nii -r ${ref} -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

#elif [ "$k" -lt 100 ]; then
if [ "$k" -lt 100 ]; then

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/rarest_0${k}.nii -o ${dir}/${sub[i]}/resting/w3rarest_0${k}.nii -r ${ref} -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/rarest_0${k}.nii -o ${dir}/${sub[i]}/resting/w4rarest_0${k}.nii -r ${ref} -t ${dir}/${sub[i]}/struct/unc1Warp.nii.gz -t ${dir}/${sub[i]}/struct/unc0GenericAffine.mat 

antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/rarest_0${k}.nii -o ${dir}/${sub[i]}/resting/w5rarest_0${k}.nii -r ${ref} -t ${dir}/${sub[i]}/struct/unc1Warp.nii.gz -t ${dir}/${sub[i]}/struct/unc0GenericAffine.mat -t ${dir}/${sub[i]}/struct/AF0GenericAffine.mat

else

#antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/rarest_${k}.nii -o ${dir}/${sub[i]}/resting/w3rarest_${k}.nii -r ${ref} -t ${temp}/o0GenericAffine.mat -t ${dir}/${sub[i]}/struct/bic1Warp.nii.gz -t ${dir}/${sub[i]}/struct/bic0GenericAffine.mat

antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/rarest_${k}.nii -o ${dir}/${sub[i]}/resting/w4rarest_${k}.nii -r ${ref} -t ${dir}/${sub[i]}/struct/unc1Warp.nii.gz -t ${dir}/${sub[i]}/struct/unc0GenericAffine.mat 

antsApplyTransforms -d 3 -i ${dir}/${sub[i]}/resting/rarest_${k}.nii -o ${dir}/${sub[i]}/resting/w5rarest_${k}.nii -r ${ref} -t ${dir}/${sub[i]}/struct/unc1Warp.nii.gz -t ${dir}/${sub[i]}/struct/unc0GenericAffine.mat -t ${dir}/${sub[i]}/struct/AF0GenericAffine.mat


fi

done

done

echo done transforming
