require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_03'

puts "-----------------------------------------------------"
puts "|Bienvenue sur  MOOTHAFUKERZ 2, le retour des vaches|"
puts "|Kill all the cows! Now, get a mooooove on!         |"
puts "-----------------------------------------------------"


#Joueur Humain
puts "What's your name cowboy ?"
player_name = gets.chomp
player1 = HumanPlayer.new(player_name)

print "> Howdy, #{player1.name}!!\n\n"

#NPCs
player2 = Player.new("Hector the bull")
player3 = Player.new("Dolly the cow")
enemies = [player2, player3]

#combat
puts "Let's get ready to rumble!!\n\n"

def menu(player1, player2, player3)
  puts "\n\n"
  puts "A toi de jouer #{player1.name}, tu veux ?"    #menu options
  puts "---------------------------"
  puts "a - tester une nouvelle arme"
  puts "s - se soigner"
  puts "\n\n"
  puts "Attaquer une vache en vue :"
  puts "---------------------------"
  if player2.life_points > 1
    puts "0 - pour attaquer Hector the bull qui à #{player2.life_points} points de vie"
  end
  if player3.life_points > 1
    puts "1 - pour attaquer Dolly the cow qui à #{player3.life_points} points de vie"
  end

  puts "\n\n"
  decision = gets.chomp.to_s    # menu
  case decision
    when "a" 
      player1.search_weapon  #si le jouer décide de chercher une meilleur arme

    when "s"
      player1.search_health_pack  #si le jouer décide de chercher un health pack

    when "0" 
      player1.attacks(player2)   #si le jouer décide d'attaquer Hector the bull

    when "1"
      player1.attacks(player3)   #si le jouer décide d'attaquer Dolly the cow
    else
      puts "You're enemies benefit from your indecision!"
    end
  end
    while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
      menu(player1, player2, player3)
    puts "Here they come!"
      enemies.each do |enemy|
        if enemy.life_points > 0
          enemy.attacks(player1)
        end
      end
    end
puts "La partie est finie"
  if player1.life_points > 0
    puts "You're a real cowboy YEEEEHAAAAAA ! "
  else
    puts "#{player1.name} has 0 life points remaining."
    puts "you have lost, looooser!"
  end
  

binding.pry
puts "fin du game" 