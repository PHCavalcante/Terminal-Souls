#!/bin/bash

echo "Hello adventurer! welcome to mini RPG!"
sleep 1
echo "Please select your class:
(1) - Beserker
(2) - Archer
(3) - Magician
(4) - Weapon Master
(5) - Dwarf
(6) - Summoner
(7) - Assasin"

read class

case $class in
	1)
		type="Beserker"
		Hp=15
		attack=6
		defense=6
		speed=6
		magic=1
		;;
	2)
		type="Archer"
		Hp=8
		attack=8
		defense=5
		speed=7
		magic=1
		;;
	3)
		type="Magician"
		Hp=5
		attack=10
		defense=4
		speed=5
		magic=10
		;;
	4)
		type="Weapon Master"
		hp=12
		attack=6
		defense=6
		speed=6
		magic=1
		;;
	5)
		type="Dwarf"
		hp=10
		attack=7
		defense=6
		speed=4
		magic=1
		;;
	6)
		type="Summoner"
		hp=7
		attack=5
		defense=5
		speed=6
		magic=8
		;;
	7)
		type="Assasin"
		hp=6
		attack=15
		defense=4
		speed=10
		magic=1
esac

sleep 1

echo "Your choice is $type, very well..."
sleep 2
echo "Your adventure starts... NOW!"
sleep1
echo "Loading ."
sleep 1
echo "Loading .."
sleep 1
echo "Loading ..."
sleep 1
echo "Loading ."
sleep 1
echo "Loading .."
sleep 1
echo "Loading ..."
sleep 3


echo "A beast apeared!"
sleep 1
echo "You will need to fight"
sleep 1
echo "Press (x) to roll the dice"
read dice
echo "Rolling the dice..."
sleep 5

if [[ $dice == "x" ]]; then

	result=$(( $RANDOM % 10 ))
	echo $result
fi 



