class Player
  attr_accessor :name, :hit_points

  @hit_points = 10

  def initialize(player_name)
    @name = player_name
    @hit_points = 10
  end

  def show_state
    "#{@name} has #{@hit_points} hit points."
  end

  def gets_damage
    damage_value = compute_damage
    @hit_points = @hit_points - damage_value
    # puts "#{@name} received #{damage_value} points of damage."
    # if @hit_points <= 0
    #   puts "#{name} is dead."
    # else
    # end
    #   if @hit_points < 3 && @hit_points > 0
    #   puts "#{name} is in critical condition."
    #   end
  end

  def compute_damage
    return rand(1..6)
  end

  def attack(player)
    damage_value = compute_damage
    puts "#{name} attacks #{player.name} for #{damage_value} points of damage."
    player.hit_points = player.hit_points - damage_value
    if player.hit_points <= 0
      puts "#{player.name} is dead."
    else
    end
      if player.hit_points < 3 && player.hit_points > 0
      puts "#{player.name} is in critical condition."
      end
  end


end
puts "end of line"


# require 'pry'

# class Player
#   attr_accessor :name, :life_points
  
#   def initialize(player_name)
#     @name = player_name.to_s`````````````````
#     @life_points = 10
#   end

#   def show_state
#     puts "#{@name} à #{@life_points} points de vie"
#   end

#   def gets_damage(damage)
#     @life_points = @life_points - damage
#   end
	
# 	def compute_damage
#     return rand(1..6)
#   end

#   def attacks(player)
# 		puts "le joueur #{@name} attaque le joueur #{player.name} !"
# 		damage = compute_damage
#     player.gets_damage(damage)
    
# 		if player.life_points > 0
# 		puts "il lui inflige #{damage} points de dommages, sur un JackKnife du tonnerre "
# 		else 
# 			puts "Oups, #{player.name} c'est fait décapité..."
#     end

#   end
    
# end 
	




# class	HumanPlayer < Player
# 	attr_accessor :weapon_level 

# 	def initialize(player_name)
#     @name = player_name.to_s
#     @life_points = 100
#     @weapon_level = 1 
# 	end

# end