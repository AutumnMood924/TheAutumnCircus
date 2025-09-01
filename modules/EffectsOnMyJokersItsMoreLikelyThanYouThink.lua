-- im just
-- gonna add these directly

-- whoever reworks this later im sorry

local randvalue_default = function(card, ability_table)
	ability_table.perfect = Stacked.poll_potency{seed = ability_table.pseed.."_roll", min = 0, max = ability_table.max_possible - ability_table.min_possible}
	ability_table.value = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
end
local updvalue_default = function(card, ability_table)
	if not ability_table.perfect then randvalue_default(card,ability_table) end
	ability_table.value = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
	ability_table.value = Stacked.round(ability_table.value, 2)
end
local updvalue_whole = function(card, ability_table)
	if not ability_table.perfect then randvalue_default(card,ability_table) end
	ability_table.value = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
	ability_table.value = Stacked.round(ability_table.value, 0)
end
-- treats potency as inverse - lower numbers are better
local randvalue_inverse = function(card, ability_table)
	ability_table.perfect = Stacked.poll_potency{seed = ability_table.pseed.."_roll", min = 0, max = ability_table.max_possible - ability_table.min_possible}
	ability_table.value = (ability_table.max_possible) - ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
end
local updvalue_inverse = function(card, ability_table)
	if not ability_table.perfect then randvalue_inverse(card,ability_table) end
	ability_table.value = (ability_table.max_possible) - ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
	ability_table.value = Stacked.round(ability_table.value, 2)
end
-- intended for XMult/Chips effects but can be used elsewhere
local randvalue_tenths = function(card, ability_table)
	ability_table.perfect = Stacked.poll_potency{seed = ability_table.pseed.."_roll", min = 0, max = (ability_table.max_possible - ability_table.min_possible) * 10, round = 0.1}
	ability_table.value = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
	ability_table.value = Stacked.round(ability_table.value, 1)
end
local randvalue_hundreths = function(card, ability_table)
	ability_table.perfect = Stacked.poll_potency{seed = ability_table.pseed.."_roll", min = 0, max = (ability_table.max_possible - ability_table.min_possible) * 100, round = 0.01}
	ability_table.value = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
	ability_table.value = Stacked.round(ability_table.value, 2)
end
local updvalue_tenths = function(card, ability_table)
	if not ability_table.perfect then randvalue_tenths(card,ability_table) end
	ability_table.value = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
	ability_table.value = Stacked.round(ability_table.value, 1)
end

local cardquality_value = function(value, quality)
	if quality == "face" then value = value * 0.9 end
	if quality == "nonface" then value = value ^ 0.9 end
	if quality == "odd" then value = value * 0.85 end
	if quality == "even" then value = value * 0.85 end
	if quality == "prime" then value = value * 1.2 end
	if quality == "numbered" then value = value * 0.75 end
	if quality == "unenhanced" then value = value * 0.80 end
	if quality == "enhanced" then value = value * 1.25 end
	if quality == "metal" then value = (value + 0.5) * 1.25 end
	if quality == "materialenh" then value = (value + 0.1) * 1.25 end
	if quality == "unsealed" then value = value * 0.85 end
	if quality == "sealed" then value = value ^ 1.15 end
	if quality == "baseedition" then value = value * 0.75 end
	if quality == "editioned" then value = value ^ 1.23 end
	value = math.floor(value * 100) / 100
	return value
end

