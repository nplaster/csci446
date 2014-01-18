#Naomi Plasterer
#used instance variables to store previous health
#Used constant to store the max health
#used class variable for refrencing if the wall was found or not
#used functions for repative code like checking health etc
#used hash to store places already been
#used array to store the array retrieve from warrior.look

class Player
  MAXHEALTH = 20
  @health = nil
  @@wall = false
  
  def play_turn(warrior)
    #check if you found a wall
    if (warrior.feel.wall?)
      warrior.pivot!
      @@wall = true
    elsif (warrior.feel.captive?)
        warrior.rescue!
    elsif (warrior.feel.enemy?)
        warrior.attack!
    else
      feelempty(warrior)
    end
    #set health to previos health
    @health = warrior.health
  end
  
  #if the warrior feels empty space do the following
  def feelempty(warrior)
    if (warrior.health == MAXHEALTH)
      warrior.walk!
    #check the array for enemies
    elsif (warrior.look.any? { |space| space.enemy? })
      warrior.shoot!
    else
      warrior.rest!
    end
  end
end
