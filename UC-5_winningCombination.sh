#! /bin/bash -x

declare -A coin coin1

#coin[head-head]=''
#coin[head-tail]=''
#coin[tail-head]=''
#coin[tail-tail]=''

coin[heads-heads]=0
coin[heads-tails]=0
coin[tails-heads]=0
coin[tails-tails]=0

#coin[head]=''
#coin[tail]=''
coin1[heads]=0
coin1[tails]=0

for ((i=1; i<=20; i++))
do
	ran=$((RANDOM%2))
	if [ $ran -eq 0 ]
	then
		#coin[head]+=H
		((coin1[heads]++))
	else
		#coin[tail]+=T
		((coin1[tails]++))
	fi
done
#echo ${coin[@]}

if [[ ${coin1[heads]} -lt ${coin1[tails]} ]]
then
	t=${coin1[heads]}
	coin1[heads]=${coin1[tails]}
	coin1[tails]=$t
fi

echo "Singlet sorting : ${coin1[@]}"

for ((i=0; i<20; i++))
do
ran=$((RANDOM%2))
num=$((RANDOM%2))
if [[ $ran -eq 0 && $num -eq 0 ]]
then
	#coin[head-head]+=HH
	((coin[heads-heads]++))
elif [[ $ran -eq 0 && $num -eq 1 ]]
then
	#coin[head-tail]+=HT
	((coin[heads-tails]++))
elif [[ $ran -eq 1 && $num -eq 0 ]]
then
	#coin[tail-head]+=TH
	((coin[tails-heads]++))
elif [[ $ran -eq 1 && $num -eq 1 ]]
then
	#coin[tail-tail]+=TT
	((coin[tails-tails]++))
fi
done

for (( i=0; i<=${#coin[@]}; i++ ))
do
	for (( j=$i; j<=${#coin[@]}; j++ ))
	do
		if [[ ${coin[heads-heads]} -gt ${coin[heads-tails]} && ${coin[tails-heads]} -gt ${coin[tails-tails]} ]]
		then
			m=${coin[heads-heads]}
			coin[heads-heads]=${coin[heads-tails]}
			coin[heads-tails]=$m
			n=${coin[tails-heads]}
			coin[tails-heads]=${coin[tails-tails]}
			coin[tails-tails]=$n
		fi
	done
done

echo ${coin[@]}

#echo ${coin[@]}
