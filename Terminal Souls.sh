#!/bin/bash

if ! command -v play &> /dev/null || [! command -v mpg321 &> /dev/null]; then
    echo "'sox' and 'play' are not installed."
    sleep 5
    echo "mpg321 is not installed."
	sleep 2
	echo "Both  'sox' and 'mpg321' have been not found in your system."
	echo "At least one of them are needed to play music in the game"
	echo "Do you want to install them? (y/n)"
	read confim
	if [ "$confim" = 'y' ] || [ "$confim" = 'Y' ]; then
        sudo apt-get install sox mpg321 -y
	fi
fi

randomizing_monsters () {
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

echo "
████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗         ███████╗ ██████╗ ██╗   ██╗██╗     ███████╗
╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║         ██╔════╝██╔═══██╗██║   ██║██║     ██╔════╝
   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║         ███████╗██║   ██║██║   ██║██║     ███████╗
   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║         ╚════██║██║   ██║██║   ██║██║     ╚════██║
   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗    ███████║╚██████╔╝╚██████╔╝███████╗███████║
   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝    ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
                                                                                                               
"

echo "Hello adventurer! Welcome to Terminal Souls!"
sleep 2

main_menu(){
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
}

main_menu

sleep 2

echo "Are you sure you want to be an $type (y/n)?"
read confirm
clear
sleep 2
if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
	echo "Your choice is $type, very well..."
	sleep 1
	echo "This is your stats:"
	echo "HP: $hp"
	echo "Attack: $attack"
	echo "Defense: $defense"
	echo "Speed: $speed"
	echo "Magic: $magic"
	sleep 5
else
	main_menu
fi

battling () {
	while true
	do
		getting_monsters
		echo "You are fighting a $name."
		echo "||Your Hp: $hp||   ||$name Hp: $lp||"
		echo "What do you want to do? (Attack/Defend/Magic): "
		read action
		case $action in
			Attack)
				damage=$((RANDOM%(attack-defense+1)+1))
				echo "You did $damage points of damage in $name!"
				lp=$((lp-damage))
				if [ $lp -le 0 ]
				then
					echo "Congratulations! You have defeated $name the enemy!"
					exit
				else
					battling
				fi
				;;
			Defend)
				hp=$((RANDOM%($m_attack - $defense)))
				echo "You defended but losed  $hp hp."
				echo "||Your Hp: $hp||   ||$name Hp: $lp||"
				sleep 2
				battling
				;;
			Magic)
				dmg=$((RANDOM % (magic + 1)))
				echo "You used magic and dealt $dmg points of damage in $name"
				lp=$((lp-dmg))
				if [ $lp -le 0]
				then
					echo "The magic was too powerful for $name and killed it."
					break
				else
					echo "But $name still has $lp HP left."
					battling
				fi
				;;
			*)
				echo "Invalid action. Please try again."
				sleep 2
				battling
				;;
		esac
	done
}

sleep 1
clear
sleep 2
echo "Your adventure starts now! The dragon is sleeping peacefully on a mountain top."
read -n1 -r -p "Press space key to continue..." key

sleep 2
clear
# Start the battle with player's first attack
echo "It wakes up suddenly and looks at you with its red eyes."
echo "Its breath can kill you instantly!"
echo "What do you want to do?"
echo "[A]Attack it with your sword"
echo "[M]Use magic to defeat it"
choice="$(printf '%.8s' "$(od -An -t u4 /dev/urandom | tr -d ' \n')")"
case $choice in
	[a]* ) att_or_mag=Attack; dmg=$(($RANDOM%5+3)); echo Attacked with a sword and dealt $dmg points.; break ;;
	[m]* ) att_or_mag=Magic; magic=7; echo Used magic to cast a spell.; break ;;
	*    ) echo Invalid input; exit 1 ;;
esac

hp=$((10+$RANDOM%6+1))
echo "The dragon has $hp HP."

# Begin the game loop
while true ; do
	if [[ $att_or_mag == Magic ]] ; then
		dragon_turn
	else
		player_turn
	fi

	if [[ $hp -le 0 ]] ; then
		echo You have been defeated by the dragon... Game over.
		exit 0
	fi

	if [[ $dragon_hp -le 0 ]] ; then
		echo "Congratulations! You have slain the dragon!"
		break
	fi
done
sleep 1
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
