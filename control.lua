script.on_event(defines.events.on_player_mined_entity, function(event)
    local player = game.players[event.player_index]
    if event.entity then
        if string.find(event.entity.name, "tree-") then
            if math.random(1, 100) > 90 then
                player.get_main_inventory().insert({name = "sb-larva", amount = 1})
            end
        end
    end
end)
