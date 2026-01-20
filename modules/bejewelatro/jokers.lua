SMODS.Atlas {
    key = "zero_jokersBejeweled",
    px = 71,
    py = 95,
    path = "zero_jokersBejeweled.png"
}

local function has_a_jewel(card)
    if not card.ability then return false end
    for k, v in pairs(card.ability) do
        if v == true and string.match(k, "^zero_.*jewel$") then
            return true
        end
    end

    return false
end

-- Gem Jimbo
SMODS.Joker {
    key = "gemjimbo",
    atlas = "zero_jokersBejeweled",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    in_pool = function(self, args)
        return do_bejewelatro()
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local contains_jewel = false
            for _, v in ipairs(context.scoring_hand) do
                if has_a_jewel(card) then
                    contains_jewel = true
                end
            end
            if contains_jewel then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

-- Lustrous Joker
SMODS.Joker {
    key = "gemred",
    atlas = "zero_jokersBejeweled",
    pos = { x = 0, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card.ability['zero_redjewel'] then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Topaz Joker
SMODS.Joker {
    key = "gemorange",
    atlas = "zero_jokersBejeweled",
    pos = { x = 1, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card.ability['zero_orangejewel'] then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Amber Joker
SMODS.Joker {
    key = "gemyellow",
    atlas = "zero_jokersBejeweled",
    pos = { x = 2, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card.ability['zero_yellowjewel'] then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Emerald Joker
SMODS.Joker {
    key = "gemgreen",
    atlas = "zero_jokersBejeweled",
    pos = { x = 3, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card.ability['zero_greenjewel'] then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Sapphire Joker
SMODS.Joker {
    key = "gemblue",
    atlas = "zero_jokersBejeweled",
    pos = { x = 4, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card.ability['zero_bluejewel'] then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Amethyst Joker
SMODS.Joker {
    key = "gemviolet",
    atlas = "zero_jokersBejeweled",
    pos = { x = 5, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card.ability['zero_violetjewel'] then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Pearly Joker
SMODS.Joker {
    key = "gemwhite",
    atlas = "zero_jokersBejeweled",
    pos = { x = 6, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card.ability['zero_whitejewel'] then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Gem Jolly Joker
SMODS.Joker {
    key = "gempair",
    atlas = "zero_jokersBejeweled",
    pos = { x = 1, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 3,
    discovered = true,
    config = { extra = { mult = 10, type = 'zero_jewel_pair' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Gem Crazy Joker
SMODS.Joker {
    key = "gemspectrum",
    atlas = "zero_jokersBejeweled",
    pos = { x = 2, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 10, type = 'zero_jewel_spectrum' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Gem Mad Joker
SMODS.Joker {
    key = "gemspectrum",
    atlas = "zero_jokersBejeweled",
    pos = { x = 3, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 12, type = 'zero_jewel_twopair' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Gem Zany Joker
SMODS.Joker {
    key = "gemthree",
    atlas = "zero_jokersBejeweled",
    pos = { x = 4, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { mult = 16, type = 'zero_jewel_three' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Gem Silly Joker
SMODS.Joker {
    key = "gemhouse",
    atlas = "zero_jokersBejeweled",
    pos = { x = 5, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    discovered = true,
    config = { extra = { mult = 20, chips = 75, type = 'zero_jewel_house' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end
    end
}

-- Gem Nutty Joker
SMODS.Joker {
    key = "gemfour",
    atlas = "zero_jokersBejeweled",
    pos = { x = 6, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    discovered = true,
    config = { extra = { mult = 24, chips = 120, type = 'zero_jewel_four' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end
    end
}

-- Gem Droll Joker
SMODS.Joker {
    key = "gemflush",
    atlas = "zero_jokersBejeweled",
    pos = { x = 7, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    discovered = true,
    config = { extra = { mult = 24, chips = 120, type = 'zero_jewel_flush' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end
    end
}