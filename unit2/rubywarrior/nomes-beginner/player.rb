#Naomi Plasterer
#used instance variables to store previous health
#Used constant to store the max health
#used class variable for refrencing forward or backwards
#used functions for repative code like checking health etc
#used hash
#used array used to store previously visited places

class Player
  @health = nil
  @@wall = false
  @@attacktime = 0
  def play_turn(warrior)
    if (@@wall == false)
      if (warrior.feel(:backward).wall?)
        @@wall = true
      else
        if (warrior.feel(:backward).captive?)
          warrior.rescue!(:backward)
        else
          warrior.attack!
        end
      end
    else
      if (warrior.feel.empty?)
        if(warrior.health < @health || warrior.health < 15 && @@attacktime < 2)
          warrior.shoot!
          @@attacktime = @@attacktime + 1
        elsif(warrior.health != 20 && warrior.health>=@health)
          warrior.rest!
        else
          warrior.walk!
        end
      else
        if (warrior.health <= @health)
          if (warrior.feel.captive?)
            warrior.rescue!
          else
            warrior.attack!
          end
        else
          warrior.rest!
        end
      end
    end
  @health = warrior.health 
  end
end
