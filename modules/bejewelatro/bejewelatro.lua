Bejewelatro = {
    show = false,
    board_visible = false,
    board_pos = {
        x = 0,
        y = 20,
    },
    f = {}, -- functions
    jewel_rows = {}, -- board rows
}

assert(SMODS.load_file("./modules/bejewelatro/deck.lua"))()
assert(SMODS.load_file("./modules/bejewelatro/jewels.lua"))()
assert(SMODS.load_file("./modules/bejewelatro/board.lua"))()
assert(SMODS.load_file("./modules/bejewelatro/stickers.lua"))()
assert(SMODS.load_file("./modules/bejewelatro/pokerhands.lua"))()