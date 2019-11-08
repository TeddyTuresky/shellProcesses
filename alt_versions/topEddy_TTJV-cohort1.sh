#!/bin/bash

# This script is for FSL preprocessing. For questions, please contact theodore.turesky@childrens.harvard.edu or see: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/eddy/UsersGuide


p=(

/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF004
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF027


);

acq=/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/acqparamsCoh1-inf.txt 
ind=/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/indexCoh1-inf.txt

for i in ${p[@]}; do

cd $i


{

main=(`echo DIFFUSION_HighRes_Short.nii`)
bvec=(`echo DIFFUSION_HighRes_Short.bvec`)
bval=(`echo DIFFUSION_HighRes_Short.bval`)

fslroi $main AP_b0_10 0 10

#eddy option
fslmaths AP_b0_10 -Tmean AP_b0_10

bet AP_b0_10 AP_b0_10_brain -m

eddy --imain=$main --mask=AP_b0_10_brain_mask --acqp=${acq} --index=${ind} --bvecs=${bvec} --bvals=${bval} --out=eddy_corrected_data
#--niter=8 --fwhm=10,8,4,2,0,0,0,0 --repol --out=eddy_corrected_data

} || {

echo $i did not run properly

}


done


echo done Topping Up and Eddying

