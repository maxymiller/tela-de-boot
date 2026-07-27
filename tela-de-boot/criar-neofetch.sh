#!/bin/bash

#maxymemoneo="$(neofetch)"
#maxymemoneo2="$(echo ""$maxymemoneo"" | cat -n)"
neofetch > neofetch.txt
maxymemoneo2="$(cat ./neofetch.txt)"

maxyloopout=0
maxylopp=0
echo
#echo -e "\e[1A"
while [ "$maxyloopout" != "" ]
do
	maxyloop=$(($maxyloop+1))
	./ver-line.sh "1" "$maxymemoneo2" "${maxyloop}p" > ./in.txt
	maxyloopout="$(cat ./in.txt)"
	#$maxyloopout
	echo -e "\e[1A[$0] (1/2) $maxyloop"
	#echo "$maxyloopout"
done
maxyloop="$(($maxyloop-1))"
#echo "$maxyloop"
#echo -e "\e[1A"

maxyloop2=0
#maxyloopout=0
echo
while [ "$maxyloop2" != "$maxyloop" ]
do
	maxyloop2=$(($maxyloop2+1))
	./ver-line.sh "2" "$maxymemoneo2" "${maxyloop2}p" > ./in.txt
	echo -e "\e[1A[$0] (2/2) $maxyloop2"
	if [ "$maxyloop2" == "1" ]
	then
		echo "\e[24A\e[3C$(cat ./in.txt)" > ./out1.txt
	else
		#if [ "$maxyloop2" == "18" ]
		#then
			#echo "\e[3C$(cat ./erro.txt)" >> teste2.txt
		#else
			echo "\e[3C$(cat ./in.txt)" >> ./out1.txt
		#fi
	fi
done
