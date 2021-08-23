#! /bin/bash -x

declare -A coin

coin[head-head-head]=''
coin[tail-head-head]=''
coin[head-tail-head]=''
coin[head-head-tail]=''

coin[head-tail-tail]=''
coin[tail-head-tail]=''
coin[tail-tail-head]=''
coin[tail-tail-tail]=''

coin[1]=0
coin[2]=0
coin[3]=0
coin[4]=0

coin[5]=0
coin[6]=0
coin[7]=0
coin[8]=0


for ((i=0; i<50; i++))
do
	ran=$((RANDOM%2))
	num=$((RANDOM%2))
	sum=$((RANDOM%2))
	if [[ $ran -eq 0 && $num -eq 0 && $sum -eq 0 ]]
	then
		coin[head-head-head]+=HHH
		((coin[1]++))
	elif [[ $ran -eq 1 && $num -eq 0 && $sum -eq 0 ]]
	then
		coin[tail-head-head]+=THH
		((coin[2]++))
	elif [[ $ran -eq 0 && $num -eq 1 && $sum -eq 0 ]]
	then
		coin[head-tail-head]+=HTH
		((coin[3]++))
	elif [[ $ran -eq 0 && $num -eq 0 && $sum -eq 1 ]]
	then
		coin[head-head-tail]+=HHT
		((coin[4]++))


	elif [[ $ran -eq 0 && $num -eq 1 && $sum -eq 1 ]]
	then
	   coin[head-tail-tail]+=HTT
	   ((coin[5]++))
	elif [[ $ran -eq 1 && $num -eq 0 && $sum -eq 1 ]]
	then
	   coin[tail-head-tail]+=THT
	   ((coin[6]++))
	elif [[ $ran -eq 1 && $num -eq 1 && $sum -eq 0 ]]
	then
	   coin[tail-tail-head]+=TTH
	   ((coin[7]++))
	elif [[ $ran -eq 1 && $num -eq 1 && $sum -eq 1 ]]
	then
	   coin[tail-tail-tail]+=TTT
	   ((coin[8]++))

	fi
done

#echo ${coin[@]}
	
percent=$((100*${coin[1]}/20))
echo "Percentage of HHH: $percent"

percent=$((100*${coin[2]}/20))
echo "Percentage of THH: $percent"

percent=$((100*${coin[3]}/20))
echo "Percentage of HTH: $percent"

percent=$((100*${coin[4]}/20))
echo "Percentage of HHT: $percent"

percent=$((100*${coin[5]}/20))
echo "Percentage of HTT: $percent"

percent=$((100*${coin[6]}/20))
echo "Percentage of THT: $percent"

percent=$((100*${coin[7]}/20))
echo "Percentage of TTH: $percent"

percent=$((100*${coin[8]}/20))
echo "Percentage of TTT: $percent"
