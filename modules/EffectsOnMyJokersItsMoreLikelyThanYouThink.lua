-- im just
-- gonna add these directly

-- whoever reworks this later im sorry

local randvalue_default = function(card, ability_table)
	ability_table.perfect = Stacked.poll_potency{seed = ability_table.pseed.."_roll", min = 0, max = ability_table.max_possible - ability_table.min_possible}
	ability_table.value = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
end
-- treats potency as inverse - lower numbers are better
local randvalue_inverse = function(card, ability_table)
	ability_table.perfect = Stacked.poll_potency{seed = ability_table.pseed.."_roll", min = 0, max = ability_table.max_possible - ability_table.min_possible}
	ability_table.value = (ability_table.max_possible) - ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
end

local thac_effects = {
    thac_handsel = {
        ability = {value = 1, min_possible = 1, max_possible = 3, pseed = "thac_handsel"},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = randvalue_default,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
            if diff ~= 0 then
				SMODS.change_play_limit(diff)
            end
        end,
        on_apply = function(card, ability_table, repeated)
            SMODS.change_play_limit(ability_table.value)
        end,
        on_remove = function(card, ability_table, card_destroyed)
            SMODS.change_play_limit(-ability_table.value)
        end,
    },
    thac_discardsel = {
        ability = {value = 1, min_possible = 1, max_possible = 3, pseed = "thac_discardsel"},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = randvalue_default,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
            if diff ~= 0 then
				SMODS.change_discard_limit(diff)
            end
        end,
        on_apply = function(card, ability_table, repeated)
            SMODS.change_discard_limit(ability_table.value)
        end,
        on_remove = function(card, ability_table, card_destroyed)
            SMODS.change_discard_limit(-ability_table.value)
        end,
    },
    thac_consumableslot = {
        ability = {value = 1, min_possible = 1, max_possible = 2, pseed = "thac_consumableslot"},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, ability_table.value == 1 and "" or "s", colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = randvalue_default,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
            if diff ~= 0 then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + diff
            end
        end,
        on_apply = function(card, ability_table, repeated)
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + ability_table.value
        end,
        on_remove = function(card, ability_table, card_destroyed)
			G.consumeables.config.card_limit = G.consumeables.config.card_limit - ability_table.value
        end,
    },
    thac_horoscopeslot = {
        ability = {value = 1, min_possible = 1, max_possible = 2, pseed = "thac_horoscopeslot"},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, ability_table.value == 1 and "" or "s", colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = randvalue_default,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
            if diff ~= 0 then
				G.mxms_horoscope.config.card_limit = G.mxms_horoscope.config.card_limit + diff
            end
        end,
        on_apply = function(card, ability_table, repeated)
			G.mxms_horoscope.config.card_limit = G.mxms_horoscope.config.card_limit + ability_table.value
        end,
        on_remove = function(card, ability_table, card_destroyed)
			G.mxms_horoscope.config.card_limit = G.mxms_horoscope.config.card_limit - ability_table.value
        end,
		load_check = function()
			return next(SMODS.find_mod("Maximus"))
		end,
    },
    thac_suitleveler = {
        ability = {value = 2, reset = 4, counter = 4, suit = "Hearts", min_possible = 1, max_possible = 2, pseed = "thac_suitleveler"},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), localize(ability_table.suit, 'suits_plural'), ability_table.reset, ability_table.reset == 1 and "" or "s", ability_table.value, ability_table.value == 1 and "" or "s", ability_table.counter, colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}, G.C.SUITS[ability_table.suit]}}}
        end,
        randomize_values = function(card, ability_table)
			local suits = {}
			for i = #SMODS.Suit.obj_buffer, 1, -1 do
				local suit = SMODS.Suit.obj_buffer[i]
				if not SMODS.Suits[suit].in_pool or SMODS.Suits[suit]:in_pool{rank=""} then
					suits[#suits+1] = suit
				end
			end
		
			ability_table.suit = pseudorandom_element(suits, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_inverse(card, ability_table)
			ability_table.value = math.max(0,ability_table.value)
		end,
        update_values = function(card, ability_table)
            local new = (ability_table.max_possible) - ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
			ability_table.value = math.max(0,ability_table.value)
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.post_trigger and context.other_card == card and context.other_ret then
                ability_table.counter = ability_table.counter - 1
				if ability_table.counter <= 0 then
					ability_table.reset = ability_table.reset + ability_table.value
					ability_table.counter = ability_table.reset
					
					return {
						extra = {
							func = function()
								AMM.level_up_suit(card, ability_table.suit, nil, 1)
								return true
							end,
						},
					}
				end
            end
        end,
    },
}

for k,v in pairs(thac_effects) do
	v.key = k
	if (not v.load_check) or (type(v.load_check) == "function" and v:load_check()) then
		ExtraEffects[k] = v
	end
end