local scalingeffect = function(args)
	if not args.cards then
		if args.card then
			args.cards = {args.card}
		end
	end
	for _, card in ipairs(args.cards) do
		local effects = card.ability.hsr_extra_effects
		local target = -1
		if args.mode == "random" then
			local _effects = {}
			for __,effect in ipairs(effects) do
				local extraeffect = ExtraEffects[effect.key]
				local doit = true
				if extraeffect.no_potency then doit = false end
				if not type(effect.ability.perfect) == "number" then doit = false end
				if type(extraeffect.type) == "table" then
					for ___, _type in ipairs(extraeffect.type) do
						if _type == "scaling" then doit = false end
					end
				elseif type(extraeffect.type) == "string" and extraeffect.type == "scaling" then
					doit = false
				end
				if doit then
					_effects[#_effects+1] = {effect, __}
				end
			end
			if #_effects == 0 then
				target = nil
			end
			target = pseudorandom_element(_effects, args.pseed)[2]
		end
		if args.mode ~= "random" or target then
			for __, effect in ipairs(effects) do
				local extraeffect = ExtraEffects[effect.key]
				local doit = true
				if args.mode == "random" then
					if __ ~= target then
						doit = false
					end
				elseif args.mode ~= "random" then
					if extraeffect.no_potency then doit = false end
					if not type(effect.ability.perfect) == "number" then doit = false end
					if type(extraeffect.type) == "table" then
						for ___, _type in ipairs(extraeffect.type) do
							if _type == "scaling" then doit = false end
						end
					elseif type(extraeffect.type) == "string" and extraeffect.type == "scaling" then
						doit = false
					end
				end
				if doit == true then
					-- just in case somehow it's above our cap
					local originalperfect = effect.ability.perfect
					effect.ability.perfect = effect.ability.perfect + (args.amt or args.val or args.value or args.amount) -- listen i am inconsistent
					effect.ability.perfect = math.max(math.min(effect.ability.perfect,
						(G.GAME.hsr_potency_cap or 100) * (G.GAME.thacked_scaling_cap or 1)
					), originalperfect) -- holy abomination of math
				end
			end
		end
	end
end

local bg_contrast = 0.90
-- bg key:
-- mult effect: G.C.MULT
-- chips effect: G.C.CHIPS
-- xmult effect: G.C.XMULT
-- xchips effect: G.C.CHIPS
-- asc effect: G.C.GOLD
-- xasc effect: G.C.GOLD
-- chips/mult buff effect: G.C.SECONDARY_SET.Tarot
-- passive effect: G.C.SECONDARY_SET.Planet
-- consumable type related effect: G.C.SECONDARY_SET[_type]
-- misc effect: G.C.IMPORTANT

local thac_effects = {
    thac_handsel = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 3},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}},
			background_colour = lighten(G.C.SECONDARY_SET.Planet, bg_contrast)}
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
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 3},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}},
			background_colour = lighten(G.C.SECONDARY_SET.Planet, bg_contrast)}
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
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, ability_table.value == 1 and "" or "s", colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}},
			background_colour = lighten(G.C.SECONDARY_SET.Planet, bg_contrast)}
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
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), ability_table.value, ability_table.value == 1 and "" or "s", colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}},
			background_colour = lighten(G.C.SECONDARY_SET.Planet, bg_contrast)}
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
    thac_handleveler = {
		type = "chain",
        ability = {value = 3, reset = 5, counter = 5, hand_type = "High Card", min_possible = 2, max_possible = 4},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), localize(ability_table.hand_type, 'poker_hands'), ability_table.reset, ability_table.reset == 1 and "" or "s", ability_table.value, ability_table.value == 1 and "" or "s", ability_table.counter},
			background_colour = lighten(G.C.IMPORTANT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local hands = {}
			for k, hand in pairs(G.GAME.hands) do
				if hand.visible then
					hands[#hands+1] = k
				end
			end
		
			ability_table.hand_type = pseudorandom_element(hands, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
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
								level_up_hand(card, ability_table.hand_type)
								return true
							end,
						},
					}
				end
            end
        end,
    },

    thac_suitleveler = {
		type = "chain",
        ability = {value = 2, reset = 4, counter = 4, suit = "Hearts", min_possible = 1, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {Stacked.round(ability_table.perfect, 1), localize(ability_table.suit, 'suits_plural'), ability_table.reset, ability_table.reset == 1 and "" or "s", ability_table.value, ability_table.value == 1 and "" or "s", ability_table.counter, colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}, G.C.SUITS[ability_table.suit]}},
			background_colour = lighten(G.C.IMPORTANT, bg_contrast)}
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
    thac_attr_mult = {
		type = {"passive", "aura"},
        ability = {value = 2, attr = "DARK", min_possible = 3, max_possible = 12},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.attr), colours = {G.C.JOY[ability_table.attr]}},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local attrs = {"LIGHT", "FIRE", "WATER", "EARTH", "DARK", "WIND"}
			-- DIVINE is intentionally omitted
		
			ability_table.attr = pseudorandom_element(attrs, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_attribute(context.other_joker, ability_table.attr) then
				return {
					mult = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
    },
    thac_attr_chips = {
		type = {"passive", "aura"},
        ability = {value = 50, attr = "DARK", min_possible = 8, max_possible = 80,},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.attr), colours = {G.C.JOY[ability_table.attr]}},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local attrs = {"LIGHT", "FIRE", "WATER", "EARTH", "DARK", "WIND"}
			-- DIVINE is intentionally omitted
		
			ability_table.attr = pseudorandom_element(attrs, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_attribute(context.other_joker, ability_table.attr) then
				return {
					chips = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
    },
    thac_attr_xmult = {
		type = {"passive", "aura"},
        ability = {value = 1.5, attr = "DARK", min_possible = 1.0, max_possible = 2.0},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.attr), colours = {G.C.JOY[ability_table.attr]}},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local attrs = {"LIGHT", "FIRE", "WATER", "EARTH", "DARK", "WIND"}
			-- DIVINE is intentionally omitted
		
			ability_table.attr = pseudorandom_element(attrs, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_attribute(context.other_joker, ability_table.attr) then
				return {
					xmult = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
    },
	thac_attr_asc = {
		type = {"passive", "aura"},
        ability = {value = 1.5, attr = "DARK", min_possible = 1.0, max_possible = 2.0},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.attr), colours = {G.C.JOY[ability_table.attr]}},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local attrs = {"LIGHT", "FIRE", "WATER", "EARTH", "DARK", "WIND"}
			-- DIVINE is intentionally omitted
		
			ability_table.attr = pseudorandom_element(attrs, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_attribute(context.other_joker, ability_table.attr) then
				return {
					plus_asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring")) and next(SMODS.find_mod("entr"))
		end,
    },

    thac_ygotype_mult = {
		type = {"passive", "aura"},
        ability = {value = 10, type = "Fiend", min_possible = 4, max_possible = 16},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.type)},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Aqua", "Beast", "BeastWarrior", "Cyberse", "Dinosaur", "Dragon", "Fairy", "Fiend", "Fish", "Illusion", "Insect", "Machine", "Plant", "Psychic", "Pyro", "Reptile", "Rock", "SeaSerpent", "Spellcaster", "Thunder", "Warrior", "WingedBeast", "Wyrm", "Zombie"}
			-- DivineBeast and CreatorGod are intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_monster_type(context.other_joker, ability_table.type) then
				return {
					mult = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
    },
    thac_ygotype_chips = {
		type = {"passive", "aura"},
        ability = {value = 50, type = "Fiend", min_possible = 25, max_possible = 150},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.type)},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Aqua", "Beast", "BeastWarrior", "Cyberse", "Dinosaur", "Dragon", "Fairy", "Fiend", "Fish", "Illusion", "Insect", "Machine", "Plant", "Psychic", "Pyro", "Reptile", "Rock", "SeaSerpent", "Spellcaster", "Thunder", "Warrior", "WingedBeast", "Wyrm", "Zombie"}
			-- DivineBeast and CreatorGod are intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.value
            local diff = new - old

            ability_table.value = new
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_monster_type(context.other_joker, ability_table.type) then
				return {
					chips = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
    },
    thac_ygotype_xmult = {
		type = {"passive", "aura"},
        ability = {value = 1.5, type = "Fiend", min_possible = 1.5, max_possible = 2.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.type)},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Aqua", "Beast", "BeastWarrior", "Cyberse", "Dinosaur", "Dragon", "Fairy", "Fiend", "Fish", "Illusion", "Insect", "Machine", "Plant", "Psychic", "Pyro", "Reptile", "Rock", "SeaSerpent", "Spellcaster", "Thunder", "Warrior", "WingedBeast", "Wyrm", "Zombie"}
			-- DivineBeast and CreatorGod are intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_monster_type(context.other_joker, ability_table.type) then
				return {
					xmult = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
    },
    thac_ygotype_asc = {
		type = {"passive", "aura"},
        ability = {value = 1.5, type = "Fiend", min_possible = 1.5, max_possible = 2.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("k_joy_" .. ability_table.type)},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Aqua", "Beast", "BeastWarrior", "Cyberse", "Dinosaur", "Dragon", "Fairy", "Fiend", "Fish", "Illusion", "Insect", "Machine", "Plant", "Psychic", "Pyro", "Reptile", "Rock", "SeaSerpent", "Spellcaster", "Thunder", "Warrior", "WingedBeast", "Wyrm", "Zombie"}
			-- DivineBeast and CreatorGod are intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and JoyousSpring.is_monster_type(context.other_joker, ability_table.type) then
				return {
					plus_asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring")) and next(SMODS.find_mod("entr"))
		end,
    },
    thac_hand_mult = {
		type = "passive",
        ability = {value = 10, hand_type = "High Card", min_possible = 8, max_possible = 12},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize(ability_table.hand_type, 'poker_hands')},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local hands = {}
			for k, hand in pairs(G.GAME.hands) do
				if hand.visible then
					hands[#hands+1] = k
				end
			end
		
			ability_table.hand_type = pseudorandom_element(hands, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			if ability_table.hand_type == "High Card" then
				ability_table.min_possible = 1
				ability_table.max_possible = 4
			end
			randvalue_default(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main and next(context.poker_hands[ability_table.hand_type]) then
                return {
					mult = ability_table.value
				}
            end
        end,
    },

    thac_hand_chips = {
		type = "passive",
        ability = {value = 70, hand_type = "High Card", min_possible = 50, max_possible = 100},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize(ability_table.hand_type, 'poker_hands')},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local hands = {}
			for k, hand in pairs(G.GAME.hands) do
				if hand.visible then
					hands[#hands+1] = k
				end
			end
		
			ability_table.hand_type = pseudorandom_element(hands, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			if ability_table.hand_type == "High Card" then
				ability_table.min_possible = 10
				ability_table.max_possible = 40
			end
			randvalue_default(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main and next(context.poker_hands[ability_table.hand_type]) then
                return {
					chips = ability_table.value
				}
            end
        end,
    },
    thac_hand_xmult = {
		type = "passive",
        ability = {value = 2, hand_type = "High Card", min_possible = 2, max_possible = 4},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize(ability_table.hand_type, 'poker_hands')},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local hands = {}
			for k, hand in pairs(G.GAME.hands) do
				if hand.visible then
					hands[#hands+1] = k
				end
			end
		
			ability_table.hand_type = pseudorandom_element(hands, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			if ability_table.hand_type == "High Card" then
				ability_table.min_possible = 1
				ability_table.max_possible = 1.5
			end
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main and next(context.poker_hands[ability_table.hand_type]) then
                return {
					xmult = ability_table.value
				}
            end
        end,
    },
    thac_hand_asc = {
		type = "passive",
        ability = {value = 2, hand_type = "High Card", min_possible = 2, max_possible = 3},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize(ability_table.hand_type, 'poker_hands')},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local hands = {}
			for k, hand in pairs(G.GAME.hands) do
				if hand.visible then
					hands[#hands+1] = k
				end
			end
		
			ability_table.hand_type = pseudorandom_element(hands, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			if ability_table.hand_type == "High Card" then
				ability_table.min_possible = 1
				ability_table.max_possible = 2
			end
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main and next(context.poker_hands[ability_table.hand_type]) then
                return {
					plus_asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },
    thac_small_hands = {
		type = "passive",
        ability = {value = 3, target = 3, min_possible = 0, max_possible = 10},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, ability_table.target},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local sizes = {1, 2, 3, 4}
		
			ability_table.target = pseudorandom_element(sizes, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = ability_table.value^(1+(5-ability_table.target)/4)
			ability_table.value = math.floor(ability_table.value * 100) / 100
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = ability_table.value^(1+(5-ability_table.target)/4)
			ability_table.value = math.floor(ability_table.value * 100) / 100
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main and #context.scoring_hand <= ability_table.target then
                return {
					mult = ability_table.value
				}
            end
        end,
    },
    thac_cq_mult = {
		type = "attack",
        ability = {value = 6, quality = "face", min_possible = 2, max_possible = 8},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
                return {
					mult = ability_table.value
				}
            end
        end,
    },

    thac_cq_chips = {
		type = "attack",
        ability = {value = 30, quality = "face", min_possible = 15, max_possible = 45},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
                return {
					chips = ability_table.value
				}
            end
        end,
    },
    thac_cq_xmult = {
		type = "attack",
        ability = {value = 1, quality = "face", min_possible = 1, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
                return {
					xmult = ability_table.value
				}
            end
        end,
    },
    thac_cq_asc = {
		type = "attack",
        ability = {value = 1, quality = "face", min_possible = 0.1, max_possible = 1},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
                return {
					plus_asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },
    thac_bj_mult = {
		type = "passive",
        ability = {value = 1.0, min_possible = 0.0, max_possible = 1.0},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				ability_table.value * (G.deck and #G.deck.cards or 52),
			},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
                return {
					mult = ability_table.value * #G.deck.cards
				}
            end
        end,
    },
    thac_bj_chips = {
		type = "passive",
        ability = {value = 2.0, min_possible = 0.0, max_possible = 2.0},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				ability_table.value * (G.deck and #G.deck.cards or 52),
			},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
                return {
					chips = ability_table.value * #G.deck.cards
				}
            end
        end,
    },

    thac_bj_xmult = {
		type = "passive",
        ability = {value = 0.02, min_possible = 0.01, max_possible = 0.05},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				1 + (ability_table.value * (G.deck and #G.deck.cards or 52)),
			},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
                return {
					xmult = 1 + (ability_table.value * #G.deck.cards)
				}
            end
        end,
    },
    thac_bj_asc = {
		type = "passive",
        ability = {value = 0.1, min_possible = 0.01, max_possible = 0.05},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				ability_table.value * (G.deck and #G.deck.cards or 52),
			},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
                return {
					plus_asc = ability_table.value * #G.deck.cards
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },
	thac_bonus_attr = {
		type = "passive",
		no_potency = true,
		ability = {attr = "DIVINE"},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {localize("k_joy_" .. ability_table.attr), colours = {G.C.JOY[ability_table.attr]}},
			background_colour = lighten(G.C.SECONDARY_SET.Planet, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local attrs = {"LIGHT", "FIRE", "WATER", "EARTH", "DARK", "WIND"}
			-- DIVINE is intentionally omitted
			
			local newattrs = {}
			for _,att in ipairs(attrs) do
				if not JoyousSpring.is_attribute(card, att) then
					newattrs[#newattrs+1] = att
				end
			end
			if #newattrs == 0 then newattrs[#newattrs+1] = "DIVINE" end
		
			ability_table.attr = pseudorandom_element(newattrs, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
		end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
		in_pool = function(card)
			return JoyousSpring.is_monster_card(card) and not JoyousSpring.is_all_attributes(card)
		end,
	},
	thac_bonus_ygotype = {
		type = "passive",
		no_potency = true,
		ability = {ygotype = "DivineBeast"},
        loc_vars = function(info_queue, card, ability_table)
			local text = localize("k_joy_" .. ability_table.type)
			local text2 = text:sub(1,1):upper()
			local text3 = ""
			if text2 == "A" or text2 == "E" or text2 == "I" or text2 == "O" or text2 == "U" then
				text3 = "n"
			end
            return {vars = {text, text3},
			background_colour = lighten(G.C.SECONDARY_SET.Planet, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Aqua", "Beast", "BeastWarrior", "Cyberse", "Dinosaur", "Dragon", "Fairy", "Fiend", "Fish", "Illusion", "Insect", "Machine", "Plant", "Psychic", "Pyro", "Reptile", "Rock", "SeaSerpent", "Spellcaster", "Thunder", "Warrior", "WingedBeast", "Wyrm", "Zombie"}
			-- DivineBeast and CreatorGod are intentionally omitted
			
			local newtypes = {}
			for _,typ in ipairs(types) do
				if not JoyousSpring.is_monster_type(card, typ) then
					newtypes[#newtypes+1] = typ
				end
			end
			if #newtypes == 0 then newtypes[#newtypes+1] = "DivineBeast" end
		
			ability_table.type = pseudorandom_element(newtypes, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
		end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
		in_pool = function(card)
			return JoyousSpring.is_monster_card(card) and not JoyousSpring.is_all_types(card)
		end,
	},
    thac_first_cq_mult = {
		type = "attack",
        ability = {value = 10, quality = "face", min_possible = 4, max_possible = 15},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
				local first_cq = false
				for i = 1, #context.scoring_hand do
					if AMM.api.cardqualities.has(context.scoring_hand[i], ability_table.quality) then
						first_cq = context.scoring_hand[i] == context.other_card
						break
					end
				end
				if first_cq then
					return {
						mult = ability_table.value
					}
				end
            end
        end,
    },

    thac_first_cq_chips = {
		type = "attack",
        ability = {value = 50, quality = "face", min_possible = 30, max_possible = 50},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
				local first_cq = false
				for i = 1, #context.scoring_hand do
					if AMM.api.cardqualities.has(context.scoring_hand[i], ability_table.quality) then
						first_cq = context.scoring_hand[i] == context.other_card
						break
					end
				end
				if first_cq then
					return {
						chips = ability_table.value
					}
				end
            end
        end,
    },
    thac_first_cq_xmult = {
		type = "attack",
        ability = {value = 2, quality = "face", min_possible = 1, max_possible = 1.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
				local first_cq = false
				for i = 1, #context.scoring_hand do
					if AMM.api.cardqualities.has(context.scoring_hand[i], ability_table.quality) then
						first_cq = context.scoring_hand[i] == context.other_card
						break
					end
				end
				if first_cq then
					return {
						xmult = ability_table.value
					}
				end
            end
        end,
    },
    thac_first_cq_asc = {
		type = "attack",
        ability = {value = 1, quality = "face", min_possible = 0, max_possible = 1.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				AMM.api.cardqualities.localize(ability_table.quality),
				AMM.api.cardqualities.localize(ability_table.quality,1)
			},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play and AMM.api.cardqualities.has(context.other_card, ability_table.quality) then
				local first_cq = false
				for i = 1, #context.scoring_hand do
					if AMM.api.cardqualities.has(context.scoring_hand[i], ability_table.quality) then
						first_cq = context.scoring_hand[i] == context.other_card
						break
					end
				end
				if first_cq then
					return {
						plus_asc = ability_table.value
					}
				end
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },
	--[[
    thac_simplicity = {
		type = {"passive", "cursed"},
        ability = {value = 1, min_possible = 0, max_possible = 25},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			}}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
				return {
					mult = ability_table.value
				}
            end
			if context.mod_probability then
				return {
					denominator = context.denominator + ability_table.value
				}
			end
        end,
        in_pool = function(card)
            return not not G.GAME.cursed_effects_enable
        end,
    },--]]
    thac_more_xchips = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 1.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
				return {
					xchips = ability_table.value
				}
            end
        end,
    },
    thac_more_asc = {
		type = "passive",
        ability = {value = 1, min_possible = 0.3, max_possible = 1.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
				return {
					plus_asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },

    thac_more_xasc = {
		type = "passive",
        ability = {value = 1, min_possible = 1.1, max_possible = 1.4},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
				return {
					asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },
    thac_flipside_buff = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff and G.GAME.entr_alt then
				return {
					buff = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },
    thac_combo_mult = {
		type = {"passive", "chain"},
        ability = {value = 1, min_possible = 0, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.post_trigger and context.other_card == card and context.other_ret and type(hand_chips) == "number" then
                return {
					mult = ability_table.value
				}
            end
        end,
    },
    thac_combo_chips = {
		type = {"passive", "chain"},
        ability = {value = 1, min_possible = 0, max_possible = 10},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.post_trigger and context.other_card == card and context.other_ret and type(hand_chips) == "number" then
                return {
					chips = ability_table.value
				}
            end
        end,
    },
    thac_combo_xmult = {
		type = {"passive", "chain"},
        ability = {value = 1, min_possible = 1, max_possible = 1.25},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.post_trigger and context.other_card == card and context.other_ret and type(hand_chips) == "number" then
                return {
					xmult = ability_table.value
				}
            end
        end,
    },

    thac_combo_asc = {
		type = {"passive", "chain"},
        ability = {value = 1, min_possible = 0.1, max_possible = 0.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = updvalue_default,
        calculate = function(card, context, ability_table, ability_index)
            if context.post_trigger and context.other_card == card and context.other_ret and type(hand_chips) == "number" then
                return {
					plus_asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("entr"))
		end,
    },
    thac_fadeout = {
		type = "passive",
        ability = {value = 1, min_possible = 0.01, max_possible = 0.1},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value * 100,
				G.GAME.starting_deck_size,
				ability_table.value * 100 * math.max(0, G.GAME.starting_deck_size - (G.deck and #G.playing_cards or 52))
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff and G.GAME.starting_deck_size > #G.playing_cards then
				return {
					buff = 1 + (ability_table.value * math.max(0, G.GAME.starting_deck_size - (G.deck and #G.playing_cards or 52)))
				}
            end
        end,
    },
    thac_magazine = {
		type = "passive",
        ability = {value = 1, min_possible = 0, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				ability_table.value == 1 and "" or "s",
			},
			background_colour = lighten(G.C.SECONDARY_SET.Planet, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_whole(card, ability_table)
		end,
		load_check = function()
			return next(SMODS.find_mod("kino"))
		end,
    },
	thac_spellcaster = {
		type = "passive",
        ability = {value = 1, min_possible = 2, max_possible = 14},
        loc_vars = function(info_queue, card, ability_table)
			local tbl = {
				"nil",
				"2", "3", "4", "5", "6", "7", "8", "9", "10",
				"Jack", "Queen", "King", "Ace"
			}
			local text = localize(tbl[math.max(2,math.min(14,ability_table.value))], 'ranks')
			local text2 = text:sub(1,1):upper()
			local text3 = ""
			if text2 == "A" or text2 == "E" or text2 == "I" or text2 == "O" or text2 == "U" then
				text3 = "n"
			end
            return {vars = {
				text, text3
			},
			background_colour = lighten(G.C.IMPORTANT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_whole(card, ability_table)
		end,
		calculate = function(card, context, ability_table, ability_index)
			if context.joker_main and #G.hand.cards > 1 then
				local _strength = check_spell_strength(ability_table.value)
				local _spell_key = check_spell_key(G.hand.cards)
				local _return_table = cast_spell(_spell_key, _strength)
				G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
					attention_text({
						text = localize({type="name_text", set="Spell", key= _spell_key }),
						scale = 1.3, 
						hold = 1.4,
						major = G.play,
						align = 'tm',
						offset = {x = 0, y = -1},
						silent = true
					})
					card:juice_up()
				return true end }))

				if type(_return_table) ~= 'table' then return nil end
				card_eval_status_text(card, 'extra', nil, nil, nil,
				{ message = localize('k_spell_cast'), colour = G.C.PURPLE })
				return _return_table
			end
		end,
		load_check = function()
			return next(SMODS.find_mod("kino"))
		end,
	},
	thac_incrementalist = {
		type = {"passive", "chain"},
        ability = {value = 6, counter = 0, card_key = "c_zero_plasmid", min_possible = 5, max_possible = 8},
        loc_vars = function(info_queue, card, ability_table)
			--info_queue[#info_queue+1] = G.P_CENTERS[ability_table.card_key]
			local text = localize{type = 'name_text', set = 'Prestige', key = ability_table.card_key}
			local text2 = text:sub(1,1):upper()
			local text3 = ""
			if text2 == "A" or text2 == "E" or text2 == "I" or text2 == "O" or text2 == "U" then
				text3 = "n"
			end
            return {vars = {
				text, text3,
				ability_table.value,
				math.max(0,ability_table.value - ability_table.counter),
			},
			background_colour = lighten(G.C.SECONDARY_SET.Prestige, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.card_key = pseudorandom_element(G.P_CENTER_POOLS["Prestige"], ability_table.pseed.."_"..card.config.center_key).key
			randvalue_inverse(card, ability_table)
			ability_table.value = math.max(1,ability_table.value)
		end,
        update_values = function(card, ability_table)
			updvalue_inverse(card, ability_table)
			ability_table.value = math.max(1,ability_table.value)
		end,
		calculate = function(card, context, ability_table, ability_index)
			if context.post_trigger and context.other_card == card and context.other_ret then
				ability_table.counter = ability_table.counter + 1
				if ability_table.counter >= ability_table.value and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					--card:juice_up(0.3, 0.5)
					ability_table.counter = 0
					
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = (function()
							G.E_MANAGER:add_event(Event({
								func = function() 
									local card = create_card('Prestige',G.consumeables, nil, nil, nil, nil, ability_table.card_key, ability_table.pseed.."_"..card.config.center_key)
									card:add_to_deck()
									G.consumeables:emplace(card)
									G.GAME.consumeable_buffer = 0
									return true
								end}))   
								card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'yippee', colour = G.C.GOLD})
							return true
						end)}))
				end
			end
		end,
		load_check = function()
			return next(SMODS.find_mod("zeroError"))
		end,
	},

    thac_poketype_mult = {
		type = {"passive", "aura"},
        ability = {value = 2, type = "Colorless", min_possible = 3, max_possible = 12},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("poke_" .. ability_table.type:lower() .. "_badge"), colours = {G.ARGS.LOC_COLOURS[ability_table.type:lower()]}},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Colorless", "Dark", "Metal", "Fairy", "Dragon", "Earth"}
			-- Bird is intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and is_type(context.other_joker, ability_table.type) then
				return {
					mult = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("Pokermon"))
		end,
    },
    thac_poketype_chips = {
		type = {"passive", "aura"},
        ability = {value = 66, type = "Colorless", min_possible = 8, max_possible = 60},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("poke_" .. ability_table.type:lower() .. "_badge"), colours = {G.ARGS.LOC_COLOURS[ability_table.type:lower()]}},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Colorless", "Dark", "Metal", "Fairy", "Dragon", "Earth"}
			-- Bird is intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and is_type(context.other_joker, ability_table.type) then
				return {
					chips = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("Pokermon"))
		end,
    },
    thac_poketype_xmult = {
		type = {"passive", "aura"},
        ability = {value = 1.4, type = "Colorless", min_possible = 1.0, max_possible = 1.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("poke_" .. ability_table.type:lower() .. "_badge"), colours = {G.ARGS.LOC_COLOURS[ability_table.type:lower()]}},
			background_colour = lighten(G.C.XMULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Colorless", "Dark", "Metal", "Fairy", "Dragon", "Earth"}
			-- Bird is intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and is_type(context.other_joker, ability_table.type) then
				return {
					xmult = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("Pokermon"))
		end,
    },
    thac_poketype_asc = {
		type = {"passive", "aura"},
        ability = {value = 2, type = "Colorless", min_possible = 0.1, max_possible = 1.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.value, localize("poke_" .. ability_table.type:lower() .. "_badge"), colours = {G.ARGS.LOC_COLOURS[ability_table.type:lower()]}},
			background_colour = lighten(G.C.GOLD, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local types = {"Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Colorless", "Dark", "Metal", "Fairy", "Dragon", "Earth"}
			-- Bird is intentionally omitted
		
			ability_table.type = pseudorandom_element(types, pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
        end,
        calculate = function(card, context, ability_table, ability_index)
            if context.other_joker and is_type(context.other_joker, ability_table.type) then
				return {
					plus_asc = ability_table.value
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("Pokermon")) and next(SMODS.find_mod("entr"))
		end,
    },
    thac_genre_whiplash = {
		type = "passive",
        ability = {value = 1, min_possible = 0, max_possible = 0.3},
        loc_vars = function(info_queue, card, ability_table)
			local genres = {}
			if not card.area.config.collection then
				for k,v in ipairs(G.jokers.cards) do
					local _genres = v and v.config.center.k_genre or {}
					if #_genres >= 1 then
						for i, _genre in ipairs(_genres) do
							genres[_genre] = 1
						end
					end
				end
			end
			local uniques = 0
			for k,v in pairs(genres) do uniques = uniques + 1 end
            return {vars = {
				ability_table.value * 100,
				ability_table.value * 100 * uniques
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff then
				local genres = {}
				for k,v in ipairs(G.jokers.cards) do
					local _genres = v and v.config.center.k_genre or {}
					if #_genres >= 1 then
						for i, _genre in ipairs(_genres) do
							genres[_genre] = 1
						end
					end 
				end
				local uniques = 0
				for k,v in pairs(genres) do uniques = uniques + 1 end
				if uniques == 0 then return end
				return {
					buff = 1 + (ability_table.value * uniques)
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("kino"))
		end,
    },

    thac_more_dakka = {
		type = "passive",
        ability = {value = 1, min_possible = 0, max_possible = 0.5},
        loc_vars = function(info_queue, card, ability_table)
			local bullets = Kino.count_bullets()
            return {vars = {
				ability_table.value * 100,
				ability_table.value * 100 * bullets
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff then
				local bullets = Kino.count_bullets()
				if bullets < 1 then return end
				return {
					buff = 1 + (ability_table.value * bullets)
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("kino"))
		end,
    },
    thac_enh_force = {
		type = "passive",
        ability = {value = 1, card_key = "m_wild", min_possible = 0.1, max_possible = 0.4},
        loc_vars = function(info_queue, card, ability_table)
			local enhs = 0
			if G.deck then
				for k,v in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(v, ability_table.card_key) then
						enhs = enhs + 1
					end
				end
			end
			local text = localize{type = 'name_text', set = 'Enhanced', key = ability_table.card_key}
            return {vars = {
				ability_table.value * 100,
				text,
				ability_table.value * 100 * enhs
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			local enhs = {}
			if G.deck then
				for k,v in ipairs(G.playing_cards) do
					if v.config.center.set == "Enhanced" then
						enhs[#enhs+1] = v.config.center
					end
				end
			end
			if #enhs == 0 then enhs = G.P_CENTER_POOLS["Enhanced"] end
			ability_table.card_key = pseudorandom_element(enhs, ability_table.pseed.."_"..card.config.center_key).key
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff then
				local enhs = 0
				for k,v in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(v, ability_table.card_key) then
						enhs = enhs + 1
					end
				end
				if enhs < 1 then return end
				return {
					buff = 1 + (ability_table.value * enhs)
				}
            end
        end,
    },
    thac_hang_in_there = {
		type = "passive",
        ability = {value = 1, pos = 1, min_possible = 0, max_possible = 2},
        loc_vars = function(info_queue, card, ability_table)
			local text = tostring(ability_table.pos)
			if ability_table.pos % 10 == 1 then
				text = text.."st"
			elseif ability_table.pos % 10 == 2 then
				text = text.."nd"
			else
				text = text.."th"
			end
            return {vars = {
				ability_table.value,
				ability_table.pos,
				text,
				ability_table.value == 1 and "" or "s",
			},
			background_colour = lighten(G.C.IMPORTANT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.pos = pseudorandom(ability_table.pseed.."_"..card.config.center_key, 1, G.GAME.starting_params.play_limit)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_whole(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.repetition and context.scoring_hand and context.cardarea == G.play then
				for k,v in ipairs(context.scoring_hand) do
					if v == context.other_card and k == ability_table.pos then
						return {
							repetitions = ability_table.value
						}
					end
				end
            end
        end,
    },
	thac_genre_hater = {
		type = "passive",
        ability = {value = 1, genre = "War", min_possible = 0.1, max_possible = 0.4},
        loc_vars = function(info_queue, card, ability_table)
			local nonhated = 0
			if not card.area.config.collection then
				for k,v in ipairs(G.jokers.cards) do
					local _genres = v and v.config.center.k_genre or {}
					if #_genres >= 1 then
						local doit = true
						for i, _genre in ipairs(_genres) do
							if _genre == ability_table.genre then
								doit = false
							end
						end
						if doit then nonhated = nonhated + 1 end
					end
				end
			end
            return {vars = {
				ability_table.value * 100,
				ability_table.value * 100 * nonhated,
				ability_table.genre,
				colours = {G.ARGS.LOC_COLOURS[ability_table.genre]}
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			ability_table.genre = pseudorandom_element(kino_genres, ability_table.pseed.."_"..card.config.center_key)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff then
				local nonhated = 0
				for k,v in ipairs(G.jokers.cards) do
					local _genres = v and v.config.center.k_genre or {}
					if #_genres >= 1 then
						local doit = true
						for i, _genre in ipairs(_genres) do
							if _genre == ability_table.genre then
								doit = false
							end
						end
						if doit then nonhated = nonhated + 1 end
					end
				end
				if nonhated == 0 then return end
				return {
					buff = 1 + (ability_table.value * nonhated)
				}
            end
        end,
		load_check = function()
			return next(SMODS.find_mod("kino"))
		end,
	},
	thac_bigger_picture = {
		type = "passive",
        ability = {value = 1, min_possible = 0.0, max_possible = 0.1},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value * 100,
				ability_table.value * 100 * (G.jokers and #G.jokers.cards or 0)
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff then
				return {
					buff = 1 + (ability_table.value * #G.jokers.cards)
				}
            end
        end,
	},

	thac_phasing = {
		type = {"passive", "cursed"},
        ability = { mode = 0 },
		no_potency = true,
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
			},
			background_colour = lighten(G.C.RED, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
		end,
        update_values = function(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.setting_blind then
				if ability_table.mode == 0 then
					ability_table.mode = 1
					JoyousSpring.banish(card, "blind_selected", nil, nil)
				else
					ability_table.mode = 0
				end
            end
        end,
        in_pool = function(card)
            return not not G.GAME.cursed_effects_enable
        end,
		load_check = function()
			return next(SMODS.find_mod("JoyousSpring"))
		end,
	},
	thac_hardboiled = {
		type = "passive",
        ability = {value = 1, min_possible = 0, max_possible = 3},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.MONEY, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_whole(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
			if context.end_of_round and context.game_over == false and context.main_eval and ability_table.value > 0 and not context.blueprint then
				card.ability.extra_value = card.ability.extra_value + ability_table.value
				card:set_cost()
				return {
					message = localize('k_val_up'),
					colour = G.C.MONEY
				}
            end
        end,
    },
	thac_simple_scaling = {
		type = "scaling",
		ability = {value = 1, min_possible = 0, max_possible = 10},
		loc_vars = function(info_queue, card, ability_table)
			return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.SECONDARY_SET.Spectral, bg_contrast)}
		end,
		randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
		update_values = function(card, ability_table)
			updvalue_tenths(card, ability_table)
		end,
		calculate = function(card, context, ability_table, ability_index)
			if context.end_of_round and context.game_over == false and context.main_eval and ability_table.value > 0 and not context.blueprint then
				scalingeffect{
					card = card,
					mode = "random",
					pseed = card.config.center_key.."_"..ability_table.pseed,
					amount = ability_table.value
				}
				return {
					message = localize('k_val_up'),
					colour = G.C.GREEN
				}
			end
		end,
		in_pool = function(card)
			return card.ability.hsr_extra_effects and #card.ability.hsr_extra_effects > 0
		end,
	},
	thac_caino = {
		type = "scaling",
		ability = {value = 1, quality = "face", min_possible = 5, max_possible = 10},
		loc_vars = function(info_queue, card, ability_table)
			local text = AMM.api.cardqualities.localize(ability_table.quality)
			local text2 = text:sub(1,1):upper()
			local text3 = ""
			if text2 == "A" or text2 == "E" or text2 == "I" or text2 == "O" or text2 == "U" then
				text3 = "n"
			end
			return {vars = {
				ability_table.value,
				text,
				AMM.api.cardqualities.localize(ability_table.quality,1),
				text3,
			},
			background_colour = lighten(G.C.RARITY[4], bg_contrast)}
		end,
		randomize_values = function(card, ability_table)
			ability_table.quality = AMM.api.cardqualities.random(pseudoseed(card.config.center.key.."_"..ability_table.pseed))
			randvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
			ability_table.value = Stacked.round(ability_table.value, 1)
		end,
		update_values = function(card, ability_table)
			updvalue_tenths(card, ability_table)
			ability_table.value = cardquality_value(ability_table.value, ability_table.quality)
			ability_table.value = Stacked.round(ability_table.value, 1)
		end,
		calculate = function(card, context, ability_table, ability_index)
			if context.remove_playing_cards and ability_table.value > 0 and not context.blueprint then
				local cq_cards = 0
				for _, removed_card in ipairs(context.removed) do
					if AMM.api.cardqualities.has(removed_card, ability_table.quality) then cq_cards = cq_cards + 1 end
				end
				if cq_cards > 0 then
					scalingeffect{
						card = card,
						--mode = "random",
						pseed = card.config.center_key.."_"..ability_table.pseed,
						amount = ability_table.value
					}
					return {
						message = localize('k_val_up'),
						colour = G.C.GREEN
					}
				end
			end
		end,
		in_pool = function(card)
			return card.ability.hsr_extra_effects and #card.ability.hsr_extra_effects > 0
		end,
	},
	thac_yorick = {
		type = "scaling",
		ability = {value = 1, threshold = 23, remaining = 23, min_possible = 5, max_possible = 20},
		loc_vars = function(info_queue, card, ability_table)
			return {vars = {
				ability_table.value,
				ability_table.threshold,
				ability_table.remaining,
			},
			background_colour = lighten(G.C.RARITY[4], bg_contrast)}
		end,
		randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
		update_values = function(card, ability_table)
			updvalue_tenths(card, ability_table)
		end,
		calculate = function(card, context, ability_table, ability_index)
			if context.discard and not context.blueprint then
				if ability_table.remaining <= 1 then
					ability_table.remaining = ability_table.threshold
					scalingeffect{
						card = card,
						--mode = "random",
						pseed = card.config.center_key.."_"..ability_table.pseed,
						amount = ability_table.value
					}
					return {
						message = localize('k_val_up'),
						colour = G.C.GREEN
					}
				else
					ability_table.remaining = ability_table.remaining - 1
					return nil, true -- something something retriggers?
					-- maybe investigate why this matters TODO
				end
			end
		end,
		in_pool = function(card)
			return card.ability.hsr_extra_effects and #card.ability.hsr_extra_effects > 0
		end,
	},

    thac_hiking = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 10},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.play then
                return {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS,
					func = function()
						context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + ability_table.value
					end,
				}
            end
        end,
    },
    thac_lounging = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == G.hand then
                return {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS,
					func = function()
						context.other_card.ability.perma_h_chips = (context.other_card.ability.perma_h_chips or 0) + ability_table.value
					end,
				}
            end
        end,
    },
	thac_skulking = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 15},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.CHIPS, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.individual and not context.end_of_round and not context.repetition and context.cardarea == "unscored" then
                return {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS,
					func = function()
						context.other_card.ability.perma_u_chips = (context.other_card.ability.perma_u_chips or 0) + ability_table.value
					end,
				}
            end
        end,
    },
	thac_dramatic_entrance = {
		type = "passive",
        ability = {value = 1, min_possible = 0.0, max_possible = 1.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value * 100,
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff and ability_table.value > 0 and G.GAME.current_round.hands_played == 0 then
				return {
					buff = 1 + ability_table.value
				}
            end
        end,
	},
	thac_grand_finale = {
		type = "passive",
        ability = {value = 1, min_possible = 1.0, max_possible = 2.5},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value * 100,
			},
			background_colour = lighten(G.C.SECONDARY_SET.Tarot, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_hundreths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_buff and ability_table.value > 0 and G.GAME.current_round.hands_left == 0 then
				return {
					buff = 1 + ability_table.value
				}
            end
        end,
	},

--[[
    thac_more_plusmult = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 21},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_default(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
				return {
					plusmult = ability_table.value
				}
            end
        end,
    },
    thac_more_xplusmult = {
		type = "passive",
        ability = {value = 1, min_possible = 1, max_possible = 2.1},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
			},
			background_colour = lighten(G.C.MULT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_tenths(card, ability_table)
		end,
        update_values = function(card, ability_table)
			updvalue_default(card, ability_table)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.joker_main then
				return {
					x_plusmult = ability_table.value
				}
            end
        end,
    },
--]]
    thac_colour_by_jokes = {
		type = "chain",
        ability = {value = 4, counter = 4, min_possible = 2, max_possible = 4},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {
				ability_table.value,
				ability_table.value == 1 and "" or "s",
				ability_table.counter
			},
			background_colour = lighten(G.C.IMPORTANT, bg_contrast)}
        end,
        randomize_values = function(card, ability_table)
			randvalue_inverse(card, ability_table)
			ability_table.value = math.max(0,ability_table.value)
			ability_table.counter = ability_table.value
		end,
        update_values = function(card, ability_table)
			updvalue_inverse(card, ability_table)
			ability_table.value = math.max(0,ability_table.value)
		end,
        calculate = function(card, context, ability_table, ability_index)
            if context.post_trigger and context.other_card == card and context.other_ret then
                ability_table.counter = ability_table.counter - 1
				if ability_table.counter <= 0 then
					ability_table.counter = ability_table.value
					
					return {
						extra = {
							func = function()
								colour_end_of_round_effects()
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
	v.ability.pseed = k
	if (not v.load_check) or (type(v.load_check) == "function" and v:load_check()) then
		Stacked.extra_effect(v)
	end
end