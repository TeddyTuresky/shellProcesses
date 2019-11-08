#!/bin/bash

p=(

/Users/cinnamon/Documents/BabyDTI/INF_033/dti
/Users/cinnamon/Documents/BabyDTI/INF_034/dti
/Users/cinnamon/Documents/BabyDTI/INF_035/dti
/Users/cinnamon/Documents/BabyDTI/INF_036/dti

);

for ((i=0;i<${#p[*]};i++)); do

DWIConvert -i ${p[i]}/rawQCed -o ${p[i]}/rawQCed/dtiQC.nii.gz --conversionMode DicomToFSL

done

echo done converting
