local GRAPHICS_PATH = "__simply-bees__/graphics/"
local SOUNDS_PATH = "__simply-bees__/sounds/"

data:extend({
    {
        type = "assembling-machine",
        name = "sb-bee-house",
        icon = GRAPHICS_PATH .. "icons/sb-bee-house.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {
            mining_time = 0.5,
            results = {
                {type = "item", name = "sb-bee-house", amount = 1}
            }
        },
        max_health = 500,
        corpse = "medium-remnants",
        vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
        resistances = {
            {type = "fire", percent = 30},
            {type = "explosion", percent = 30},
            {type = "impact", percent = 30}
        },
        energy_source = {
            type = "electric",
            usage_priority = "primary-input",
            emissions_per_minute = {pollution = -16},
        },
        module_specification = {
            module_slots = 2
        },
        allowed_effects = {
            "consumption",
            "speed",
            "pollution"
        },
        crafting_categories = {"sb-bee-house"},
        crafting_speed = 1,
        energy_usage = "10kW",
        -- collision_box = {{rightPadding, bottomPadding}, {leftPadding, topPadding}}
        collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
        selection_box = {{-1, -1}, {1, 1}},
        working_sound = {
            sound = {filename = SOUNDS_PATH .. "bee-machine.ogg"},
            audible_distance_modifier = 0.25
        },
        graphics_set = {
            animation= {
                filename = GRAPHICS_PATH .. "entities/bee-house.png",
                priority = "extra-high",
                width = 192,
                height = 192,
                frame_count = 1,
                scale = 0.5,
                shift = {0.25, -0.34375}
            }
        },
        min_perceived_performance = 0.25,
        performance_to_sound_speedup = 0.5,
        open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
        close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75}
    },
    {
        type = "assembling-machine",
        name = "sb-incubator",
        icon = GRAPHICS_PATH .. "icons/sb-incubator.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {
            mining_time = 0.5,
            results = {
                {type = "item", name = "sb-incubator", amount = 1}
            }
        },
        max_health = 500,
        corpse = "medium-remnants",
        vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
        resistances = {
            {type = "fire", percent = 30},
            {type = "explosion", percent = 30},
            {type = "impact", percent = 30}
        },
        energy_source = {
            type = "electric",
            usage_priority = "primary-input",
            emissions_per_minute = {pollution = 0},
        },
        module_specification = {
            module_slots = 2
        },
        allowed_effects = {
            "consumption",
            "speed",
            "pollution"
        },
        crafting_categories = {"sb-incubator"},
        crafting_speed = 1,
        energy_usage = "25kW",
        -- collision_box = {{rightPadding, bottomPadding}, {leftPadding, topPadding}}
        collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
        selection_box = {{-1, -1}, {1, 1}},
        working_sound = {
            sound = {filename = "__base__/sound/pipe.ogg"},
            audible_distance_modifier = 0.5
        },
        graphics_set = {
            animation= {
                filename = GRAPHICS_PATH .. "entities/incubator.png",
                priority = 'extra-high',
                width = 192,
                height = 192,
                frame_count = 1,
                scale = 0.5,
                shift = {0.21875, -0.3125}
            }
        },
        min_perceived_performance = 0.25,
        performance_to_sound_speedup = 0.5,
        open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
        close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75}
    },
    {
        type = "assembling-machine",
        name = "sb-thermal-centrifuge",
        icon = GRAPHICS_PATH .. "icons/sb-thermal-centrifuge.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {
            mining_time = 0.5,
            results = {
                {type = "item", name = "sb-thermal-centrifuge", amount = 1}
            }
        },
        max_health = 500,
        corpse = "medium-remnants",
        vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
        resistances = {
            {type = "fire", percent = 30},
            {type = "explosion", percent = 30},
            {type = "impact", percent = 30}
        },
        energy_source = {
            type = "electric",
            usage_priority = "primary-input",
            emissions_per_minute = {pollution = 0},
        },
        module_specification = {
            module_slots = 2
        },
        allowed_effects = {
            "consumption",
            "speed",
            "pollution"
        },
        crafting_categories = {"sb-centrifuge"},
        crafting_speed = 1,
        energy_usage = "200kW",
        -- collision_box = {{rightPadding, bottomPadding}, {leftPadding, topPadding}}
        collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
        selection_box = {{-1, -1}, {1, 1}},
        working_sound = {
            sound = {filename = "__base__/sound/centrifuge-3.ogg"},
            audible_distance_modifier = 0.25
        },
        graphics_set = {
            animation= {
                filename = GRAPHICS_PATH .. "entities/thermal-centrifuge.png",
                priority = 'extra-high',
                width = 192,
                height = 192,
                frame_count = 1,
                scale = 0.5,
                shift = {0.21875, -0.3125}
            }
        },
        min_perceived_performance = 0.25,
        performance_to_sound_speedup = 0.5,
        open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
        close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75}
    }
})