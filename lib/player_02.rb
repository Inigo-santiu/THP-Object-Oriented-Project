require 'pry'

class Player
  attr_accessor :name, :hit_points
  
  def initialize(player_name)   # Where we get everything started by creating the players
    @name = player_name.to_s
    @hit_points = 10
  end

  def show_state        #The individual details
    puts "#{@name} has #{@hit_points} HP"
  end

  def gets_damage(damage)   # This converts the damage
    @hit_points = @hit_points - damage
  end
	
	def compute_damage      # This is the damage calculator
    return rand(1..6)
  end

  def attacks(player)   #These are the fight mechanics
		puts "#{@name} attacks #{player.name}!"
		damage = compute_damage
    player.gets_damage(damage)
    
		if player.hit_points > 0    #This allows the player to continue the fight
		puts "#{@name} inflicts #{damage} points of damages with an attack! "
		else 
			puts "Look, #{player.name} more steak for the grill!"
    end

  end
    
end 

class	HumanPlayer < Player      # Taking the details from class Player to the next level
	attr_accessor :weapon_level

  def initialize(player_name) #initiating the new player hp level
    super(player_name)
    @hit_points = 100
    @weapon_level = 1 
  end

  def show_state    #The individual details
    puts "#{@name} has #{@hit_points} HP and a level #{@weapon_level} weapon."
  end

  def compute_damage    # This is the damage calculator
    rand(1..6) * @weapon_level
  end

  def search_weapon     # These are the weapon mechanics
    new_weapon_level = rand(1..6)
    puts new_weapon_level

      if  new_weapon_level > @weapon_level  # This prevents you from using a poorer weapon
        @weapon_level = new_weapon_level
        puts "You have found a better cow-killing weapon #{new_weapon_level}"  
      else
        puts "A level #{new_weapon_level} weapon in inferior to the one in your hand!"
      end
  end

  def search_health_pack
    dice_health_pack = rand(1..6) # The roll to find a health pack
    if dice_health_pack == 1
      puts "Bad luck... nothing to be found."
    elsif dice_health_pack >= 2 && dice_health_pack <= 5
      @hit_points += 50     # the application of the HP
      if @hit_points > 100
        @hit_points = 100
        puts "You are at full health"
      else
        puts "You find a health pack with 50 HP. You now have #{@hit_points} HP."  
      end
    elsif
      @hit_points += 80   # the application of the HP
      if @hit_points > 100
        @hit_points = 100
        puts "T'es déjà au max mon gars, laisse un peu aux autres"
      else
        puts "You find a large health pack with 80 HP. You now have #{@hit_points} HP."
      end
    end
  end

end