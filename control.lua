script.on_event(defines.events.on_player_mined_entity, function(event)
    local player = game.players[event.player_index]
    if event.entity then
        if string.find(event.entity.name, "tree-") then
            if math.random(1, 100) > 90 then
                local inserted = player.get_main_inventory().insert({name = "sb-larva", amount = 1})
                if inserted > 0 then
                    player.print({"messages.sb-found-larva"})
                end
            end
        end
    end
end)
