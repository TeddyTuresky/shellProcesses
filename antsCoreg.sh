#!/bin/bash

cd /Volumes/FunTown/allAnalyses/BangRS/AnalysisData3

sub=(`ls`)
for ((i=0; i<${#sub[*]}; i++)); do

	echo processing ${sub[i]} 
	antsRegistration -d 3 -o ${sub[i]}/struct/AF -m CC[${sub[i]}/struct/N4_${sub[i]}_noSkull.nii,${sub[i]}/resting/meanarest_011.nii] -t Affine[0.1] \
	-c [50x50x50,1e-6,10] -s 3x2x1vox -f 8x4x2

done

echo done Coreg

