#!/bin/bash

# This script is for FSL preprocessing. For questions, please contact theodore.turesky@childrens.harvard.edu or see: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/eddy/UsersGuide


p=(

/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2065
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2098
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2101
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2114
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2128
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2223
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2225
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2232
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2233
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2234
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2235
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2236
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2239
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2243
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/2246
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/3263
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/3270
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/3341
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/3371
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/3374
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5201
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5202
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5203
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5204
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5205
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5206
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5207
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5208
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5209
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5210
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5211
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5212
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5213
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5214
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5215
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5216
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5217
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5218
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5219
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5220
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5221
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5222
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5223
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5224
/Volumes/FunTown/allAnalyses/BangRS/dtiConv/5225

);

acq=/Users/cinnamon/Documents/transformInf2MNI/acqparams.txt
ind=/Users/cinnamon/Documents/transformInf2MNI/index.txt

for i in ${p[@]}; do

cd $i


{

fslroi regDTI_30dir_b1000_noIPAT_FOV160.nii AP_b0 0 1

fslmerge -t AP_AP_PA_b0 AP_b0.nii regDTI_AP.nii regDTI_PA.nii

topup --imain=AP_AP_PA_b0 --datain=${acq} --config=b02b0.cnf --out=my_topup_results --iout=my_hifi_b0 --fout=my_field

#topup only
#applytopup --imain=regDTI_30dir_b1000_noIPAT_FOV160.nii --inindex=1 --datain=${acq} --topup=my_topup_results --method=jac --out=my_hifi_images

#eddy option
fslmaths my_hifi_b0 -Tmean my_hifi_b0

bet my_hifi_b0 my_hifi_b0_brain -m

eddy --imain=regDTI_30dir_b1000_noIPAT_FOV160.nii --mask=my_hifi_b0_brain_mask --acqp=${acq} --index=${ind} --bvecs=regDTI_30dir_b1000_noIPAT_FOV160_bvecs --bvals=regDTI_30dir_b1000_noIPAT_FOV160_bvals --topup=my_topup_results --niter=8 --fwhm=10,8,4,2,0,0,0,0 --repol --out=eddy_corrected_data

} || {

echo $i did not run properly

}


done


echo done Topping Up and Eddying

