require "util"
require "defines"

i = 0

script.on_init(function()
    -- write_file('resources.txt', 'hello world')
end)

script.on_event(defines.events.on_tick, function(event)
    i = i + 1
    inv = ''
    if i % 200 == 0 then
        for a,b in pairs(game.players) do
            for k,v in pairs(game.players[a].get_inventory(1).get_contents()) do 
                inv = inv .. (k .. ' ' .. v .. '\n') 
            end
        end
        game.write_file('test', inv)
    end
end)