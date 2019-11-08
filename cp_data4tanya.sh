#!/bin/bash

# this script copies subject folders, while excluding acquisition files


subj=(13.da.15 10493 45465);
long=2 # number of datapoints minus 1


cd /exports/y/cfmi_datai/csl_pract

# take inventory of sessions 
for ((k=0; k<=long; k++)); do
	sess=(`ls ${subj[k]}`)
        len=${#sess[*]}

# take inventory of runs	
	for ((i=0; i<=len; i++)); do
		runs=(`ls ${sess[i]}`)
                leng=${#runs[*]}

# cp .nii files from each run preserving directory structure
		
		for ((h=0; h<=leng; h++)); do
			cp --parents ${subj[k]}/${sess[i]}/${runs[h]}/*.nii ../data4Tanya

		done
	done
done



echo done copying subjects
