require "util"
require "defines"

--The code for FreeER's Step By Step Guide to Modding Factorio (Created for Factorio 0.3.x Updated to 0.10.x) AKA Bomber Mod
game.oninit(function()
glob.bomber = 0
end)

game.onevent(defines.events.ontick, function(event)
  if game.player.character and game.player.character.vehicle and game.player.character.vehicle.name == "bomber" 
and game.player.character.vehicle.getinventory(2).getitemcount("bomb") >= 1 and event.tick-glob.bomber >= 180 then
    local bomb = game.findentities{{game.player.character.vehicle.position.x-5,game.player.character.vehicle.position.y-5},
{game.player.character.vehicle.position.x+5,game.player.character.vehicle.position.y+5}}
    local drop = false
    local biters = 0
    for k,v in pairs(bomb) do
      if v.force.equals(game.forces.enemy) then
        drop = true
        if v.name == "small-biter" or v.name == "medium-biter" or v.name == "big-biter" then
          biters = biters + 1
          if biters < 5 then --if five or more will be killed then drop
            drop = false
          end
        end
      end
    end
    if drop then
      glob.bomber = event.tick
      for k,v in pairs(bomb) do
        if v.force.equals(game.forces.enemy) then
          if v.health then
            v.die()
          else
            v.destroy()
          end
        end
      end
      game.player.character.vehicle.getinventory(2).remove{name="bomb", count=1}
    end
  end
end)