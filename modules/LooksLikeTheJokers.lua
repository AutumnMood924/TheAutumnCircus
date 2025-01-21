local placeholder_jokers = { }

local jokers = {
	'immature_joker', immature_joker = {
		name = "Immature Joker",
		text = {
            "{C:mult}+#1#{} Mult if played",
            "hand contains",
            "a {C:attention}Nice"
        },
		config = {
			t_mult = 9,
            type = "thac_nice"
		},
		pos = { x = 2, y = 1 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.t_mult }} end,
	},
	'court_joker', court_joker = {
		name = "Court Joker",
		text = {
            "{C:mult}+#1#{} Mult if played",
            "hand contains",
            "a {C:attention}Blaze"
        },
		config = {
			t_mult = 10,
            type = "thac_blaze"
		},
		pos = { x = 1, y = 1 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.t_mult }} end,
	},
	'wacky_joker', wacky_joker = {
		name = "Wacky Joker",
		text = {
            "{C:mult}+#1#{} Mult if played",
            "hand contains",
            "a {C:attention}Skeet"
        },
		config = {
			t_mult = 14,
            type = "thac_skeet"
		},
		pos = { x = 0, y = 1 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.t_mult }} end,
	},
	'obnoxious_joker', obnoxious_joker = {
		name = "Obnoxious Joker",
		text = {
            "{C:chips}+#1#{} Chips if played",
            "hand contains",
            "a {C:attention}Nice"
        },
		config = {
			t_chips = 96,
            type = "thac_nice"
		},
		pos = { x = 2, y = 2 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.t_chips }} end,
	},
	'regal_joker', regal_joker = {
		name = "Regal Joker",
		text = {
            "{C:chips}+#1#{} Chips if played",
            "hand contains",
            "a {C:attention}Blaze"
        },
		config = {
			t_chips = 80,
            type = "thac_blaze"
		},
		pos = { x = 1, y = 2 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.t_chips }} end,
	},
	'crass_joker', crass_joker = {
		name = "Crass Joker",
		text = {
            "{C:chips}+#1#{} Chips if played",
            "hand contains",
            "a {C:attention}Skeet"
        },
		config = {
			t_chips = 120,
            type = "thac_skeet"
		},
		pos = { x = 0, y = 2 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.t_chips }} end,
	},
    'funny_number', funny_number = {
        name = "The Funny Number",
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}Nice"
        },
        config = {
            Xmult = 3,
            type = "thac_nice"
        },
        pos = { x = 2, y = 3 },
        cost = 8,
        rarity = 3,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.Xmult }} end,
    },
    'royal', royal = {
        name = "The Royal",
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}Blaze"
        },
        config = {
            Xmult = 2,
            type = "thac_blaze"
        },
        pos = { x = 1, y = 3 },
        cost = 8,
        rarity = 3,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.Xmult }} end,
    },
    'bracket', bracket = {
        name = "The Bracket",
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}Skeet"
        },
        config = {
            Xmult = 4,
            type = "thac_skeet"
        },
        pos = { x = 0, y = 3 },
        cost = 8,
        rarity = 3,
		loc_vars = function(_c, iq, card) return {vars = { card.ability.Xmult }} end,
    },
    'gift_from_the_void', gift_from_the_void = {
        name = "Gift from the Void",
        text = {
            "At end of round, add",
            "a random {C:dark_edition}Negative {C:attention}playing",
            "{C:attention}card{} to your deck"
        },
        config = { },
        pos = { x = 1, y = 0 },
        cost = 9,
        rarity = 3,
		loc_vars = function(self, info_queue, card)
            return {vars = {}}
        end,
        calculate = function(self, card, context)
            if context.end_of_round and not context.individual and not context.repetition then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        local _card = create_playing_card({
                            front = pseudorandom_element(G.P_CARDS, pseudoseed('gftv')), 
                            center = G.P_CENTERS.c_base}, G.deck, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                        _card:set_edition({negative = true}, nil, true)
                        G.GAME.blind:debuff_card(_card)
                        if context.blueprint_card then context.blueprint_card:juice_up() else card:juice_up() end
                        return true
                    end}))

                playing_card_joker_effects({true})
            end
        end,
    },
    'lord_of_the_meek', lord_of_the_meek = {
        name = "Lord of the Meek",
        text = {
            "{C:attention}Retrigger{} each",
            "{C:common}Common{} {C:attention}Joker{} {C:attention}#1#{} time#2#",
        },
        config = {extra = {retriggers = 1}},
        pos = { x = 2, y = 0 },
        cost = 7,
        rarity = 3,
		loc_vars = function(self, info_queue, card)
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
            return {vars = {card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if context.repetition_only or (context.retrigger_joker_check and context.other_card.config.center.rarity == 1) then
                return {
                    repetitions = card.ability.extra.retriggers,
                    card = card,
                    colour = G.C.ORANGE,
                    message = localize('k_again_ex')
                }     
            end
        end,
    },
    'mirage_joker', mirage_joker = {
        name = "Mirage Joker",
        text = {
            "{C:green}#1# in #2#{} chance to {C:attention}retrigger{}",
            "each {C:attention}Joker{} {C:attention}#3#{} time#4#",
        },
        config = {extra = {odds = 4, retriggers = 1}},
        pos = { x = 3, y = 0 },
        cost = 6,
        rarity = 2,
		loc_vars = function(self, info_queue, card)
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if context.repetition_only or (context.retrigger_joker_check and context.other_card ~= card and pseudorandom(pseudoseed("mirage_joker")) < G.GAME.probabilities.normal/card.ability.extra.odds) then
                return {
                    repetitions = card.ability.extra.retriggers,
                    card = card,
                    colour = G.C.ORANGE,
                    message = localize('k_again_ex')
                }     
            end
        end,
    },
    'transfusion', transfusion = {
        name = "Transfusion",
        text = {
            "{C:mult}#1#%{} of {C:chips}Chips{} are",
            "{C:attention}converted{} to {C:mult}Mult{}",
            "at a {X:mult,C:white} X#2# {} rate"
        },
        config = {extra = {rate = 0.4, xmult = 1.25, buffer = 0}},
        pos = { x = 4, y = 0 },
        cost = 6,
        rarity = 2,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.rate * 100, card.ability.extra.xmult}}
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                local hchips = hand_chips - card.ability.extra.buffer
                local val = math.floor(card.ability.extra.rate * hchips)
                card.ability.extra.buffer = card.ability.extra.buffer + val
                return {
                    chip_mod = -val,
                    mult_mod = val * card.ability.extra.xmult,
                    card = card,
                    colour = G.C.PURPLE,
                    message = "Converted!" --TODO: proper localization
                }
            end
            if context.after then
                card.ability.extra.buffer = 0
            end
        end,
    },
    'placeholder_joker', placeholder_joker = {
        name = "Placeholder Joker",
        text = {
            "{C:green}#1# in #2#{} chance to {C:attention}convert{}",
            "this {C:attention}Joker{} into a {C:purple}random{}",
            "other {C:attention}Joker{} with the same art"
        },
        config = {extra = {odds = 3}},
        pos = { x = 0, y = 0 },
        cost = 3,
        rarity = 1,
		loc_vars = function(self, info_queue, card)
            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds}}
        end,
        calculate = function(self, card, context)
            if context.joker_main and (pseudorandom(pseudoseed("placeholder_joker")) < G.GAME.probabilities.normal/card.ability.extra.odds) then
                card:set_ability(G.P_CENTERS[pseudorandom_element(placeholder_jokers, pseudoseed('placeholder_joker'))])
            end
        end,
    },
}

SMODS.Atlas{
	key = "LooksLikeTheJokers",
	path = "LooksLikeTheJokers.png",
	px = 71,
	py = 95,
}

--jokers
for _, k in ipairs(jokers) do
	local v = jokers[k]
	if not v.rarity then v.rarity = 1 end
	TheAutumnCircus.data.buffer_insert("Jokers", v, {key = k, atlas = "LooksLikeTheJokers"})
    if v.pos.x == 0 and v.pos.y == 0 then
        placeholder_jokers[#placeholder_jokers+1] = "j_thac_" .. k
    end
end