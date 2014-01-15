#Naomi Plasterer
#Level 4 used instance variables to store previous health

class Player
  def play_turn(warrior)
    
    if (warrior.health == 20)
      if (warrior.feel.empty?)
        warrior.walk!
      else
        if (warrior.feel.captive?)
          warrior.rescue!
        else
          warrior.attack!
        end
      end
    @health=warrior.health
    else
      if (warrior.feel.empty?)
        if (warrior.health < @health)
          warrior.walk!
        else
          warrior.rest!
        end 
      else
        if (warrior.health < @health)
          if (warrior.feel.captive?)
            warrior.rescue!
          else
            warrior.attack!
          end
        else
          warrior.rest!
        end 
      end
      @health=warrior.health
    end
    
  end
end
