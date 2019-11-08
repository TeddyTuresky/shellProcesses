#!/bin/bash
# script for converting dicoms to niftis for dti analyses
# for questions, please contact theodore.turesky@childrens.harvard.edu

p=(

/Users/cinnamon/Documents/JdtiSub/dtiQC 

);


for ((i=0;i<${#p[*]};i++)); do

dcm2niix -f dtiQC -z y ${p[i]}

done

echo done converting to nifti
