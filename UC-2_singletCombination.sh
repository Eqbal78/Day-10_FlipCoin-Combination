#! /bin/bash -x

declare -A coin

coin[head]=''
coin[tail]=''
coin[heads]=0
coin[tails]=0

for ((i=1; i<=10; i++))
do
	ran=$((RANDOM%2))
	if [ $ran -eq 0 ]
	then
		coin[head]+=H
		((coin[heads]++))
	else
		coin[tail]+=T
		((coin[tails]++))
	fi
done
echo ${coin[@]}
	
percent=$((100*${coin[heads]}/10))
echo "Percentage: $percent"

percent=$((100*${coin[tails]}/10))
echo "Percentage: $percent"

