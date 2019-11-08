#!/bin/bash

####script searches CFMI directories by date, then looks for any subjects we may be interested in. If a CSL subject is found, then it will copy data to the user's home directory
####written by Ted Turesky, 2016

y=(2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2015
2016
2016
2016
2016
2016
2016
2016
2016
2016
2016
2016);
m=(07
08
09
08
06
08
08
04
09
07
03
04
04
09
03
05
08
06
08
03
02
06
03
06
03
08
06
11
03
04
08
02
04
08
11
11
11
11
11
12
12
12
01
01
01
01
01
01
01
02
02
01
01);
d=(25
01
19
30
19
23
16
12
26
12
28
17
26
13
21
13
15
28
23
08
28
06
04
22
29
30
06
16
08
08
03
28
26
11
12
21
14
14
21
05
13
21
06
07
09
09
10
14
20
03
07
31
31);
ID=(A03201
C70001
C70013
C70556
C70558
C70578
C70589
H10018
H10181
J20036
J21171
J31344
J31510
J33917
J36450
J40015
J40125
J40233
J40598
J41660
J41705
J42077
J42898
J43105
P70104
T80040
T80707
T81024
T81192
T95315
T96405
T96815
W70596
W70599
149959
R70000
151031
751086
441492
T80122
B70003
C70009
T95093
C70550
A04014
T94339
T92927
T93075
T95313
C70579
T80284
T93316
T80457);

long=53 # number of datapoints
dep=data4Erave;


# No need to change below
# take inventory of MRI sessions done on particular date
for ((k=0; k<long; k++)); do
	cd /raw/dicom/data/cfmi/MR/${y[k]}/${m[k]}/${d[k]};
	var=(`ls`)
	len=${#var[*]}

# take inventory of runs in each scan session
	for ((i=0; i<len; i++)); do
		cd ./${var[i]};
			varg=(`ls -a`)
			leng=${#varg[*]}

# search patnam.txt files for CSL subject IDs provided 			
			for ((h=0; h<=leng; h++)); do
				if [[ ${varg[h]} == ".StudyDict" ]]; then
					echo StudyDict exists
					if grep ${ID[k]} ./.StudyDict; then # if subject ID exists, then copy it to home directory
						echo CSL subject ${y[k]} ${m[k]} ${d[k]}  
						mkdir ~/${dep}/${ID[k]} # make a directory with subj ID in which to copy MRI session
						cp -R ../${var[i]} ~/${dep}/${ID[k]}			
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


