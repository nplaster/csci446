class Player
  def play_turn(warrior)
    
    if (warrior.health == 20)
      if (warrior.feel.empty?)
        warrior.walk!
      else
        warrior.attack!
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
          warrior.attack!
        else
          warrior.rest!
        end 
      end
      @health=warrior.health
    end
    
  end
end
