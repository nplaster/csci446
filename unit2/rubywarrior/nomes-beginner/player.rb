#Naomi Plasterer
#used instance variables to store previous health
#Used constant to store the max health
#used class variable for refrencing if the wall was found or not
#used functions for repative code like checking health etc
#used hash to store places already been
#used array to store the array retrieve from warrior.look

class Player
  MAXHEALTH = 20
  @health = 20
  @@wall = false
  
  def play_turn(warrior)
    if (warrior.feel.wall?)
      warrior.pivot!
      @@wall = true
    elsif (warrior.feel.captive?)
        warrior.rescue!
    elsif (warrior.feel.enemy?)
        warrior.attack!
    else
      if (warrior.health == MAXHEALTH)
        warrior.walk!
      elsif (warrior.look.any? { |space| space.enemy? })
        warrior.shoot!
      else
        warrior.rest!
      end
    end
  @health = warrior.health 
  end
end
