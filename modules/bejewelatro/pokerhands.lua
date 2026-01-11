local jewel_list = {
    'redjewel', 'orangejewel', 'yellowjewel', 'greenjewel', 'bluejewel', 'violetjewel', 'whitejewel',
}

--[[local function has_a_jewel(card)
    if not card.ability then return false end
    for k, v in pairs(card.ability) do
        if v == true and string.match(k, "^zero_.*jewel$") then
            return true
        end
    end

    return false
end

function get_X_same_jewel(num, hand, or_more)
    local vals = {}
    for i = 1, #jewel_list do
        vals[i] = {}
    end

    for i = #hand, 1, -1 do
        if not has_a_jewel(hand[i]) then goto continue end

        local curr = { hand[i] }

        for j = 1, #hand do
            if i ~= j
                and has_a_jewel(hand[j]) then
                table.insert(curr, hand[j])
            end
        end

        if (or_more and #curr >= num) or (#curr == num) then
            for _, jwl in pairs(jewel_list) do
                --print(curr[1].ability['zero_'..jwl])
                if curr[1].ability['zero_'..jwl] then
                    vals['zero_'..jwl] = curr
                end
            end
        end

        ::continue::
    end
    print(vals)
    local ret = {}
    for i = #vals, 1, -1 do
        if next(vals[i]) then
            table.insert(ret, vals[i])
        end
    end
    return ret
end
]]

function get_X_same_jewel(num, hand, or_more)
    if #hand >= num then
        local colours_count = {}
        for _, jwl in pairs(jewel_list) do
            colours_count[jwl] = 0
        end
        local eligible_cards = {}

        for _, card in ipairs(hand) do
            for _, jwl in pairs(jewel_list) do
                if card.ability['zero_'..jwl] then
                    colours_count[jwl] = colours_count[jwl] + 1
                end
            end
        end

        for _, jwl in pairs(jewel_list) do
            if (or_more and colours_count[jwl] >= num) or (colours_count[jwl] == num) then
                for __, card in ipairs(hand) do
                    if card.ability['zero_'..jwl] then
                        eligible_cards[#eligible_cards + 1] = card
                    end
                end
            end
        end 
        if #eligible_cards > 0 then
            return {eligible_cards}
        end
    end
end

function get_spectrum_jewels(hand)
    if #hand >= 5 then
        local colours_count = {}
        local colours_counting = 0
        for _, jwl in pairs(jewel_list) do
            colours_count[jwl] = 0
        end
        local eligible_cards = {}

        for _, card in ipairs(hand) do --determine all cards with multiple jewels
            card.jewel_count = 0
            for _, jwl in pairs(jewel_list) do
                if card.ability['zero_'..jwl] then
                    card.jewel_count = card.jewel_count + 1
                end
            end
        end

        for _, card in ipairs(hand) do --go through all single-jewel cards
            if card.jewel_count == 1 then
                for _, jwl in pairs(jewel_list) do
                    if colours_count[jwl] == 0 and card.ability['zero_'..jwl] then
                        eligible_cards[#eligible_cards + 1] = card
                        colours_count[jwl] = 1
                        colours_counting = colours_counting + 1
                        break
                    end
                end
            end
        end

        for _, card in ipairs(hand) do -- go through all multi-jewel cards
            if card.jewel_count > 1 then
                for _, jwl in pairs(jewel_list) do
                    if colours_count[jwl] == 0 and card.ability['zero_'..jwl] then
                        eligible_cards[#eligible_cards + 1] = card
                        colours_count[jwl] = 1
                        colours_counting = colours_counting + 1
                        break
                    end
                end
            end
        end

        if colours_counting >= 5 then
            return {eligible_cards}
        end
    end
end

--[[SMODS.PokerHandPart{ -- Gem Pair Framework
    key = 'jewel_2',
    func = function(hand)
        get_X_same_jewel(2, hand)
    end
}

SMODS.PokerHandPart{ -- Gem 3OAK Framework
    key = 'jewel_3',
    func = function(hand)
        get_X_same_jewel(3, hand)
    end
}

SMODS.PokerHandPart{ -- Gem 4OAK Framework
    key = 'jewel_4',
    func = function(hand)
        get_X_same_jewel(4, hand)
    end
}

SMODS.PokerHandPart{ -- Gem Flush (5OAK) Framework
    key = 'jewel_5',
    func = function(hand)
        get_X_same_jewel(5, hand)
    end
}]]

SMODS.PokerHand { -- Gem Flush
    key = 'jewel_flush',
    loc_txt = {
        name = "Gem Flush",
        description = {
            "5 cards of the same gem,",
            "contains a Flush Five",
        }
    },
    mult = 10,
    chips = 100,
    l_mult = 3,
    l_chips = 35,
    example = {
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } }
    },
    order_offset = 100009,
    visible = not not (G.GAME and G.GAME.selected_back.name == 'b_zero_bejeweled'),
    evaluate = function(parts, hand)
        return get_X_same_jewel(5, hand)
        --return parts.zero_jewel_5
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return jewel_flush
    end,
}

SMODS.PokerHand { -- Gem Four
    key = 'jewel_four',
    loc_txt = {
        name = "Gem Four",
        description = {
            "4 cards of the same gem,",
            "contains a Four of a Kind",
        }
    },
    mult = 7,
    chips = 60,
    l_mult = 3,
    l_chips = 30,
    example = {
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', false, jewel = { zero_violetjewel = true } }
    },
    order_offset = 100008,
    visible = not not (G.GAME and G.GAME.selected_back.name == 'b_zero_bejeweled'),
    evaluate = function(parts, hand)
        return get_X_same_jewel(4, hand)
        --return parts.zero_jewel_4
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return jewel_four
    end,
}

SMODS.PokerHand { -- Gem House
    key = 'jewel_house',
    loc_txt = {
        name = "Gem House",
        description = {
            "A Gem Three and a Gem Two,",
            "contains a Full House",
        }
    },
    mult = 4,
    chips = 40,
    l_mult = 2,
    l_chips = 25,
    example = {
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_bluejewel = true } },
        { '', true, jewel = { zero_bluejewel = true } }
    },
    order_offset = 100007,
    visible = not not (G.GAME and G.GAME.selected_back.name == 'b_zero_bejeweled'),
    evaluate = function(parts, hand)
        --if #parts.zero_jewel_3 < 1 or #parts.zero_jewel_2 < 2 then return {} end
        --return SMODS.merge_lists(parts.zero_jewel_2)
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return jewel_house
    end,
}

