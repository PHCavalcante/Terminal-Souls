#!/bin/bash


if ! command -v play &> /dev/null || [! command -v mpg321 &> /dev/null]; then
    echo "'sox' and 'play' are not installed."
    sleep 3
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
clear
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

main_menu(){
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
	echo "Please choose an option:"
	sleep 1
	echo "1) Play!"
	echo "2) About!"
	echo "3) Quit!"
	read choice

	if [ "$choice" = "1" ]; then
		clear
	elif [ "$choice" = "2" ]; then
		echo "Redirecting..."
		sleep 3
		clear
		if [ "$OSTYPE" == "linux-gnu"* ]; then
			xdg-open https://github.com/PHCavalcante/Terminal-Souls
			main_menu
		elif [ "$OSTYPE" == "darwin10.5.0"* ]; then
			open https://github.com/PHCavalcante/Terminal-Souls
			main_menu
		elif [ "$OSTYPE" == "msys" ]; then
			start https://github.com/PHCavalcante/Terminal-Souls
			main_menu
		elif [ "$OSTYPE" == "win32" ]; then
			start https://github.com/PHCavalcante/Terminal-Souls
			main_menu
		else 
			echo "OS not recognized or suportted, sorry."
			main_menu
		fi
	sleep 5
	clear
	else
		clear
		exit 1
		fi
}

main_menu

sleep 2

# some lore and beggining of journey
echo "In the quiet village of Eldoria, nestled within the vast expanse of the Enchanted Forest, rumors spread like wildfire. Whispers of darkness creeping at the edges of the realm had reached even the most remote corners of the land. Tales of ancient evils awakening from their slumber stirred unease among the villagers.

As dusk settled over Eldoria, a chilling howl pierced the tranquility of the night. The once lush and vibrant forest now seemed shrouded in an eerie mist, concealing secrets long forgotten. Fear gripped the hearts of the villagers as they gathered in the town square, their eyes filled with trepidation and uncertainty.

Amidst the crowd stood a figure cloaked in mystery, a wanderer whose arrival seemed destined by the hands of fate. With eyes as sharp as a falcon's and a demeanor veiled in determination, this stranger bore the mark of a hero. Whispers among the villagers spoke of prophecies foretelling the coming of one who would rise against the encroaching darkness, a hero destined to vanquish the shadows and restore peace to the realm.

It is in this moment of darkness that the call of the hero echoes through the land, beckoning forth those brave enough to heed its summons. For in the heart of adversity lies the crucible of legends, where the fate of the realm hangs in the balance, waiting for a champion to emerge and embark on a quest of unparalleled peril and glory. And thus, the journey begins..."

choosing_class(){
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
		weapon="Sword"
		;;
	2)
		type="Archer"
		Hp=8
		attack=8
		defense=5
		speed=7
		magic=1
		weapon="Crossbow"
		;;
	3)
		type="Magician"
		Hp=5
		attack=10
		defense=4
		speed=5
		magic=10
		weapon="Wand"
		;;
	4)
		type="Weapon Master"
		hp=12
		attack=6
		defense=6
		speed=6
		magic=1
		weapon="Dual Swords"
		;;
	5)
		type="Dwarf"
		hp=10
		attack=7
		defense=6
		speed=4
		magic=1
		weapon="Axe"
		;;
	6)
		type="Summoner"
		hp=6
		attack=5
		defense=5
		speed=6
		magic=8
		weapon="Summons wand"
		;;
	7)
		type="Assasin"
		hp=6
		attack=15
		defense=4
		speed=10
		magic=1
		weapon="Poison dagger"
esac
}

choosing_class

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

random_chests(){
  chest=$((RANDOM % 2))
  if [[ $chest == "1" ]]; then
    echo "You just found a chest!"
    echo "Do you want to open it? (y/n)"
    read choice
    if [[ $choice == "y" ]]; then
      mimic=$((RANDOM % 10))
      if [[ $mimic == "1" ]]; then
        echo "Oh no! it is a mimic!"
        if [[ $hp -le 6 ]]; then
          echo "You Died!"
          exit 1
        else
          hp=$((hp - 3))
          echo "He bitted you, but luckily you survived!"
          echo "You lost 3 HP."
        fi
        sleep 3
        exit 1
      else
        item=$((RANDOM % 10))
        case $item in
          1)
            name="Life Potion"
            type="potion"
            price=10
            ;;
          2)
            name="Gold coin"
            type="coin"
            price=1
            ;;
          3)
            name="Magical Sword"
            type="weapon"
            price=50
            ;;
          4)
            name="Broken Sword"
            type="weapon"
            price=0
            ;;
          5)
            name="Light Armor"
            type="armor"
            price=10
            ;;
          6)
            name="Heavy Armor"
            type="armor"
            price=50
            ;;
          7)
            name="Shield"
            type="armor"
            price=20
            ;;
          8)
            name="Ring of Strength"
            type="accessory"
            price=30
            ;;
          9)
            name="Ring of Intelligence"
            type="accessory"
            price=30
            ;;
          0)
            name="Ring of Speed"
            type="accessory"
            price=30
            ;;
        esac
      fi
    fi
  fi
}

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
echo "It wakes up suddenly and looks at you with its red eyes."
sleep 1
echo "Its breath can kill you instantly!"
sleep 1
echo "You can't run, your only option is fight!"
sleep 1
echo "What do you want to do?"
echo "[A]Attack it with all your strenght"

dmg=10
if [[$choice == "a"]] || [[$choice == "A"]] then
	$dragon_hp= $((dragon_hp - dmg))
	echo "Attacked with a sword and dealt $dmg points."
	
dragon_hp=500
player_hp=100

dragon_turn(){
	random= $(RANDOM % 4)
	case $random in
	1)	
		echo "The dragon roars loudly and charges towards you!"
		sleep 3
		echo "With his deadly claws he  attacks you!"
		sleep 1
		echo "You try to escape, but he hits you directly"
		player_hp=  $((player_hp - 25))
		echo "Ouch! You lost 25 HP. Now you have $player_hp/100 HP left."
		;;
	2)
		echo "The dragon stands still for a while, like it is charching somenting"
		sleep 2
		echo "You see that his chest is slowning turning red"
		sleep 1
		echo "You know well what this means"
		sleep 1
		echo "You starts to run imediatly  away from the monster"
		sleep 1
		echo "With his charge complete, he blasts a huge  fireball right at you!"
		sleep 1
		echo "Luckly it  doesn't hit you directly, but it still hurts a lot"
		player_hp= $((player_hp - 25))
		;;
	3)
		echo "The dragon looks around very confused"
		sleep 2
		echo "He seems to be looking for something or someone else"
		sleep 1
		echo "As soon as he turns around, he continues his attack"
		dragon_turn
		;;
esac
}

player_turn(){
	random= $(RANDOM % 4)
	case $random in

	1)
		echo "You decide to fight back with your sword"
		echo "You swing your sword at the dragons neck"
		sleep 1
		echo "But unfortunately you miss and hit the dragons shoulder instead"
		sleep 1
		dragon_hp= $((dragon_hp - 7))
		echo "That was a glancing blow and only hurt him slightly"
		;;
	2)
		echo "
}

while true ; do
	if [[$choice == "a"]] || [[$choice == "A"]] then
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
