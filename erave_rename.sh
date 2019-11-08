#!/bin/bash

mp=Siemens_MPRAGE
diffi=iPAT
diffii=iPAT_FA
diffiii=iPAT_ColFA
dep=erave-runs/

cd data4Erave

sub=(`ls -d */`);
long=${#sub[*]};
for ((i=0; i<long; i++)) do
        stu=(`ls -d ${sub[i]}*/`);
	leng=${#stu[*]};

        for ((j=0; j<leng; j++)) do
                ser=(`ls ${stu[j]}`);
		ling=${#ser[*]};

                varmp=$(cat ${stu[j]}serdes.txt | grep ${mp});
                cmp=$(cat ${stu[j]}serdes.txt | grep -c ${mp});
		for ((m=1; m<=${cmp}; m++)); do
			sermp[m]="$(echo ${varmp} | cut -d' ' -f $((2*${m})))";
			echo ${sermp[m]}
		done
		vardiffi=$(cat ${stu[j]}serdes.txt | grep ${diffi});
		cdiffi=$(cat ${stu[j]}serdes.txt | grep -c ${diffi});
		serdiffi=$(echo ${vardiffi} | cut -d' ' -f 4);
                vardiffii=$(cat ${stu[j]}serdes.txt | grep ${diffii});
                cdiffii=$(cat ${stu[j]}serdes.txt | grep -c ${diffii});
                serdiffii=$(echo ${vardiffii} | cut -d' ' -f 4);
		vardiffiii=$(cat ${stu[j]}serdes.txt | grep ${diffiii});
                cdiffiii=$(cat ${stu[j]}serdes.txt | grep -c ${diffiii});
		serdiffiii=$(echo ${vardiffiii} | cut -d' ' -f 4);		

                for ((k=0; k<ling; k++)) do
			for ((n=1; n<=cmp; n++)); do
				if [[ ${sermp[n]} == ${ser[k]} ]]; then
                        	echo ${mp} run exists;
                        	#mv ${stu[j]} ${stu[j]/${mp}${cmp}
				mkdir -p ~/${dep}${sub[i]}${mp}${n}
				cp -R ${stu[j]}${ser[k]}/* ~/${dep}${sub[i]}${mp}${n}
				fi
			done
			if [[ ${serdiffi} == ${ser[k]} ]]; then
                        echo ${diffi} run exists;
                        #mv ${stu[j]} ${stu[j]/${diffi}${cdiffi};
                        mkdir -p ~/${dep}${sub[i]}${diffi}${cdiffi}
			cp -R ${stu[j]}${ser[k]}/* ~/${dep}${sub[i]}${diffi}${cdiffi}
			fi
			if [[ ${serdiffii} == ${ser[k]} ]]; then
                        echo ${diffii} run exists;
                        #mv ${stu[j]} ${stu[j]/${diffii}${cdiffii};
                        mkdir -p ~/${dep}${sub[i]}${diffii}${cdiffii}
			cp -R ${stu[j]}${ser[k]}/* ~/${dep}${sub[i]}${diffii}${cdiffii}
			fi
			if [[ ${serdiffiii} == ${ser[k]} ]]; then
                        echo ${diffiii} run exists;
                        #mv ${stu[j]} ${stu[j]/${diffiii}${cdiffiii};
                        mkdir -p ~/${dep}${sub[i]}${diffiii}${cdiffiii}
			cp -R ${stu[j]}${ser[k]}/* ~/${dep}${sub[i]}${diffiii}${cdiffiii}
			fi
                done
        done
done

echo done renaming

