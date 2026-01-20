SMODS.Atlas {
    key = "zero_jewelsuits",
    px = 71,
    py = 95,
    path = "jewelsuits.png"
}

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
        col_index = i,
        badge_colour = HEX(colour_list[i]),
        pos = { x = i-1, y = 0 },
        atlas = "zero_jewelsuits",
        --display_size = { w = 95, h = 95 },
        --pixel_size = { w = 50, h = 50 },
        draw = function(self, card, layer)
            local has_updated = false
            if G.GAME and card.ability then
                for j=1, #jewel_list do
                    if self.col_index>j and card.ability['zero_'..jewel_list[j]] then
                        G.shared_stickers[self.key]:set_sprite_pos({ x = self.col_index-1, y = 1 })
                        has_updated = true
                    elseif self.col_index<j and card.ability['zero_'..jewel_list[j]] then
                        G.shared_stickers[self.key]:set_sprite_pos({ x = self.col_index-1, y = 2 })
                        has_updated = true
                    end
                end
            end
            if not has_updated then
                G.shared_stickers[self.key]:set_sprite_pos({ x = self.col_index-1, y = 0 })
            end
            G.shared_stickers[self.key].role.draw_major = card
            G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, notilt, card.children.center)
        end,
    }
end

