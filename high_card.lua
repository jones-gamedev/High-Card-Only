SMODS.Back {
    name = "High Card Only",
    key = "WJ-high-card",
    config = {},
    loc_txt = {
        name = "High Cards Only",
        text= {
            "Start with a Deck",
            "of cards rank 8 or higher",
            "(ranks 8 to K are doubled up)"
        }
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    if card.base.value < "8" and card.base.value ~= "10" then
                        local new_value = tostring(tonumber(card.base.value) + 6)
                        if new_value == "11" then new_value = "Jack" end
                        if new_value == "12" then new_value = "Queen" end
                        if new_value == "13" then new_value = "King" end
                        assert(SMODS.change_base(card, nil, new_value))
                    end
                end
                return true
            end
        }))
    end
}