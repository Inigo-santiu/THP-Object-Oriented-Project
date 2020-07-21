require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josiane")

puts "Let the battle begin... \n"

puts "Player 1 is José. #{player1.show_state}"
puts " "*10
puts " "*10
puts " "*10
puts "Player 2 is Josiane. #{player2.show_state}"

while player1.hit_points > 0 && player2.hit_points > 0 do
  player1.attack(player2)
  puts "#{player1} attacks #{player2} for #{compute_damage} damage."
  
  if player2.hit_points <= 0 
    break
  end

  player2.attack(player1)
  puts "#{player2} attacks #{player1} for #{compute_damage} damage."
  
  if player1.hit_points <= 0 
    break
  end
  puts "This is the state of our fighters..."
  puts "#{player2} has #{show_state}\n"
  puts "#{player1} has #{show_state}\n"

end

binding.pry
puts "Thank you for watching." 