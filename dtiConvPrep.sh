#!/bin/bash

# script for converting dicoms to nrrd for subsequent artifact detection in dtiPrep. Runs on Darwin
# for questions, please contact theodore.turesky@harvard.edu


# Put paths to diffusion dicoms in p

p=(

/net/rc-fs-nfs/ifs/data/Shares/DMC-Gaab2/data/FHD/data4Dana/BLD034/BLD034_R3/dwi_dicoms);


for ((i=0;i<${#p[*]};i++)); do

DWIConvert -i ${p[i]} -o ${p[i]}/dtiRaw.nrrd --useBMatrixGradientDirections

DTIPrep -c -d -p ${p[i]}/dtiRaw.xml --numberOfThreads 8 -w ${p[i]}/dtiRaw.nrrd

done

echo done with convert and dtiprep
