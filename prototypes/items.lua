local GRAPHICS_PATH = "__simply-bees__/graphics/"

local function item (itemId, stackSize, subgroup)
    return {
        type = "item",
        name = itemId,
        icon = GRAPHICS_PATH .. "icons/" .. itemId .. ".png",
        icon_size = 64,
        subgroup = subgroup,
        stack_size = stackSize
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

data:extend({
    machine("sb-bee-house", 10, "sb-machines"),
    machine("sb-incubator", 10, "sb-machines"),

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

    item("sb-coal-wax", 100, "sb-combs"),
    item("sb-copper-wax", 100, "sb-combs"),
    item("sb-iron-wax", 100, "sb-combs"),
    item("sb-stone-wax", 100, "sb-combs"),
    item("sb-uranium-wax", 100, "sb-combs"),

    item("sb-honey-comb", 500, "sb-general"),
    item("sb-honey-cube", 100, "sb-general"),
    fuel("sb-wax", 1000, "sb-general", "1MJ"),
    item("sb-wooden-frame", 100, "sb-general")
})