SMODS.PokerHand { -- Gem Three
    key = 'jewel_three',
    loc_txt = {
        name = "Gem Three",
        description = {
            "3 cards of the same gem,",
            "contains a Three of a Kind",
        }
    },
    mult = 3,
    chips = 30,
    l_mult = 2,
    l_chips = 20,
    example = {
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', false, jewel = { zero_greenjewel = true } },
        { '', false, jewel = { zero_whitejewel = true } }
    },
    order_offset = 100006,
    visible = not not (G.GAME and G.GAME.selected_back.name == 'b_zero_bejeweled'),
    evaluate = function(parts, hand)
        return get_X_same_jewel(3, hand)
        --return parts.zero_jewel_3
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return jewel_three
    end,
}

SMODS.PokerHand { -- Gem Two Pair
    key = 'jewel_twopair',
    loc_txt = {
        name = "Gem Two Pair",
        description = {
            "2 Gem Pairs of different gems,",
            "contains a Two Pair",
        }
    },
    mult = 2,
    chips = 25,
    l_mult = 1,
    l_chips = 20,
    example = {
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_violetjewel = true } },
        { '', true, jewel = { zero_violetjewel = true } },
        { '', false, jewel = { zero_yellowjewel = true } }
    },
    order_offset = 100005,
    visible = not not (G.GAME and G.GAME.selected_back.name == 'b_zero_bejeweled'),
    evaluate = function(parts, hand)
        --if #parts.zero_jewel_2 < 2 then return {} end
        --return SMODS.merge_lists(parts.zero_jewel_2)
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return jewel_twopair
    end,
}

SMODS.PokerHand { -- Gem Spectrum
    key = 'jewel_spectrum',
    loc_txt = {
        name = "Gem Spectrum",
        description = {
            "5 cards all of different gems,",
            "contains a Straight",
        }
    },
    mult = 2,
    chips = 15,
    l_mult = 1,
    l_chips = 15,
    example = {
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_yellowjewel = true } },
        { '', true, jewel = { zero_violetjewel = true } },
        { '', true, jewel = { zero_greenjewel = true } },
        { '', true, jewel = { zero_bluejewel = true } }
    },
    order_offset = 100004,
    visible = not not (G.GAME and G.GAME.selected_back.name == 'b_zero_bejeweled'),
    evaluate = function(parts, hand)
        return get_spectrum_jewels(hand)
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return jewel_spectrum
    end,
}

SMODS.PokerHand { -- Gem Pair
    key = 'jewel_pair',
    loc_txt = {
        name = "Gem Pair",
        description = {
            "2 cards of the same gem,",
            "contains a Pair"
        }
    },
    mult = 2,
    chips = 10,
    l_mult = 1,
    l_chips = 10,
    example = {
        { '', true, jewel = { zero_redjewel = true } },
        { '', true, jewel = { zero_redjewel = true } },
        { '', false, jewel = { zero_violetjewel = true } },
        { '', false, jewel = { zero_whitejewel = true } },
        { '', false, jewel = { zero_bluejewel = true } }
    },
    order_offset = 100003,
    visible = not not (G.GAME and G.GAME.selected_back.name == 'b_zero_bejeweled'),
    evaluate = function(parts, hand)
        return get_X_same_jewel(2, hand)
        --return parts.zero_jewel_2
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return jewel_pair
    end,
}