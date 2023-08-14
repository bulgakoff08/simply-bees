local GRAPHICS_PATH = "__simply-bees__/graphics/"

local function type(itemId)
    if (itemId == "water") then
        return "fluid"
    elseif (itemId == "crude-oil") then
        return "fluid"
    elseif (itemId == "sulfuric-acid") then
        return "fluid"
    else
        return "item"
    end
end

local function ingredient(itemId, count)
    if (count < 1) then
        return {
            type = type(itemId),
            name = itemId,
            probability = count
        }
    else
        return {
            type = type(itemId),
            name = itemId,
            amount = count
        }
    end
end

local function items(item1, amount1, item2, amount2, item3, amount3, item4, amount4)
    local result = {}
    if (item1 ~= nil) then table.insert(result, ingredient(item1, amount1)) end
    if (item2 ~= nil) then table.insert(result, ingredient(item2, amount2)) end
    if (item3 ~= nil) then table.insert(result, ingredient(item3, amount3)) end
    if (item4 ~= nil) then table.insert(result, ingredient(item4, amount4)) end
    return result
end

local function recipe(category, subgroup, duration, recipeId, inputs, outputs)
    return {
        type = "recipe",
        name = recipeId,
        category = category,
        subgroup = subgroup,
        energy_required = duration,
        ingredients = inputs,
        results = outputs,
        allow_as_intermediate = false,
        main_product = outputs[1]["name"]
    }
end

local function recipeWithIcon(category, subgroup, duration, icon, inputs, outputs)
    local result = recipe(category, subgroup, duration, "sb-" .. icon, inputs, outputs)
    result["icon"] = GRAPHICS_PATH .. "icons/recipes/" .. icon .. ".png"
    result["icon_size"] = 64
    return result
end

data:extend({
    recipe("crafting", "sb-machines", 1, "sb-bee-house", items("wood", 10, "small-lamp", 2, "iron-plate", 10), items("sb-bee-house", 1)),
    recipe("crafting", "sb-machines", 1, "sb-incubator", items("wood", 10, "small-lamp", 5, "iron-plate", 10), items("sb-incubator", 1)),

    recipe("sb-bee-house", "sb-combs", 5, "sb-coal-honey-comb", items("sb-wooden-frame", 1, "sb-worker-bee", 1, "coal", 1), items("sb-coal-honey-comb", 5)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-copper-honey-comb", items("sb-wooden-frame", 1, "sb-worker-bee", 1, "copper-ore", 1), items("sb-copper-honey-comb", 5)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-iron-honey-comb", items("sb-wooden-frame", 1, "sb-worker-bee", 1, "iron-ore", 1), items("sb-iron-honey-comb", 5)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-stone-honey-comb", items("sb-wooden-frame", 1, "sb-worker-bee", 1, "stone", 1), items("sb-stone-honey-comb", 5)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-uranium-honey-comb", items("sb-wooden-frame", 1, "sb-worker-bee", 1, "uranium-ore", 1), items("sb-uranium-honey-comb", 5)),
    recipe("sb-bee-house", "sb-general", 5, "sb-honey-comb", items("sb-wooden-frame", 1, "sb-worker-bee", 1), items("sb-honey-comb", 5)),

    recipe("advanced-crafting", "sb-combs", 1, "sb-coal-wax", items("sb-coal-honey-comb", 1), items("sb-coal-wax", 1)),
    recipe("advanced-crafting", "sb-combs", 1, "sb-copper-wax", items("sb-copper-honey-comb", 1), items("sb-copper-wax", 1)),
    recipe("advanced-crafting", "sb-combs", 1, "sb-iron-wax", items("sb-iron-honey-comb", 1), items("sb-iron-wax", 1)),
    recipe("advanced-crafting", "sb-combs", 1, "sb-stone-wax", items("sb-stone-honey-comb", 1), items("sb-stone-wax", 1)),
    recipe("advanced-crafting", "sb-combs", 1, "sb-uranium-wax", items("sb-uranium-honey-comb", 1), items("sb-uranium-wax", 1)),

    recipe("advanced-crafting", "sb-ores", 0.5, "sb-coal", items("sb-coal-wax", 1), items("coal", 1)),
    recipe("advanced-crafting", "sb-ores", 0.5, "sb-copper-ore", items("sb-copper-wax", 1), items("copper-ore", 1)),
    recipe("advanced-crafting", "sb-ores", 0.5, "sb-iron-ore", items("sb-iron-wax", 1), items("iron-ore", 1)),
    recipe("advanced-crafting", "sb-ores", 0.5, "sb-stone", items("sb-stone-wax", 1), items("stone", 1)),
    recipe("crafting-with-fluid", "sb-ores", 0.5, "sb-uranium-ore", items("sb-uranium-wax", 1, "sulfuric-acid", 2), items("uranium-ore", 1)),

    recipe("advanced-crafting", "sb-general", 1, "sb-honey-cube", items("sb-honey-comb", 5), items("sb-honey-cube", 1, "sb-wax", 5)),
    recipe("crafting", "sb-general", 1, "sb-wooden-frame", items("wood", 1, "copper-wire", 5), items("sb-wooden-frame", 10)),

    recipeWithIcon("sb-incubator", "sb-bees", 90, "larva-grow-long", items("sb-larva", 1), items("sb-bee-queen", 1)),
    recipeWithIcon("sb-incubator", "sb-bees", 30, "larva-grow", items("sb-larva", 1, "sb-honey-cube", 5), items("sb-bee-queen", 1)),

    {
        type = "recipe",
        name = "sb-queen-breed",
        category = "sb-incubator",
        subgroup = "sb-bees",
        energy_required = 2,
        icon = GRAPHICS_PATH .. "icons/recipes/queen-breed.png",
        icon_size = 64,
        ingredients = {
            {type = "item", name = "sb-bee-queen", amount = 1}
        },
        results = {
            {type = "item", name = "sb-worker-bee", amount = 25},
            {type = "item", name = "sb-larva", amount = 1},
            {type = "item", name = "sb-larva", amount = 1, probability = 0.1}
        }
    }
})