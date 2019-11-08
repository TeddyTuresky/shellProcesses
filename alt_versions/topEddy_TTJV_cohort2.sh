#!/bin/bash

# This script is for FSL preprocessing. For questions, please contact theodore.turesky@childrens.harvard.edu or see: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/eddy/UsersGuide

p=(

/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF001
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF003
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF005
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF006
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF007
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF008
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF009
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF010
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF011
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF012
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF013
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF015
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF017
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF018
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF019
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF020
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF022
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF023
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF024
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF025
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF026
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF027
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF028
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF029
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF030
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF031
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF032
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF033
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF034
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF035
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF036
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF037
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF038
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF039
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF041
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF042
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF043
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF044
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF045
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF046
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF047
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF048
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF049
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF050
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF051
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF052
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF053
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF054
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF055
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF056
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF057
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF058
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF060
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF061
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF062
/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh1_INF/INF063

);

acq=/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh2_INF/ToBeEddyCorrected/acqparamsJS.txt
ind=/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/Jolijn/DWI_Coh2_INF/ToBeEddyCorrected/indexJS.txt

for i in ${p[@]}; do

echo $i

cd $i

{

main=(`echo *SMS2_Diff_b1000_10b0s.nii`)
bvec=(`echo *SMS2_Diff_b1000_10b0s.bvec`)
bval=(`echo *SMS2_Diff_b1000_10b0s.bval`)

fslroi $main AP_b0_10 0 10

fslmerge -t AP_AP_PA_b0 AP_b0_10.nii *_AP.nii *_PA.nii

topup --imain=AP_AP_PA_b0 --datain=${acq} --config=b02b0.cnf --out=my_topup_results --iout=my_hifi_b0 --fout=my_field

#topup only
#applytopup --imain=$main --inindex=1 --datain=${acq} --topup=my_topup_results --method=jac --out=my_hifi_images

#eddy option
fslmaths my_hifi_b0 -Tmean my_hifi_b0

bet my_hifi_b0 my_hifi_b0_brain -m

eddy --imain=$main --mask=my_hifi_b0_brain_mask --acqp=${acq} --index=${ind} --bvecs=${bvec} --bvals=${bval} --topup=my_topup_results --out=eddy_corrected_data
#--niter=8 --fwhm=10,8,4,2,0,0,0,0 --repol --out=eddy_corrected_data

} || {

echo $i did not run properly

}


done


echo done Topping Up and Eddying
