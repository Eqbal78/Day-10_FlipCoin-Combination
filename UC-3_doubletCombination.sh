#! /bin/bash -x

declare -A coin

coin[head-head]=''
coin[head-tail]=''
coin[tail-head]=''
coin[tail-tail]=''

coin[heads-heads]=0
coin[heads-tails]=0
coin[tails-heads]=0
coin[tails-tails]=0


for ((i=0; i<20; i++))
do
ran=$((RANDOM%2))
num=$((RANDOM%2))
if [[ $ran -eq 0 && $num -eq 0 ]]
then
	coin[head-head]+=HH
	((coin[heads-heads]++))
elif [[ $ran -eq 0 && $num -eq 1 ]]
then
	coin[head-tail]+=HT
	((coin[heads-tails]++))
elif [[ $ran -eq 1 && $num -eq 0 ]]
then
	coin[tail-head]+=TH
	((coin[tails-heads]++))
elif [[ $ran -eq 1 && $num -eq 1 ]]
then
	coin[tail-tail]+=TT
	((coin[tails-tails]++))
fi
done

#echo ${coin[@]}
	
percent=$((100*${coin[heads-heads]}/20))
echo "Percentage HH: $percent"

percent=$((100*${coin[tails-heads]}/20))
echo "Percentage TH: $percent"

percent=$((100*${coin[heads-tails]}/20))
echo "Percentage HT: $percent"

percent=$((100*${coin[tails-tails]}/20))
echo "Percentage TT: $percent"
