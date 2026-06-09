local GRAPHICS_PATH = "__simply-bees__/graphics/"

local IS_GLEBA = {{property = "pressure", min = 2000, max = 2000}}
local IS_VULCAN = {{property = "pressure", min = 4000, max = 4000}}
local IS_FULGORA = {{property = "magnetic-field", min = 99, max = 99}}

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
            amount_min = 1,
            amount_max = 1,
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
        allow_productivity = category == "sb-centrifuge" or category == "sb-bee-house",
        ingredients = inputs,
        results = outputs,
        main_product = outputs[1]["name"]
    }
end

local function recipeWithIcon(category, subgroup, duration, icon, inputs, outputs)
    local result = recipe(category, subgroup, duration, "sb-" .. icon, inputs, outputs)
    result["icon"] = GRAPHICS_PATH .. "icons/recipes/" .. icon .. ".png"
    result["icon_size"] = 64
    return result
end

local function noRecycle (prototype)
    prototype["auto_recycle"] = false
    return prototype
end

local function addCondition (prototype, condition)
    prototype["surface_conditions"] = condition
    return prototype
end

data:extend({
    recipe("crafting", "sb-machines", 1, "sb-bee-house", items("wood", 10, "small-lamp", 2, "iron-plate", 10), items("sb-bee-house", 1)),
    recipe("crafting", "sb-machines", 1, "sb-incubator", items("wood", 10, "small-lamp", 5, "iron-plate", 10), items("sb-incubator", 1)),
    recipe("crafting", "sb-machines", 1, "sb-thermal-centrifuge", items("engine-unit", 1, "stone-furnace", 1, "iron-plate", 10), items("sb-thermal-centrifuge", 1)),

    recipe("sb-bee-house", "sb-combs", 5, "sb-coal-honey-comb", items("sb-wooden-frame", 1, "sb-coal-worker-bee", 1), items("sb-coal-honey-comb", 5, "sb-broken-frame", 1)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-copper-honey-comb", items("sb-wooden-frame", 1, "sb-copper-worker-bee", 1), items("sb-copper-honey-comb", 5, "sb-broken-frame", 1)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-iron-honey-comb", items("sb-wooden-frame", 1, "sb-iron-worker-bee", 1), items("sb-iron-honey-comb", 5, "sb-broken-frame", 1)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-stone-honey-comb", items("sb-wooden-frame", 1, "sb-stone-worker-bee", 1), items("sb-stone-honey-comb", 5, "sb-broken-frame", 1)),
    recipe("sb-bee-house", "sb-combs", 5, "sb-uranium-honey-comb", items("sb-wooden-frame", 1, "sb-uranium-worker-bee", 1), items("sb-uranium-honey-comb", 5, "sb-broken-frame", 1)),
    recipe("sb-bee-house", "sb-general", 5, "sb-honey-comb", items("sb-wooden-frame", 1, "sb-worker-bee", 1), items("sb-honey-comb", 5, "sb-broken-frame", 1)),

    recipe("advanced-crafting", "sb-general", 5, "sb-solid-fuel", items("sb-wax", 10), items("solid-fuel", 1)),

    recipe("sb-centrifuge", "sb-pieces", 0.5, "sb-coal-piece", items("sb-coal-honey-comb", 1), items("sb-coal-piece", 4, "sb-coal-piece", 0.75)),
    recipe("sb-centrifuge", "sb-pieces", 0.5, "sb-copper-nugget", items("sb-copper-honey-comb", 1), items("sb-copper-nugget", 4, "sb-copper-nugget", 0.75)),
    recipe("sb-centrifuge", "sb-pieces", 0.5, "sb-iron-nugget", items("sb-iron-honey-comb", 1), items("sb-iron-nugget", 4, "sb-iron-nugget", 0.75)),
    recipe("sb-centrifuge", "sb-pieces", 0.5, "sb-stone-piece", items("sb-stone-honey-comb", 1), items("sb-stone-piece", 4, "sb-stone-piece", 0.75)),
    recipe("sb-centrifuge", "sb-pieces", 0.5, "sb-uranium-nugget", items("sb-uranium-honey-comb", 1), items("sb-uranium-nugget", 1, "sb-uranium-nugget", 0.75)),

    noRecycle(recipe("crafting", "sb-ores", 0.25, "sb-coal", items("sb-coal-piece", 4), items("coal", 1))),
    noRecycle(recipe("crafting", "sb-ores", 0.25, "sb-copper-ore", items("sb-copper-nugget", 4), items("copper-ore", 1))),
    noRecycle(recipe("crafting", "sb-ores", 0.25, "sb-iron-ore", items("sb-iron-nugget", 4), items("iron-ore", 1))),
    noRecycle(recipe("crafting", "sb-ores", 0.25, "sb-stone", items("sb-stone-piece", 4), items("stone", 1))),
    noRecycle(recipe("crafting", "sb-ores", 0.25, "sb-uranium-ore", items("sb-uranium-nugget", 4), items("uranium-ore", 1))),

    noRecycle(recipe("advanced-crafting", "sb-general", 1, "sb-honey-cube", items("sb-honey-comb", 5), items("sb-honey-cube", 1, "sb-wax", 5))),
    noRecycle(recipe("crafting", "sb-general", 1, "sb-wooden-frame", items("wood", 3), items("sb-wooden-frame", 10))),
    recipe("crafting", "sb-general", 1, "sb-wooden-repaired-frame", items("sb-broken-frame", 3), items("sb-wooden-frame", 1)),

    noRecycle(recipeWithIcon("sb-incubator", "sb-bees", 30, "larva-grow-long", items("sb-larva", 1), items("sb-bee-queen", 1))),
    noRecycle(recipeWithIcon("sb-incubator", "sb-bees", 5, "larva-grow", items("sb-larva", 1, "sb-honey-cube", 5), items("sb-bee-queen", 1))),

    {
        type = "recipe",
        name = "sb-honey-cube-destroy",
        icon = GRAPHICS_PATH .. "icons/recipes/honey-cube-destroy.png",
        icon_size = 64,
        category = "advanced-crafting",
        subgroup = "sb-general",
        energy_required = 0.25,
        ingredients = items("sb-honey-cube", 1),
        results = {}
    },
    {
        type = "recipe",
        name = "sb-wax-destroy",
        icon = GRAPHICS_PATH .. "icons/recipes/wax-destroy.png",
        icon_size = 64,
        category = "advanced-crafting",
        subgroup = "sb-general",
        energy_required = 0.25,
        ingredients = items("sb-wax", 1),
        results = {}
    },

    recipe("sb-incubator", "sb-bees", 2, "sb-worker-bee", items("sb-bee-queen", 1), items("sb-worker-bee", 32, "sb-larva", 1, "sb-larva", 0.02)),

    recipe("sb-incubator", "sb-resource-bees", 2, "sb-coal-worker-bee", items("sb-bee-queen", 1, "coal", 10), items("sb-coal-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)),
    recipe("sb-incubator", "sb-resource-bees", 2, "sb-copper-worker-bee", items("sb-bee-queen", 1, "copper-ore", 10), items("sb-copper-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)),
    recipe("sb-incubator", "sb-resource-bees", 2, "sb-iron-worker-bee", items("sb-bee-queen", 1, "iron-ore", 10), items("sb-iron-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)),
    recipe("sb-incubator", "sb-resource-bees", 2, "sb-stone-worker-bee", items("sb-bee-queen", 1, "stone", 10), items("sb-stone-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)),
    recipe("sb-incubator", "sb-resource-bees", 2, "sb-uranium-worker-bee", items("sb-bee-queen", 1, "uranium-ore", 10), items("sb-uranium-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)),
})

if mods["space-age"] then
    data:extend({
        addCondition(recipe("sb-bee-house", "sb-combs", 5, "sb-organic-comb", items("sb-wooden-frame", 1, "sb-organic-worker-bee", 1), items("sb-organic-comb", 5, "sb-broken-frame", 1)), IS_GLEBA),
        addCondition(recipe("sb-bee-house", "sb-combs", 5, "sb-holmium-comb", items("sb-wooden-frame", 1, "sb-holmium-worker-bee", 1), items("sb-holmium-comb", 5, "sb-broken-frame", 1)), IS_FULGORA),
        addCondition(recipe("sb-bee-house", "sb-combs", 5, "sb-tungsten-comb", items("sb-wooden-frame", 1, "sb-tungsten-worker-bee", 1), items("sb-tungsten-comb", 5, "sb-broken-frame", 1)), IS_VULCAN),
        addCondition(recipe("sb-bee-house", "sb-combs", 5, "sb-calcite-comb", items("sb-wooden-frame", 1, "sb-calcite-worker-bee", 1), items("sb-calcite-comb", 5, "sb-broken-frame", 1)), IS_VULCAN),

        recipe("sb-centrifuge", "sb-pieces", 0.5, "sb-holmium-nugget", items("sb-holmium-comb", 1), items("sb-holmium-nugget", 0.75, "scrap", 2)),
        recipe("sb-centrifuge", "sb-pieces", 1, "sb-tungsten-nugget", items("sb-tungsten-comb", 1), items("sb-tungsten-nugget", 2, "sb-tungsten-nugget", 0.75)),
        recipe("sb-centrifuge", "sb-pieces", 1, "sb-calcite-nugget", items("sb-calcite-comb", 1), items("sb-calcite-nugget", 2, "sb-calcite-nugget", 0.75)),

        noRecycle(recipe("organic", "sb-ores", 1, "sb-bioflux", items("sb-organic-comb", 1), items("bioflux", 2, "bioflux", 0.75))),
        noRecycle(recipe("crafting", "sb-ores", 0.25, "sb-holmium-ore", items("sb-holmium-nugget", 4), items("holmium-ore", 1))),
        noRecycle(recipe("metallurgy", "sb-ores", 0.25, "sb-tungsten-ore", items("sb-tungsten-nugget", 4), items("tungsten-ore", 1))),
        noRecycle(recipe("metallurgy", "sb-ores", 0.25, "sb-calcite", items("sb-calcite-nugget", 4), items("calcite", 1))),

        addCondition(recipe("sb-incubator", "sb-resource-bees", 2, "sb-organic-worker-bee", items("sb-bee-queen", 1, "bioflux", 10), items("sb-organic-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)), IS_GLEBA),
        addCondition(recipe("sb-incubator", "sb-resource-bees", 2, "sb-holmium-worker-bee", items("sb-bee-queen", 1, "holmium-ore", 10), items("sb-holmium-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)), IS_FULGORA),
        addCondition(recipe("sb-incubator", "sb-resource-bees", 2, "sb-tungsten-worker-bee", items("sb-bee-queen", 1, "tungsten-ore", 10), items("sb-tungsten-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)), IS_VULCAN),
        addCondition(recipe("sb-incubator", "sb-resource-bees", 2, "sb-calcite-worker-bee", items("sb-bee-queen", 1, "calcite", 10), items("sb-calcite-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)), IS_VULCAN),
    })
end

if mods["void-snatch"] then
    data:extend({
        recipe("sb-incubator", "sb-resource-bees", 2, "sb-void-worker-bee", items("sb-bee-queen", 1, "vs-void-catalyst", 25), items("sb-void-worker-bee", 25, "sb-larva", 1, "sb-larva", 0.02)),
        recipe("sb-bee-house", "sb-combs", 5, "sb-void-honey-comb", items("sb-wooden-frame", 1, "sb-void-worker-bee", 1), items("sb-void-honey-comb", 5, "sb-broken-frame", 1)),

        recipeWithIcon("sb-centrifuge", "sb-void-pieces", 0.5, "void-coal-piece", items("sb-void-honey-comb", 1), items("sb-coal-piece", 4, "sb-coal-piece", 0.75, "vs-void-catalyst", 0.3)),
        recipeWithIcon("sb-centrifuge", "sb-void-pieces", 0.5, "void-copper-nugget", items("sb-void-honey-comb", 1), items("sb-copper-nugget", 4, "sb-copper-nugget", 0.75, "vs-void-catalyst", 0.3)),
        recipeWithIcon("sb-centrifuge", "sb-void-pieces", 0.5, "void-iron-nugget", items("sb-void-honey-comb", 1), items("sb-iron-nugget", 4, "sb-iron-nugget", 0.75, "vs-void-catalyst", 0.3)),
        recipeWithIcon("sb-centrifuge", "sb-void-pieces", 0.5, "void-stone-piece", items("sb-void-honey-comb", 1), items("sb-stone-piece", 4, "sb-stone-piece", 0.75, "vs-void-catalyst", 0.3)),
        recipeWithIcon("sb-centrifuge", "sb-void-pieces", 0.5, "void-uranium-nugget", items("sb-void-honey-comb", 1), items("sb-uranium-nugget", 1, "sb-uranium-nugget", 0.75, "vs-void-catalyst", 0.3)),
    })
end