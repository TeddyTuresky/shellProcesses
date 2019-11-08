
#!/bin/bash

# script for converting dicoms to nrrd for subsequent artifact detection in dtiPrep. Runs on Darwin
# for questions, please contact theodore.turesky@harvard.edu


# Put paths to diffusion dicoms in p

p=(


/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/BabyMRI/stimq_WM_analysis/INF_BB002/


);


for ((i=0;i<${#p[*]};i++)); do

DWIConvert --inputVolume ${p[i]}/eddy_corrected_data.nii.gz -o ${p[i]}/dtiEddyQC.nrrd --inputBVectors ${p[i]}/eddy_corrected_data.eddy_rotated_bvecs —inputBValues ${p[i]}/regDTI_30dir_b1000_noIPAT_FOV160_bvals --conversionMode FSLToNrrd --allowLossyConversion --useBMatrixGradientDirections

DTIPrep -c -d -p ${p[i]}/dtiEddyQC.xml --numberOfThreads 8 -w ${p[i]}/dtiEddyQC.nrrd


done

echo done with convert and dtiprep
