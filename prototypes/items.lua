local GRAPHICS_PATH = "__simply-bees__/graphics/"

local WEIGHTS = {
    ["sb-machines"] = 5000,
    ["sb-bees"] = 1000,
    ["sb-resource-bees"] = 1000,
    ["sb-combs"] = 1000,
    ["sb-ores"] = 500,
    ["sb-general"] = 500
}

local function item (itemId, stackSize, subgroup)
    return {
        type = "item",
        name = itemId,
        icon = GRAPHICS_PATH .. "icons/" .. itemId .. ".png",
        icon_size = 64,
        subgroup = subgroup,
        stack_size = stackSize,
        weight = WEIGHTS[subgroup]
    }
end

local function fuel (itemId, stackSize, subgroup, energyValue)
    local result = item(itemId, stackSize, subgroup)
    result["fuel_value"] = energyValue
    result["fuel_category"] = "chemical"
    result["fuel_emissions_multiplier"] = 0.25
    return result
end

local function machine (itemId, stackSize, subgroup)
    local result = item(itemId, stackSize, subgroup)
    result["place_result"] = itemId
    return result
end

local function spoilage (prototype, seconds)
    prototype["spoil_result"] = "spoilage"
    prototype["spoil_ticks"] = seconds * 60
    return prototype
end

data:extend({
    machine("sb-bee-house", 10, "sb-machines"),
    machine("sb-incubator", 10, "sb-machines"),
    machine("sb-thermal-centrifuge", 10, "sb-machines"),

    item("sb-bee-queen", 50, "sb-bees"),
    item("sb-larva", 50, "sb-bees"),
    item("sb-worker-bee", 500, "sb-bees"),

    item("sb-coal-worker-bee", 500, "sb-resource-bees"),
    item("sb-copper-worker-bee", 500, "sb-resource-bees"),
    item("sb-iron-worker-bee", 500, "sb-resource-bees"),
    item("sb-stone-worker-bee", 500, "sb-resource-bees"),
    item("sb-uranium-worker-bee", 500, "sb-resource-bees"),

    item("sb-coal-honey-comb", 100, "sb-combs"),
    item("sb-copper-honey-comb", 100, "sb-combs"),
    item("sb-iron-honey-comb", 100, "sb-combs"),
    item("sb-stone-honey-comb", 100, "sb-combs"),
    item("sb-uranium-honey-comb", 100, "sb-combs"),

    item("sb-coal-piece", 150, "sb-ores"),
    item("sb-copper-nugget", 150, "sb-ores"),
    item("sb-iron-nugget", 150, "sb-ores"),
    item("sb-stone-piece", 150, "sb-ores"),
    item("sb-uranium-nugget", 150, "sb-ores"),

    item("sb-broken-frame", 300, "sb-general"),
    item("sb-honey-comb", 500, "sb-general"),

    {
        type = "capsule",
        name = "sb-honey-cube",
        icon = GRAPHICS_PATH .. "icons/sb-honey-cube.png",
        icon_size = 64,
        subgroup = "sb-general",
        stack_size = 100,
        capsule_action = {
            type = "use-on-self",
            attack_parameters = {
                type = "projectile",
                activation_type = "consume",
                ammo_category = "capsule",
                cooldown = 30,
                range = 0,
                ammo_type = {
                    category = "capsule",
                    target_type = "position",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "instant",
                            target_effects = {
                                {type = "damage", damage = {type = "physical", amount = -80}},
                                {type = "play-sound", sound = {
                                    {filename = "__base__/sound/eat-5.ogg", volume = 0.6},
                                    {filename = "__base__/sound/eat-1.ogg", volume = 0.6},
                                    {filename = "__base__/sound/eat-2.ogg", volume = 0.6},
                                    {filename = "__base__/sound/eat-3.ogg", volume = 0.6},
                                    {filename = "__base__/sound/eat-4.ogg", volume = 0.6}
                                }}
                            }
                        }
                    }
                }
            }
        }
    },

    fuel("sb-wax", 1000, "sb-general", "1MJ"),
    item("sb-wooden-frame", 100, "sb-general")
})

if mods["space-age"] then
    data:extend({
        item("sb-organic-worker-bee", 500, "sb-resource-bees"),
        item("sb-holmium-worker-bee", 500, "sb-resource-bees"),
        item("sb-tungsten-worker-bee", 500, "sb-resource-bees"),
        item("sb-calcite-worker-bee", 500, "sb-resource-bees"),
        spoilage(item("sb-organic-comb", 100, "sb-combs"), 600),
        item("sb-holmium-comb", 100, "sb-combs"),
        item("sb-tungsten-comb", 100, "sb-combs"),
        item("sb-calcite-comb", 100, "sb-combs"),
        item("sb-holmium-nugget", 150, "sb-ores"),
        item("sb-tungsten-nugget", 150, "sb-ores"),
        item("sb-calcite-nugget", 150, "sb-ores"),
    })
end

if mods["void-snatch"] then
    data:extend({
        item("sb-void-honey-comb", 100, "sb-combs"),
        item("sb-void-worker-bee", 500, "sb-bees")
    })
end