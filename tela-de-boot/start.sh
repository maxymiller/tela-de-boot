#!/bin/bash
sleep 3
#bash ./teste.sh; echo -e "$(cat teste.txt)"; sleep 1; echo -e "$(cat teste2.txt)"

echo -e "\e[32m free -h; lsblk; etc."

free -h > memo.txt
echo "#maxynada" >> memo.txt
#lsblk >> memo.txt
lsblk --output=TRAN,NAME,LABEL,FSSIZE,FSAVAIL,FSUSED,FSUSE%,TYPE,MOUNTPOINTS >> memo.txt
echo "#maxynada" >> memo.txt

cat /proc/mdstat >> memo.txt
echo "#maxynada" >> memo.txt

echo "Usuário: $USER" >> memo.txt
echo "Data: $(date)" >> memo.txt
echo "Uptime: $(uptime)" >> memo.txt
echo "#maxynada" >> memo.txt

#echo "bem-vindo" >> memo.txt
echo "$(figlet -f letter.tlf BEM-VINDO)" >> memo.txt

#echo -e "\e[32m free -h; lsblk --output=TRAN,NAME,LABEL,FSUSED,FSAVAIL,FSSIZE,FSUSE%,TYPE,MOUNTPOINTS"
echo
maxyloop=0
maxyloop2=0
maxyloopout=0
while [ "$maxyloopout" != "" ]
do
	maxyloop=$(($maxyloop+1))
        ./ver-line.sh 1 "$(cat ./memo.txt)" "${maxyloop}p" > ./in.txt
        maxyloopout="$(cat ./in.txt)"
        echo -e "\e[1A[$0] (1/1) $maxyloop"
done
echo -e "\e[2A"
while [ "$(($maxyloop+2))" != "$maxyloop2" ]
do
	maxyloop2=$(($maxyloop2+1))
        case "$maxyloop2" in
                1|2) echo -e "$(cat tela4.txt)";;
                3) echo -e "\e[1A$(cat tela3.txt)";;
		*) ./ver-line.sh 2 "$(cat memo.txt)" "$(($maxyloop2-3))p" > ./in.txt
		echo "\e[2C$(cat in.txt)" > ./out1.txt
		if [ "$(cat out1.txt)" != "\e[2C#maxynada" ]
		then
			echo -e "\e[2A$(cat out1.txt)"
			echo
		#else
			#echo -e "\e[1A$(cat tela4.txt)"
			#echo -e "\e[2A"
		fi
		echo -e "\e[1A$(cat tela3.txt)"
		if [ "$(cat out1.txt)" == "\e[2C#maxynada" ]
		then
			echo -e "\e[2A$(cat tela4.txt)"
			echo -e "$(cat tela4.txt)"
			sleep 0.1
			echo -e "\e[1A$(cat tela3.txt)"
		fi;;
        esac
        sleep 0.5
done
echo -e "\e[0m\e[?25h\e[?7h\e[1A"
sleep 5
echo -e "\e[32mneofetch..."
./criar-neofetch.sh
maxyloop=0
maxyloop2=0
maxyloopout=0
#echo -e "\e[2A"
#echo -e "\e[1A"
echo
while [ "$maxyloopout" != "" ]
do
	maxyloop=$(($maxyloop+1))
	./ver-line.sh 1 "$(cat ./out1.txt)" "${maxyloop}p" > ./in.txt
	maxyloopout="$(cat ./in.txt)"
	echo -e "\e[1A[$0] (1/1) $maxyloop"
done
maxyloop=$(($maxyloop-1))

#echo
maxyloop2=0
#while [ "$maxyloop2" != "$maxyloop" ]
#do
	#maxyloop2=$(($maxyloop2+1))
	#if [ "$maxyloop" == "1" ]
	#then
		#bash ./ver-line.sh 2 "$(cat ./teste2.txt)" "${maxyloop2}p" > ./teste3.txt
	#else
		#bash ./ver-line.sh 2 "$(cat ./teste2.txt)" "${maxyloop2}p" >> ./teste3.txt
	#fi
	#echo -e "\e[1A(2/2) $maxyloop2"
#done

echo -e "\e[4A"
#echo -e "$(cat tela.txt)"

while [ "$maxyloop2" != "26" ]
do
	maxyloop2=$(($maxyloop2+1))
	case "$maxyloop2" in
		1|2) echo -e "$(cat tela4.txt)";;
		*) echo -e "\e[1A$(cat tela3.txt)";;
	esac
	sleep 0.1
done

#echo -e "\e[24A$(cat tela2.txt)"
sleep 1
echo -e "\e[2A"
maxyloop2=0
while [ "$maxyloop2" != "$maxyloop" ]
do
	maxyloop2=$(($maxyloop2+1))
	./ver-line.sh 2 "$(cat ./out1.txt)" "${maxyloop2}p" > ./in.txt
	
	if cat ./in.txt | grep -Fq $'\e[9999999D'
	then
		echo -e "$(sed $'s/\e\\[9999999D//g' ./in.txt)"
	else
		echo -e "$(cat ./in.txt)"
	fi
	sleep 0.3
done
echo -e "\e[$(($maxyloop-18))A$(cat tela2.txt)"
sleep 10
