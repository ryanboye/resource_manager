require "util"
require "defines"

i = 0

script.on_init(function()
    -- write_file('resources.txt', 'hello world')
end)


-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    else
      print(formatting .. v)
    end
  end
end

script.on_event(defines.events.on_tick, function(event)
    i = i + 1
    -- game.player.print(i)
    if i % 200 == 0 then
        for k,v in
            pairs(game.player.get_inventory(1).get_contents()) do game.player.print(k .. v) 
        end
    end
end)