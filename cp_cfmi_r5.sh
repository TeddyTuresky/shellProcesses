#!/bin/bash

####script searches CFMI directories by date, then looks for any subjects we may be interested in. If a CSL subject is found, then it will copy data to the user's home directory

y=(2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2005	2006	2006	2006	2006	2006	2006	2006	2007	2007	2007	2007	2007	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2010	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2011	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2012	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2013	2014
);
m=(02	02	02	03	03	04	04	04	04	05	05	05	05	05	05	05	05	05	05	07	07	07	07	08	08	08	08	08	08	08	08	08	08	08	08	08	08	08	09	09	09	10	10	10	11	11	11	11	11	11	11	11	11	12	01	06	08	08	08	11	12	02	02	03	05	08	06	06	06	06	06	06	06	06	07	07	07	07	07	10	10	10	11	03	03	03	03	03	06	06	06	06	06	06	07	07	07	07	07	08	08	08	08	08	08	08	08	08	08	09	09	09	09	09	09	09	09	09	09	10	10	10	10	10	11	11	12	01	01	01	01	01	01	01	01	02	02	02	03	03	03	03	04	05	05	05	06	06	06	06	06	06	06	06	06	07	07	07	07	07	08	08	08	08	08	08	08	09	09	10	11	11	01	03	03	03	03	03	03	03	04	04	04	04	04	05	05	05	05	05	05	05	06	06	07	07	08	08
);
d=(12	16	22	05	16	02	16	16	27	03	04	04	04	05	12	12	13	16	21	09	12	13	16	01	05	09	09	09	09	16	17	17	17	18	19	19	19	31	07	22	29	06	22	26	10	14	15	15	16	18	21	30	30	19	18	05	02	07	07	28	09	07	07	19	31	29	26	26	26	26	26	26	26	26	02	02	02	19	19	18	25	25	01	12	26	26	26	26	11	11	15	18	18	21	03	14	25	30	30	03	06	10	11	15	15	16	20	25	30	02	02	02	14	15	17	17	17	17	29	01	01	17	25	31	07	28	10	23	24	25	25	25	26	27	27	01	25	27	13	19	21	23	05	17	18	29	06	13	21	23	23	23	26	30	30	03	07	09	09	30	04	06	17	20	22	24	28	10	12	27	23	29	31	02	02	02	23	23	26	27	06	06	20	20	20	11	11	11	19	19	19	19	13	18	17	23	01	06
);
ID=(14483	52009	31398	81784	98099	93524	17612	88005	52909	79339	11470	11470	34308	59061	24756	45663	17600	85305	10363	15570	99468	TZ0086	53662	39159	96879	39540	39540	52978	52978	69884	TZ0091	TZ0092	TZ0093	TZ0101	63045	63084	63084	TZ0090	TZ0090	73106	71693	82679	21900	45085	TZ0122	68875	TZ0128	TZ0128	96299	TZ0123	TZ0106	TZ0130	TZ0131	TZ0132	98893	91625	17108	10361	84174	86224	92420	80197	80197	75020	45348	44057	65792	65792	70443	70443	86006	86006	99867	99867	74164	86006	99867	30187	47880	13.h.13	13.h.12	13.h.15	13.h.14	13397	13397	13397	65908	65908	11732	48868	11126	11732	48868	28197	27527	55075	28197	27527	73320	74345	27527	73320	55075	73138	74345	27527	44153	72525	77636	19256	80358	92943	80358	77636	44153	70548	74443	96850	86684	72525	92730	74732	93644	74443	87895	62904	53699	82427	72938	43867	44759	81097	76480	43709	77998	13.h.16	10493	96455	41863	52110	95896	11732	84317	92700	26011	19613	97842	28197	48868	44153	62904	73138	73320	27527	55075	93644	92730	79082	86684	74345	74732	33915	70548	45668	33915	79082	77636	45668	72525	65908	95045	95045	37770	11732	73320	86684	27527	70548	76644	22249	44153	74443	74732	77636	94553	48868	72525	73138	28197	62904	65908	77636	55075	93644	74345	12613	95126	33915
);
long=197 # number of datapoints minus 1

# take inventory of MRI sessions done on particular date
for ((k=0; k<=long; k++)); do
	cd /raw/dicom/data/cfmi/MR/${y[k]}/${m[k]}/${d[k]};
	var=(`ls`)
	len=${#var[*]}

# take inventory of runs in each scan session
	for ((i=0; i<=len; i++)); do
		cd ./${var[i]};
			varg=(`ls`)
			leng=${#varg[*]}

# search patnam.txt files for CSL subject IDs provided 			
			for ((h=0; h<=leng; h++)); do
				if [[ ${varg[h]} == "patnam.txt" ]]; then
					echo patnam exists
					if grep ${ID[k]} ./patnam.txt; then # if subject ID exists, then copy it to home directory
						echo CSL subject
						mkdir ~/csl_data/${ID[k]} # make a directory with subj ID in which to copy MRI session
						cp -R ../${var[i]} ~/csl_data/${ID[k]}
#						scp -r ../${var[i]} tkt3@main10.csl.georgetown.edu:/export/y/cfmi_data/${ID[k]}			
					else
						echo not CSL
					fi
#				else
#					echo patnam does not exist
				fi 
			done
		cd ../
	done
	cd ../../../
done


echo done echoing

