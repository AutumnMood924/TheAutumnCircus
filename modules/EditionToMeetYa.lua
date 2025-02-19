local shaders = {
    'gilded', gilded = {
        path = "gilded.fs"
    },
    'virtual', virtual = {
        path = "virtual.fs"
    }
}

local editions = {
	'gilded', gilded = {
		name = "Gilded",
        shader = 'gilded',
        in_shop = true,
		text = {
            "#2# {C:money}$#1#{} of {C:attention}sell value{}#3#",
            "#4#{C:attention}#5#{}#6#"
        },
		config = {
			extra = {
                gold = 3,
            }
		},
		extra_cost = 4,
        weight = 20,
		loc_vars = function(_c, info_queue, card)
            -- i want to scream into the sun until its screams are indiscernable from my own
            -- so the desired result is
            -- jokers and consumables look like
            -- "Gain $3 of sell value"
            -- "at end of round"
            -- playing cards look like
            -- "Add $3 of sell value to"
            -- "a random Joker when scored"

            -- "#2# {C:money}$#1#{} of {C:attention}sell value{}#3#",
            -- "#4#{C:attention}#5#{}#6#"

            -- so #1# is the money value, easy enough
            -- #2# is "Add" for pcards and "Gain" otherwise
            -- "of {C:attention}sell value{}" can be in the text value, followed by #3#
            -- which is either " to" for pcards or "" otherwise
            -- #4# is "a random " for pcards or "at end of round" otherwise
            -- #5# is "Joker" for pcards or "" otherwise
            -- #6# is " when scored" for pcards or "" otherwise
            if true then info_queue[#info_queue+1] = {key = 'thac_shadercredit_lyman', set = 'Other'} end

            local aaaa = {}
            if card and card.ability and card.ability.set == "Default" or card.ability.set == "Enhanced" then
                return {vars = { _c.config.extra.gold, "Add", " to", "a random ", "Joker", " when scored" }}
            end
            return {vars = { _c.config.extra.gold, "Gain", "", "at end of round", "", "" }}
        end,
        calculate = function(self, card, context)
            if card.ability.set == "Default" or card.ability.set == "Enhanced" then
                -- Playing card functionality
                if context.main_scoring and context.cardarea == G.play then
                    local chosen_joker = nil
                    if #G.jokers.cards > 0 then
                        chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('gilded'))
                    end
                    if chosen_joker then
                        return {
                            extra = {focus = card,
                                message = localize('k_val_up'),
                                focus = chosen_joker,
                                colour = G.C.MONEY,
                                func = function()
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'before',
                                    delay = 0.0,
                                    func = (function()
                                        chosen_joker.ability.extra_value = chosen_joker.ability.extra_value or 0
                                        chosen_joker.ability.extra_value = chosen_joker.ability.extra_value + card.edition.extra.gold
                                        chosen_joker:set_cost()
                                        --chosen_joker:juice_up(0.5, 0.3)
                                        return true
                                    end)}))
                            end},
                            card = card
                        }
                    end
                end
            else
                -- Joker/Consumable/(other?) functionality
                if context.end_of_round and not context.individual and not context.repetition then
                    card.ability.extra_value = card.ability.extra_value or 0
                    card.ability.extra_value = card.ability.extra_value + card.edition.extra.gold
                    card:set_cost()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_val_up'), colour = G.C.MONEY})
                end
            end
        end,
	},
}

--shaders
for _, k in ipairs(shaders) do
	local v = shaders[k]
	TheAutumnCircus.data.buffer_insert("Shaders", v, {key = k})
end

--editions
for _, k in ipairs(editions) do
	local v = editions[k]
	TheAutumnCircus.data.buffer_insert("Editions", v, {key = k})
end