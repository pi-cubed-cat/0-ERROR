SMODS.Atlas { 
    key = "zero_decks",
    path = "zero_decks.png",
    px = 71,
    py = 95
}

SMODS.Back {
    key = "bejeweled",
    pos = { x = 4, y = 0 },
    atlas = 'zero_decks',
    config = { hand_size = -3 },
    apply = function(self, back)
        
        for k,v in pairs(G.GAME.hands) do -- shows jewel hands
            if string.find(k, 'jewel') then
                v.visible = true
            end
        end
        
    end,
        
}