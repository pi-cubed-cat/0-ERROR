local jewel_list = {
    'redjewel', 'orangejewel', 'yellowjewel', 'greenjewel', 'bluejewel', 'violetjewel', 'whitejewel',
}

local localized_jewel_list = {
    'Red Gem', 'Orange Gem', 'Yellow Gem', 'Green Gem', 'Blue Gem', 'Violet Gem', 'White Gem',
}

local colour_list = {
    'ec000a', 'ec5100', 'f4ad00', '04cb00', '005be9', 'de00ec', 'acacac'
}

for i = 1, #jewel_list do
    local colour = string.sub(localized_jewel_list[i], 1, #localized_jewel_list[i] - 4)
    SMODS.Sticker {
        key = jewel_list[i],
        loc_txt = {
            name = localized_jewel_list[i],
            text = {
                "is "..colour,
            },
        },
        badge_colour = HEX(colour_list[i]),
        pos = { x = i-1, y = 0 },
        atlas = "zero_jewels",
        display_size = { w = 95, h = 95 },
        pixel_size = { w = 50, h = 50 },
    }
end

