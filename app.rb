require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josiane")

puts " "
puts "Let the battle begin..."
puts " "     

puts "Player 1 is José. #{player1.show_state}"        # Player 1
puts " "
puts "Player 2 is Josiane. #{player2.show_state}"     # Player 2

while player1.hit_points > 0 && player2.hit_points > 0 do # This establishes the loop to maintain consistent "combat" between the two characters involved.
  player1.attack(player2)
  
  if player2.hit_points <= 0    # This is the loss condition for player 2
    break   #This breaks the loop
  end

  player2.attack(player1)

  if player1.hit_points <= 0    # This is the loss condition for player 1
    break   #This breaks the loop
  end
  puts " "
  puts "This is the state of our fighters..."
  puts " "
  puts "#{player1.name} has #{player1.show_state}"
  puts "#{player2.name} has #{player2.show_state}"
  puts " "
  puts "And, they're off!"

end

binding.pry
puts "Thank you for watching." 