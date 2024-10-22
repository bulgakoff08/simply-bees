require("prototypes.items")
require("prototypes.entities")
require("prototypes.recipes")

local GRAPHICS_PATH = "__simply-bees__/graphics/"

data:extend({
    {
        type = "item-group",
        name = "simply-bees",
        icon_size = 128,
        icon = GRAPHICS_PATH .. "simply-bees.png",
        inventory_order = "s",
        order = "s-a"
    },
    {
        type = "item-subgroup",
        name = "sb-machines",
        group = "simply-bees",
        order = "a-a"
    },
    {
        type = "item-subgroup",
        name = "sb-bees",
        group = "simply-bees",
        order = "b-a"
    },
    {
        type = "item-subgroup",
        name = "sb-resource-bees",
        group = "simply-bees",
        order = "c-a"
    },
    {
        type = "item-subgroup",
        name = "sb-combs",
        group = "simply-bees",
        order = "d-a"
    },
    {
        type = "item-subgroup",
        name = "sb-pieces",
        group = "simply-bees",
        order = "e-a"
    },
    {
        type = "item-subgroup",
        name = "sb-void-pieces",
        group = "simply-bees",
        order = "f-a"
    },
    {
        type = "item-subgroup",
        name = "sb-general",
        group = "simply-bees",
        order = "g-a"
    },
    {
        type = "item-subgroup",
        name = "sb-ores",
        group = "simply-bees",
        order = "h-a"
    },
    {
        type = "recipe-category",
        name = "sb-bee-house"
    },
    {
        type = "recipe-category",
        name = "sb-incubator"
    },
    {
        type = "recipe-category",
        name = "sb-centrifuge"
    },
    {
        type = "technology",
        name = "sb-basic-beekeeping",
        icon = GRAPHICS_PATH .. "simply-bees.png",
        icon_size = 128,
        effects = {{type = "give-item", item = "sb-bee-queen", count = 10}},
        prerequisites = {"lamp"},
        order = "f-b-b",
        unit = {count = 100, ingredients = {{"automation-science-pack", 1}}, time = 10}
    }
})