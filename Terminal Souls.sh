#!/bin/bash

function getting_monsters {
	monsters= $(($RANDOM % 4))  
	case $monsters in
		1)
			name="Goblin"
			lp=5
			m_attack=2
			m_defense=0
			m_speed=4
			;;
		2)
			name="Ogre"
			lp=8
			m_attack=3
			m_defense=1
			m_speed=6
			;;
		3)
			name="Troll"
			lp=12
			m_attack=4
			m_defense=2
			m_speed=2
			;;
	esac
}

echo "Hello adventurer! Welcome to Terminal Souls!"
sleep 2
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

function battling {
	while true
	do
		getting_monsters
		echo "You are fighting a $name."
		echo "||Your Hp: $hp||   ||$name Hp: $lp||"
		echo  -n "What do you want to do? (Attack/Defend/Magic): "
		read action
		case $action in
			Attack)
				damage=$(($RANDOM%(attack-defense+1)+1))
				echo "You did $damage points of damage in $name!"
				lp=$(($lp-$damage))
				if [ $lp -le 0 ]
				then
					echo "Congratulations! You have defeated $name the enemy!"
					exit
				fi
				;;
			Defend)
				hp=$(($RANDOM%($m_attack - $defense)))
				echo "You defended but losed  $hp hp."
				echo "||Your Hp: $hp||   ||$name Hp: $lp||"
				sleep 2
				battling
				;;
			Magic)
				dmg=$((RANDOM % (magic + 1)))
				echo "You used magic and dealt $dmg points of damage in $name"
				$lp=($lp - $dmg)
				if [ lp -le 0]
				then
					echo "The magic was too powerful for $name and killed it."
				fi
				else
					echo "But $name still has $lp HP left."
				fi
}

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
