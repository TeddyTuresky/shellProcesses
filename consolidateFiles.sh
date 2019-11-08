#!/bin/bash

sub=(2098
2114
2128
2223
2233
2235
2236
2246
3349
3350
3374
5202
5204
5207
5211
5212
5213
5214
5215
5218
5220
5221
5223
5224
5225);

cd /Volumes/FunTown/allAnalyses/BangRS/4fsl

for ((i=0; i<${#sub[*]}; i++)); do
	rsync -R ${sub[i]}/struct/N4_${sub[i]}_noSkull.nii ../PiecingTogether
done

cd /Volumes/FunTown/allAnalyses/BangRS/AnalysisData

for ((i=0; i<${#sub[*]}; i++)); do
        rsync -R ${sub[i]}/resting/rarest*.nii ../PiecingTogether
	cp ${sub[i]}/resting/Bad* ../PiecingTogether/${sub[i]}/resting
	cp ${sub[i]}/resting/global* ../PiecingTogether/${sub[i]}/resting
	cp ${sub[i]}/resting/rp_arest*.txt ../PiecingTogether/${sub[i]}/resting
	cp ${sub[i]}/resting/meanarest* ../PiecingTogether/${sub[i]}/resting
	cp ${sub[i]}/resting/ArtifactMask.nii ../PiecingTogether/${sub[i]}/resting
done

echo done copying

