require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_02'

puts "-----------------------------------------------------"
puts "|Bienvenue sur  MOOTHAFUKERZ 2, le retour des vaches|"
puts "|Kill all the cows! Now, get a mooooove on!         |"
puts "-----------------------------------------------------"


#Joueur Humain
puts "What's your name cowboy ?"
player_name = gets.chomp
player1 = HumanPlayer.new(player_name)

print "> Howdy, #{player1.name}!!"

#NPCs
player2 = Player.new("Hector the bull")
player3 = Player.new("Dolly the cow")
ennemies = [player2, player3]

#Let's get ready to rumble

while player1.life_points > 0 && player2.life_points > 0 && player3.life_points > 0 do 
  player1.attacks(player2)

  if player2.life_points <= 0 && player3.life_points <= 0
    break
  end

  if player2.life_points > 0
    player2.attacks(player1)
  end
  
  if player1.life_points <= 0
    break
  end
  
  if player1.life_points > 0
  player1.attacks(player3)
  end
  
  if player3.life_points <= 0 && player2.life_points <= 0
    break
  end

  if player3.life_points > 0
  player3.attacks(player1)
  end
  
  if player1.life_points > 0
    player1.attacks(player3)
  end
end

if player1.life_points >= 0 && player2.life_points <= 0 && player3.life_points <= 0 
  puts "You're a real cowboy YEEEEHAAAAAA ! "
else
  puts "#{player1.name} has 0 life points remaining."
  puts "you have lost, looooser!"
end

binding.pry
puts "fin du game" 
