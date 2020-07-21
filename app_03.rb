require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_03'

puts "----------------------------------------------"
puts "|       Welcome to the Real Cow level!       |"
puts "| Kill all the cows! Now, get a mooooove on! |"
puts "----------------------------------------------"


# These are the users details
puts "What's your name cowboy ?"
player_name = gets.chomp
player1 = HumanPlayer.new(player_name)

print "> Howdy, #{player1.name}!!\n\n"

puts "Here come the cows, get ready!"
#NPCs
player2 = Player.new("Hector the bull")
player3 = Player.new("Dolly the cow")
enemies = [player2, player3]

# Below is the combat menu combat
puts "Let's get ready to rumble!!\n\n"

def menu(player1, player2, player3)
  puts "\n\n"
  puts "So, #{player1.name}, there are 2 of em to fight. Waddya wanna do??\n"    # Menu options for items
  puts "---------------------------"
  puts "a - pick up a new weapon from the ground."
  puts "s - loot the corpses for a health pack."
  puts "\n\n"
  puts " :"
  puts "---------------------------"                                            # Menu options for combat
  if player2.life_points > 1
    puts "0 - to attack Hector the bull who has #{player2.life_points}HP"
  end
  if player3.life_points > 1
    puts "1 - to attack Dolly the cow who has #{player3.life_points}HP"
  end

  puts "\n\n"
  decision = gets.chomp.to_s    # User responds to the dilemma
  case decision
    when "a" 
      player1.search_weapon  # The player decides to pick up a weapon

    when "s"
      player1.search_health_pack  #The player decides to pick up a health pack

    when "0" 
      player1.attacks(player2)   #The player attacks Hector the bull

    when "1"
      player1.attacks(player3)   #The player attacks Dolly the cow
    else
      puts "You're enemies benefit from your indecision!" # Don type nonsense
    end
  end
    while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
      menu(player1, player2, player3)
    puts "Here they come!"
      enemies.each do |enemy|     # The enemies will attack you based on a .each do loop that will cycle through them.
        if enemy.life_points > 0
          enemy.attacks(player1)
        end
      end
    end
puts "This fight is over!"
  if player1.life_points > 0      #This is the win condition.
    puts "You're a real cowboy YEEEEHAAAAAA!!"
  else
    puts "#{player1.name} has 0 life points remaining."  # This cannot happen unless you ask for it.
    puts "You have lost, looooser!"
  end
  

binding.pry
puts "end of line"  #Tron references are the best.