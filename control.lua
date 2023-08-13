script.on_event(defines.events.on_player_used_capsule, function(event)
    local player = game.players[event.player_index]
    local item_stack = player.cursor_stack
    if item_stack.valid_for_read and item_stack.name == "sb-honey-cube" then
        local healing_amount = 20
        player.character.health = player.character.health + healing_amount
        item_stack.clear()
    end
end)