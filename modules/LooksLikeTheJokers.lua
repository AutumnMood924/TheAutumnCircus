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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.t_mult }} end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.t_mult }} end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.t_mult }} end,
	},
	'fuzzy_joker', fuzzy_joker = {
		name = "Fuzzy Joker",
        subtitle = "uhhhhhhhhhhh...........",
		text = {
            "{C:mult}+#1#{} Mult if played",
            "hand contains",
            "any {C:attention}Animal hand"
        },
		config = {
			extra = { mult = 12, },
		},
		pos = { x = 0, y = 0 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, info_queue, card)
            info_queue[#info_queue+1] = {key = 'thac_animal_hands', set = 'Other'}
            return {vars = { card.ability.extra.mult }} end,
        calculate = function(self, card, context)
            if context.joker_main and TheAutumnCircus.func.context_check_animal(context) then
                return { mult = card.ability.extra.mult }
            end
        end,
	},
	'stoic_joker', stoic_joker = {
		name = "Stoic Joker",
		text = {
            "{C:mult}+#1#{} Mult if played",
            "hand contains",
            "any {C:attention}Castle hand"
        },
		config = {
			extra = { mult = 16, },
		},
		pos = { x = 3, y = 1 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.mult }} end,
        calculate = function(self, card, context)
            if context.joker_main and TheAutumnCircus.func.context_check_castle(context) then
                return { mult = card.ability.extra.mult }
            end
        end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.t_chips }} end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.t_chips }} end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.t_chips }} end,
	},
	'furry_joker', furry_joker = {
		name = "Furry Joker",
        subtitle = "ummmmmmmmmmm???????????",
		text = {
            "{C:chips}+#1#{} Chips if played",
            "hand contains",
            "any {C:attention}Animal hand"
        },
		config = {
			extra = { chips = 120, },
		},
		pos = { x = 0, y = 0 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, info_queue, card)
            info_queue[#info_queue+1] = {key = 'thac_animal_hands', set = 'Other'}
            return {vars = { card.ability.extra.chips }} end,
        calculate = function(self, card, context)
            if context.joker_main and TheAutumnCircus.func.context_check_animal(context) then
                return { chips = card.ability.extra.chips }
            end
        end,
	},
	'stalwart_joker', stalwart_joker = {
		name = "Stalwart Joker",
		text = {
            "{C:chips}+#1#{} Chips if played",
            "hand contains",
            "any {C:attention}Castle hand"
        },
		config = {
			extra = { chips = 140, },
		},
		pos = { x = 3, y = 2 },
		cost = 4,
        rarity = 1,
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.chips }} end,
        calculate = function(self, card, context)
            if context.joker_main and TheAutumnCircus.func.context_check_castle(context) then
                return { chips = card.ability.extra.chips }
            end
        end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.Xmult }} end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.Xmult }} end,
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
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.Xmult }} end,
    },
	'pet', pet = {
		name = "The Pet",
        subtitle = "pet the dog (you must)",
		text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "any {C:attention}Animal hand"
        },
		config = {
			extra = { Xmult = 3.5, },
		},
		pos = { x = 0, y = 0 },
		cost = 8,
        rarity = 3,
		loc_vars = function(_c, info_queue, card)
            info_queue[#info_queue+1] = {key = 'thac_animal_hands', set = 'Other'}
            return {vars = { card.ability.extra.Xmult }} end,
        calculate = function(self, card, context)
            if context.joker_main and TheAutumnCircus.func.context_check_animal(context) then
                return { xmult = card.ability.extra.Xmult }
            end
        end,
	},
	'bastion', bastion = {
		name = "The Bastion",
		text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "any {C:attention}Castle hand"
        },
		config = {
			extra = { Xmult = 4.4, },
		},
		pos = { x = 3, y = 3 },
		cost = 8,
        rarity = 3,
		loc_vars = function(_c, iq, card)
            if not card.fake_card then iq[#iq+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.Xmult }} end,
        calculate = function(self, card, context)
            if context.joker_main and TheAutumnCircus.func.context_check_castle(context) then
                return { xmult = card.ability.extra.Xmult }
            end
        end,
	},
    'gift_from_the_void', gift_from_the_void = {
        name = "Gift from the Void",
        subtitle = "I am an idea thinking of itself",
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
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
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
        subtitle = "My wish is to make this world free!",
        text = {
            "{C:attention}Retrigger{} each",
            "{C:common}Common{} {C:attention}Joker{} {C:attention}#1#{} time#2#",
        },
        config = {extra = {retriggers = 1}},
        pos = { x = 2, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
            return {vars = {card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if (context.retrigger_joker_check and context.other_card.config.center.rarity == 1) then
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
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if (context.retrigger_joker_check and context.other_card ~= card and pseudorandom(pseudoseed("mirage_joker")) < G.GAME.probabilities.normal/card.ability.extra.odds) then
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
        config = {extra = {rate = 0.4, Xmult = 1.25, buffer = 0}},
        pos = { x = 4, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            return {vars = {card.ability.extra.rate * 100, card.ability.extra.Xmult}}
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                if type(hand_chips) == 'table' then
                    -- Talisman version
                    local hchips = hand_chips:sub(card.ability.extra.buffer)
                    hchips = hchips:mul(card.ability.extra.rate)
                    local val = hchips:floor()
                    card.ability.extra.buffer = val:add(card.ability.extra.buffer)
                    return {
                        chip_mod = val:neg(),
                        mult_mod = val:mul(card.ability.extra.Xmult),
                        card = card,
                        colour = G.C.PURPLE,
                        message = "Converted!"
                    }
                else
                    -- Nontalisman version
                    local hchips = hand_chips - card.ability.extra.buffer
                    local val = math.floor(card.ability.extra.rate * hchips)
                    card.ability.extra.buffer = card.ability.extra.buffer + val
                    return {
                        chip_mod = -val,
                        mult_mod = val * card.ability.extra.Xmult,
                        card = card,
                        colour = G.C.PURPLE,
                        message = "Converted!" --TODO: proper localization
                    }
                end
            end
            if context.after then
                card.ability.extra.buffer = 0
            end
        end,
    },
    'placeholder_joker', placeholder_joker = {
        name = "Placeholder Joker",
        subtitle = "TODO: this subtitle",
        text = {
            "{C:green}#1# in #2#{} chance to {C:attention}convert{}",
            "this {C:attention}Joker{} into a {C:purple}random{}",
            "other {C:attention}Joker{} with the same art"
        },
        config = {extra = {odds = 3}},
        pos = { x = 0, y = 0 },
        cost = 3,
        rarity = 1,
        blueprint_compat = false,
        eternal_compat = false,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds}}
        end,
        calculate = function(self, card, context)
            if context.joker_main and (pseudorandom(pseudoseed("placeholder_joker")) < G.GAME.probabilities.normal/card.ability.extra.odds) then
                card:set_ability(G.P_CENTERS[pseudorandom_element(placeholder_jokers, pseudoseed('placeholder_joker'))])
            end
        end,
    },
    'filler_card', filler_card = {
        name = "Filler Card",
        subtitle = "- remember to replace Filler Card",
        text = {
            "This Joker gains {X:chips,C:white} X#1# {} Chips",
            "for each scored card {C:attention}without any{}",
            "Enhancement, Seal, Edition, or Aspect",
            "{C:inactive}(Currently {X:chips,C:white} X#2# {C:inactive} Chips)"
        },
        config = {extra = { Xchips_curr = 1, Xchips = 0.05 }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.Xchips, card.ability.extra.Xchips_curr }}
        end,
        calculate = function(self, card, context)
            if context.individual and not context.repetition and not context.end_of_round and not context.blueprint and (
                context.cardarea == G.play and
                context.other_card.config.center.set == "Default" and
                (not context.other_card.seal) and
                (not context.other_card.edition) and
                (not context.other_card.aspect)
            ) then
                card.ability.extra.Xchips_curr = card.ability.extra.Xchips_curr + card.ability.extra.Xchips
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                }
            end
            if context.joker_main and card.ability.extra.Xchips_curr > 1 then
                return {
                    colour = G.C.CHIPS,
                    xchips = card.ability.extra.Xchips_curr
                }
            end
        end,
    },
    'test_print', test_print = {
        name = "Test Print",
        subtitle = "Within parameters",
        text = {
            "Jokers with the {C:attention}same",
            "{C:attention}art{} as this Joker",
            "give {X:chips,C:white} X#1# {} Chips"
        },
        config = {extra = { Xchips = 1.8 }},
        pos = { x = 0, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.Xchips }}
        end,
        calculate = function(self, card, context)
            if context.other_joker and not context.end_of_round then
                local do_it = false
                for k,v in ipairs(placeholder_jokers) do
                    if context.other_joker.config.center.key == v then do_it = true; break end
                end
                if do_it then
                    return {
                        card = context.blueprint_card or card,
                        colour = G.C.CHIPS,
                        xchips = card.ability.extra.Xchips
                    }
                end
            end
        end,
    },
    'garden', garden = {
        name = "Garden",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Retrigger{} all played",
            "{C:attention}Grass{} and {C:attention}Dirt{} cards",
            "{C:attention}#1#{} additional time#2#"
        },
        config = {extra = {retriggers = 1}},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS['m_thac_grass']
            info_queue[#info_queue+1] = G.P_CENTERS['m_thac_dirt']
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
            return {vars = {card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.play and (context.other_card.config.center.key == "m_thac_grass" or context.other_card.config.center.key == "m_thac_dirt") then
                return {
                    repetitions = card.ability.extra.retriggers,
                    card = card,
                    message = localize('k_again_ex'),
                    colour = G.C.ORANGE,
                }
            end
        end,
    },
    'menagerie', menagerie = {
        name = "The Menagerie",
		subtitle = "Work In Progress!",
        text = {
            "This Joker gains {X:mult,C:white} X#1# {} Mult",
            "if played hand contains",
            "an {C:attention}Animal hand{}",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
        },
        config = {extra = {Xmult_mod = 0.25, Xmult_curr = 1.0}},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'thac_animal_hands', set = 'Other'}
            return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult_curr}}
        end,
        calculate = function(self, card, context)
            if context.before and not context.blueprint and TheAutumnCircus.func.context_check_animal(context) then
                card.ability.extra.Xmult_curr = card.ability.extra.Xmult_curr + card.ability.extra.Xmult_mod
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                }
            end
            if context.joker_main and card.ability.extra.Xmult_curr > 1 then
                return {
                    colour = G.C.MULT,
                    xmult = card.ability.extra.Xmult_curr
                }
            end
        end,
    },
    'clown_posse', clown_posse = {
        name = "Clown Posse",
        text = {
            "This Joker gains {X:mult,C:white} X#1# {}",
            "Mult whenever another",
            "{C:attention}Joker{} is gained",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
        },
        config = {extra = {Xmult_mod = 0.10, Xmult_curr = 1.0}},
        pos = { x = 4, y = 3 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult_curr}}
        end,
        calculate = function(self, card, context)
            if context.amm_added_card and context.other_card.ability.set == "Joker" and not context.from_debuff and not context.blueprint then
                card.ability.extra.Xmult_curr = card.ability.extra.Xmult_curr + card.ability.extra.Xmult_mod
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                }
            end
            if context.joker_main and card.ability.extra.Xmult_curr > 1 then
                return {
                    colour = G.C.MULT,
                    xmult = card.ability.extra.Xmult_curr
                }
            end
        end,
    },
    'stellar_alignment', stellar_alignment = {
        name = "Stellar Alignment",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Retriggers{} each played",
            "{C:attention}Star{} card {C:attention}#1#{} time#2# for",
            "each level of its suit",
            "{C:inactive}(Reminder: Suit levels",
            "{C:inactive}start at lvl.1!)"
        },
        config = {extra = {retriggers = 1}},
        pos = { x = 0, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS['m_thac_star']
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
            return {vars = {card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.play and (context.other_card.config.center.key == "m_thac_star") then
                local ret = card.ability.extra.retriggers
                ret = ret * G.GAME.amm_data.suit_levels[context.other_card.base.suit].level
                return {
                    repetitions = ret,
                    card = card,
                    message = localize('k_again_ex'),
                    colour = G.C.ORANGE,
                }
            end
        end,
        enhancement_gate = "m_thac_star",
    },
    'paint_mixer', paint_mixer = {
        name = "Paint Mixer",
		subtitle = "Work In Progress!",
        text = {
            "If played hand contains",
            "a {C:attention}Spectrum{}, {C:green}randomize{}",
            "the {C:attention}suit{} of each",
            "scoring card"
        },
        config = { extra = {
        }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.before and not context.blueprint and next(context.poker_hands["spectrum_Spectrum"]) then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, #context.scoring_hand do
                            local other_card = context.scoring_hand[i]
                            local SUITS = {}
                            for k,v in ipairs(SMODS.Suit.obj_buffer) do
                                if not SMODS.Suits[v] or not SMODS.Suits[v].in_pool then SUITS[#SUITS+1] = v
                                elseif SMODS.Suits[v].in_pool and SMODS.Suits[v]:in_pool({rank=other_card.base.value}) then
                                    SUITS[#SUITS+1] = v
                                end
                            end
                            other_card:change_suit(pseudorandom_element(SUITS, pseudoseed("paint_mixer")))
                            other_card:juice_up(0.3, 0.3)
                        end
                        return true
                    end}))
                return {
                    message = "Randomized!",
                    colour = G.C.GREEN,
                }
            end
        end,
        load_check = function()
            return next(SMODS.find_mod("SpectrumFramework"))
        end,
    },
    'psychic_double_reacharound', psychic_double_reacharound = {
        name = "Psychic Double Reacharound",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Retrigger{} each {C:attention}Joker{} that {C:attention}copies{}",
            "another {C:attention}Joker{} {C:attention}#1#{} time#2#"
        },
        config = {extra = { retriggers = 2 }},
        pos = { x = 0, y = 0 },
        cost = 10,
        rarity = 3,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
            return {vars = {card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if context.retrigger_joker_check and context.other_card.ability.blueprint_compat_check then
                return {
                    repetitions = card.ability.extra.retriggers,
                    card = card,
                    colour = G.C.ORANGE,
                    message = localize('k_again_ex')
                }
            end
        end,
    },
    'knight_of_heart', knight_of_heart = {
        name = "Knight of Heart",
        subtitle = "Apotheotic Vessel",
        text = {
            "Played cards are {C:attention}converted{} to {C:hearts}Hearts{}",
            "and this Joker gains the following",
            "depending on the card's {C:attention}original suit{}:",
            "{C:spades}Spades{}: {C:chips}+#1#{} Chips {C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
            "{C:clubs}Clubs{}: {C:mult}+#3#{} Mult {C:inactive}(Currently {C:mult}+#4#{C:inactive} Mult)",
            "{C:diamonds}Diamonds{}: {C:money}+$#5#{} at end of round {C:inactive}(Currently {C:money}$#6#{C:inactive})",
            "{C:attention}Other suits{}: {C:mult}+{X:mult,C:white} X#7# {} Mult {C:inactive}(Currently {X:mult,C:white} X#8# {C:inactive} Mult)"
        },
		boxes = { 3, 1, 1, 1, 1, },
        config = {extra = {
            chips = 10,
            curr_chips = 0,
            mult = 3,
            curr_mult = 0,
            money = 0.5,
            curr_money = 0,
            Xmult = 0.1,
            curr_Xmult = 1.0,
        }},
        pos = { x = 4, y = 1 },
        soul_pos = { x = 4, y = 2 },
        cost = 20,
        rarity = 4,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = {
                card.ability.extra.chips,
                card.ability.extra.curr_chips,
                card.ability.extra.mult,
                card.ability.extra.curr_mult,
                card.ability.extra.money,
                math.floor(card.ability.extra.curr_money),
                card.ability.extra.Xmult,
                card.ability.extra.curr_Xmult
            }}
        end,
        calculate = function(self, card, context)
            local function append_extra(ret, append)
                if ret.extra then return append_extra(ret.extra, append) end
                ret.extra = append
                return ret
            end
            local ret = {}
            if context.joker_main then
                if card.ability.extra.curr_chips > 0 then
                    append_extra(ret, {chips = card.ability.extra.curr_chips})
                end
                if card.ability.extra.curr_mult > 0 then
                    append_extra(ret, {mult = card.ability.extra.curr_mult})
                end
                if card.ability.extra.curr_Xmult > 1 then
                    append_extra(ret, {Xmult = card.ability.extra.curr_Xmult})
                end
            end
            if context.before and not context.blueprint then
                local state = 0
                for k, v in ipairs(context.scoring_hand) do
                    if v.base.suit == "Hearts" or SMODS.has_no_suit(v) then
                    elseif v.base.suit == "Spades" then
                        card.ability.extra.curr_chips = card.ability.extra.curr_chips + card.ability.extra.chips
                        v:change_suit("Hearts")
                        state = 1
                    elseif v.base.suit == "Clubs" then
                        card.ability.extra.curr_mult = card.ability.extra.curr_mult + card.ability.extra.mult
                        v:change_suit("Hearts")
                        state = 1
                    elseif v.base.suit == "Diamonds" then
                        card.ability.extra.curr_money = card.ability.extra.curr_money + card.ability.extra.money
                        v:change_suit("Hearts")
                        state = 1
                    else
                        card.ability.extra.curr_Xmult = card.ability.extra.curr_Xmult + card.ability.extra.Xmult
                        v:change_suit("Hearts")
                        state = 1
                    end
                end
                if state == 1 then
                    append_extra(ret, {
                        message = "Hearts",
                        colour = G.C.SUITS.Hearts,
                        card = card,
                        func = function()
                            for key,val in ipairs(context.scoring_hand) do
                                val:juice_up(0.3, 0.5)
                            end
                        end,
                    })
                end
            end
            if ret.extra then return ret.extra end
        end,
        calc_dollar_bonus = function(self, card)
            if card.ability.extra.curr_money >= 1 then return math.floor(card.ability.extra.curr_money) end
        end,
    },
    'witch_of_mind', witch_of_mind = {
        name = "Witch of Mind",
        subtitle = "Apotheotic Vessel",
        text = {
            "Rescore each","{C:attention}scoring Joker{}",
        },
        config = {extra = {
        }},
        pos = { x = 5, y = 1 },
        soul_pos = { x = 5, y = 2 },
        cost = 20,
        rarity = 4,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['what_are_you_wearing'] = {
                name = "what are you wearing",
                text = {
                    "{C:knightofheart}what the hell are you wearing???",
                    "{C:witchofmind}uhhhh witch of mind outfit duh",
                    "{C:knightofheart}no what the hell's with the face paint",
                    "{C:knightofheart}also have you finally figured your classpect out",
                    "{C:witchofmind}i thought it was fun",
                    "{C:witchofmind}and yea :3",
                    "{C:witchofmind}i think",
                    "{C:knightofheart}good grief you are insufferable",
                    "{C:witchofmind}thanks you too",
                    "{C:money}Do you two ever have conversations about",
                    "{C:money}anything relevant without my guidance?",
                    "{C:witchofmind}do we with it?",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 'what_are_you_wearing', set = 'Other'}
            end
        end,
        calculate = function(self, card, context)
            if context.joker_main and not context.retrigger_joker_check and not context.retrigger_joker and not context.witch_of_mind_repeat then
                local ret = {}
                context.witch_of_mind_repeat = true
                ret = SMODS.calculate_context(context)
                context.witch_of_mind_repeat = false
                return ret
            end
        end,
    },
    'lord_of_void', lord_of_void = {
        name = "Lord of Void",
        subtitle = "Apotheotic Vessel",
        text = {
            "{X:mult,C:white} X#1# {} Mult for each",
            "{C:attention}Voucher{} redeemed this run",
            "{C:attention}Retrigger{} this Joker once",
            "for each empty {C:attention}consumable slot{}",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult, {C:attention}#3#{C:inactive} retriggers)"
        },
		boxes = { 2, 2, 1 },
        config = {extra = {
            Xmult = 0.13,
        }},
        pos = { x = 6, y = 1 },
        soul_pos = { x = 6, y = 2 },
        cost = 20,
        rarity = 4,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = {
                card.ability.extra.Xmult,
                1 + card.ability.extra.Xmult * (G.vouchers and #G.vouchers.cards or 0), -- thanks voucher calc
                (G.consumeables and G.consumeables.config.card_limit - #G.consumeables.cards or 2)
            }}
        end,
        calculate = function(self, card, context)
            local vars = {
                card.ability.extra.Xmult,
                1 + card.ability.extra.Xmult * (G.vouchers and #G.vouchers.cards or 0), -- thanks voucher calc
                G.consumeables.config.card_limit - #G.consumeables.cards
            }
            if context.joker_main then
                if vars[2] > 1 then
                    return {Xmult = vars[2]}
                end
            end
            if context.retrigger_joker_check and context.other_card == card and vars[3] > 0 then
                return {
                    repetitions = vars[3],
                    card = card,
                    colour = G.C.ORANGE,
                    message = localize('k_again_ex')
                }
            end
        end,
    },
    'funny_fertilizer', funny_fertilizer = {
        name = "Funny Fertilizer",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Enhances{} up to {C:attention}#1#{}",
            "unenhanced card#2# in your full",
            "deck to {C:attention}Grass{} cards at",
            "the end of each {C:attention}Boss Blind",
        },
        config = {extra = { enhancements = 3 }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            local blah = ""
            if card.ability.extra.enhancements > 1 then blah = "s" end
            info_queue[#info_queue+1] = G.P_CENTERS['m_thac_grass']
            return {vars = {card.ability.extra.enhancements, blah}}
        end,
        calculate = function(self, card, context)
            if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind and G.GAME.blind.boss then
                local enhanced_cards = {}
                local used_tarot = copier or self
                local temp_deck = {}
                for k, v in ipairs(G.playing_cards) do 
                    if v.config.center.set == "Default" then
                        temp_deck[#temp_deck+1] = v
                    end
                end
                table.sort(temp_deck, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
                pseudoshuffle(temp_deck, pseudoseed('funny_fertilizer'))
    
                for i = 1, card.ability.extra.enhancements do enhanced_cards[#enhanced_cards+1] = temp_deck[i] end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function() 
                        for i=#enhanced_cards, 1, -1 do
                            local card = enhanced_cards[i]
                            card:set_ability(G.P_CENTERS.m_thac_grass)
                        end
                        return true end }))
                return {
                    card = card,
                    colour = G.C.ORANGE,
                    message = "Grass"
                }
            end
        end,
    },
    'highest_number', highest_number = {
        name = "The Highest Number",
        text = {
            "Played {C:attention}9s{} reduce {C:attention}Blind{}",
            "requirement by {C:attention}#1#%{}",
            "This Joker {C:attention}improves{} at the",
            "end of each {C:attention}Boss Blind{}"
        },
		boxes = { 2, 2, },
        config = {extra = { 
            reduction = 0.09,
            level_factor = 0.413,
            level_factor_reduction = 0.612,
         }},
        pos = { x = 5, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['from_me_to_you'] = {
                name = "you want me to stop? hahahaha",
                text = {
                    "{C:autumn}Mindless drone, driven by pursuit",
                    "{C:autumn}of the highest possible number;",
                    "{C:autumn}You know how this story ends,",
                    "{C:autumn}but you continue onwards towards a",
                        "{C:dark_edition}Dark Apotheosis.",
                    "{C:autumn}What is it you hope to accomplish, child?{}",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 'from_me_to_you', set = 'Other'}
            end
            return {vars = {card.ability.extra.reduction * 100}}
        end,
        calculate = function(self, card, context)
            if context.individual and not context.repetition and context.cardarea == G.play and not context.end_of_round and context.other_card:get_id() == 9 and not SMODS.has_no_rank(context.other_card) then
				return {
					extra = {focus = card,
						message = localize{type = 'variable', key = 'a_blind_minus_percent',
							vars = {card.ability.extra.reduction*100}}, },
					card = card,
                    func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            AMM.mod_blind(1-card.ability.extra.reduction, nil, true)
                            return true
                        end)}))
					end,
				}
            end
            if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss and context.main_eval and not context.blueprint then
                card.ability.extra.reduction = card.ability.extra.reduction * (1+card.ability.extra.level_factor)
                card.ability.extra.reduction = math.floor(card.ability.extra.reduction*100)/100
                card.ability.extra.level_factor = card.ability.extra.level_factor * card.ability.extra.level_factor_reduction
                return {
                    card = card,
                    focus = card,
                    message = "LV Up",
                    colour = G.C.RED
                }
            end
        end,
    },
    'daggerkind', daggerkind = {
        name = "Daggerkind Specibus",
		subtitle = "Work In Progress!",
        text = {
            "When Blind is selected," 
        },
        config = {extra = { 
            
         }},
        pos = { x = 6, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['s_chekhovs_knife'] = {
                name = "[S] Chekhov's Knife",
                text = {
                    "{C:knightofheart}haha!",
                    "{C:knightofheart}gotcha =)",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_chekhovs_knife', set = 'Other'}
            end
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            
        end,
        yes_pool_flag = "no",
    },
    'bladekind', bladekind = {
        name = "Bladekind Specibus",
		subtitle = "Work In Progress!",
        text = {
            "e"
        },
        config = {extra = { 
            
         }},
        pos = { x = 8, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['knight_retrieve_bladekind'] = {
                name = "Knight: Retrieve BLADEKIND specibus",
                text = {
                    "{C:knightofheart}i dont make the rules",
                    "{C:knightofheart}if you see a strife specibus",
                    "{C:knightofheart}that is unowned",
                    "{C:knightofheart}you now have another strife specibus",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 'knight_retrieve_bladekind', set = 'Other'}
            end
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            
        end,
        yes_pool_flag = "no",
    },
    'pokerkind', pokerkind = {
        name = "Pokerkind Specibus",
		subtitle = "Work In Progress!",
        text = {
            "e"
        },
        config = {extra = { 
            
         }},
        pos = { x = 9, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['witch_examine_pokerkind'] = {
                name = "Witch: Examine POKERKIND specibus",
                text = {
                    "{C:witchofmind}i guess you can just put any cards in this thing",
                    "{C:witchofmind}maybe someone out there plays poker with credit cards",
                    "{C:witchofmind}all i need to know is i can stuff this thing full of cards",
                    "{C:witchofmind}pretty useful if lacking in combat application"
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 'witch_examine_pokerkind', set = 'Other'}
            end
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            
        end,
        yes_pool_flag = "no",
    },
    'combat_capability', combat_capability = {
        name = "Combat Capability",
		subtitle = "Work In Progress!",
        text = {
            "If played hand contains no enhancements,",
            "each played card gets a random enhancement",
        },
        config = {extra = { 
            
         }},
        pos = { x = 7, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['s_lord_provide_an_example'] = {
                name = "[S] Lord: Provide an example",
                text = {
                    "{C:money}You are correct:",
                    "{C:money}I am unarmed.",
                    "{C:lordofvoid}However,",
                    "{C:money}You'll find that's not",
                    "{C:money}quite as relevant as you",
                    "{C:money}hoped it would be.",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_lord_provide_an_example', set = 'Other'}
            end
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            
        end,
        yes_pool_flag = "no",
    },
    'pseudoscratch', pseudoscratch = {
        name = "Pseudo-Scratch Gambit",
		subtitle = "Work In Progress!",
        text = {
            "Prevent death, then this Joker",
            "becomes a random Joker from among:",
            "Knight of Heart",
            "Witch of Mind",
            "Lord of Void",
        },
		boxes = { 2, 3, },
        config = {},
        pos = { x = 7, y = 1 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['s_ascend'] = {
                name = "[S] Ascend",
                text = {
                    "{C:money}This is it. Everything is in place.",
                    "{C:money}Use the slab, and the next phase will begin.",
                    "{C:clubs}looking forward to you shutting up",
                    "{C:hearts}right so, this will displace us temporally",
                    "{C:hearts}each of us will be in our own timeline",
                    "{C:hearts}this is a stupid fucking gamble",
                    "{C:hearts}assuming this even works,",
                    "{C:hearts}no idea which timeline won't be doomed",
                    "{C:hearts}maybe they all will fuck if i know",
                    "{C:money}Call it 'triple-blind', then.",
                    "{C:clubs}please shut up",
                    "{X:hearts,C:hearts}??????{C:clubs} just hurry up and use the slab",
                    "{C:money}Be not afraid. Have faith. Et cetera.",
                    "{C:money}I will aid you upon your respective ascensions.",
                    "{C:hearts}you better not be full of shit, {X:money,C:money}????"
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_ascend', set = 'Other'}
            end
            info_queue[#info_queue+1] = G.P_CENTERS['j_thac_knight_of_heart']
            info_queue[#info_queue+1] = G.P_CENTERS['j_thac_witch_of_mind']
            info_queue[#info_queue+1] = G.P_CENTERS['j_thac_lord_of_void']
            return {vars = { }}
        end,
        calculate = function(self, card, context)
        end,
        yes_pool_flag = "no",
    },
    'astront', astront = {
        name = "Astron't Joker",
		subtitle = "Work In Progress!",
        text = {
            "{C:green}#1# in #2#{} chance to",
            "upgrade level of",
            "{C:attention}suit{} of {C:attention}first{} card",
            "used in scoring"
        },
        config = { extra = {
            odds = 4,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }}
        end,
        calculate = function(self, card, context)
            if context.before and pseudorandom('astront') < G.GAME.probabilities.normal / card.ability.extra.odds then
                if not SMODS.has_no_suit(context.scoring_hand[1]) then
                    return {
                        func = function()
                            AMM.level_up_suit(context.blueprint_card or card, context.scoring_hand[1].base.suit)
                            update_hand_text({delay = 0}, {handname = localize(context.scoring_name, "poker_hands"),chips = hand_chips, mult = mult, level = nil })
                        end,
                        card = card,
                        message = localize('k_level_up_ex')
                    }
                end
            end
        end,
    },
    'torrential', torrential = {
        name = "Torrential Joker",
		subtitle = "Work In Progress!",
        text = {
            "If discarded hand",
            "contains a {C:attention}Flush{},",
            "upgrade level of {C:attention}suit{}",
            "of {C:attention}leftmost{} discarded card"
        },
        config = { extra = {
        }},
        pos = { x = 0, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
            }}
        end,
        calculate = function(self, card, context)
            if context.pre_discard then
                local text,disp_text,poker_hands = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if next(poker_hands['Flush']) then
                    return {
                        func = function()
                            AMM.level_up_suit(context.blueprint_card or card, G.hand.highlighted[1].base.suit)
                            update_hand_text({delay = 0}, {handname = nil, chips =  nil, mult = nil, level = nil })
                        end,
                        card = card,
                        message = localize('k_level_up_ex')
                    }
                end
            end
        end,
    },
    'landlord', landlord = {
        name = "Landlord",
		subtitle = "Work In Progress!",
        text = {
            "Earn {C:money}$#1#{} if discarded hand",
            "contains a {C:attention}Full House{}",
        },
        config = { extra = {
            money = 8,
        }},
        pos = { x = 0, y = 0 },
        cost = 7,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.money
            }}
        end,
        calculate = function(self, card, context)
            if context.pre_discard then
                local text,disp_text,poker_hands = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if next(poker_hands['Full House']) then
                    ease_dollars(card.ability.extra.money)
                    return {
                        message = localize('$')..card.ability.extra.money,
                        colour = G.C.MONEY,
                        card = card
                    }
                end
            end
        end,
    },
    'court_of_jokers', court_of_jokers = {
        name = "Court of Jokers",
		subtitle = "Work In Progress!",
        text = {
            "If discarded hand contains",
            "a {C:attention}Blaze{}, each discarded",
            "card permanently gains {C:chips}+#1#{}",
            "chips when scored"
        },
        config = { extra = {
            chips = 10,
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.chips
            }}
        end,
        calculate = function(self, card, context)
            if context.pre_discard then
                local text,disp_text,poker_hands = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if next(poker_hands['thac_blaze']) then
                    for k,v in ipairs(G.hand.highlighted) do
                        v.ability.perma_bonus = v.ability.perma_bonus + card.ability.extra.chips
                        v:juice_up(0.3, 0.3)
                    end
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end,
    },
    'lost_sock', lost_sock = {
        name = "Lost Sock",
		subtitle = "Work In Progress!",
        text = {
            "This Joker gains {C:chips}+#1#{}",
            "Chips when {C:attention}played hand{}",
            "contains {C:attention}exactly one{}",
            "{C:attention}unscored{} card",
            "{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)",
        },
        config = { extra = {
            chips_curr = 0,
            chips = 13
        }},
        pos = { x = 0, y = 0 },
        cost = 3,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.chips,
                card.ability.extra.chips_curr
            }}
        end,
        calculate = function(self, card, context)
            if context.before and not context.blueprint then
                if #G.play.cards == #context.scoring_hand + 1 then
                    card.ability.extra.chips_curr = card.ability.extra.chips_curr + card.ability.extra.chips
                    return {
                        card = card,
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                    }
                end
            end
            if context.joker_main and card.ability.extra.chips_curr > 1 then
                return {
                    colour = G.C.CHIPS,
                    chips = card.ability.extra.chips_curr
                }
            end
        end,
    },
    'the_csi', the_csi = {
        name = "The C.S.I.",
		subtitle = "Comedy Scene Investigators",
        text = {
            "{C:chips}+#1#{} Chips for",
            "each {C:attention}face card{} in",
            "your {C:attention}graveyard{}",
            "{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)",
        },
        config = { extra = {
            chips = 10
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
            return {vars = {
                card.ability.extra.chips,
                card.ability.extra.chips * AMM.api.graveyard.count_faces()
            }}
        end,
        calculate = function(self, card, context)
            if context.joker_main and #G.graveyard > 1 then
                local faces = AMM.api.graveyard.count_faces()
                if faces == 0 then return end
                return {
                    colour = G.C.CHIPS,
                    chips = card.ability.extra.chips * faces
                }
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_faces() > 0
        end,
    },
    'junk_collector', junk_collector = {
        name = "Junk Collector",
		subtitle = "Work In Progress!",
        text = {
            "Create an {C:oddity}Oddity{} when","{C:attention}Blind{} is selected",
            "{C:inactive}(Must have room)"
        },
        config = { extra = {
            
        }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
            }}
        end,
        calculate = function(self, card, context)
            if context.setting_blind and not (context.blueprint_card or card).getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                local card = create_card('Oddity',G.consumeables, nil, nil, nil, nil, nil, 'junk_collector')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end}))   
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_oddity'), colour = G.C.PURPLE})                       
                        return true
                    end)}))
            end
        end,
    },
    'exorcist', exorcist = {
        name = "Exorcist",
		subtitle = "Work In Progress!",
        text = {
            "When {C:attention}Blind{} is selected, remove",
            "{C:attention}#1#{} random card#2# from your",
            "{C:attention}graveyard{} and this Joker gains ",
            "{X:mult,C:white}X#3#{} Mult for each removed",
            "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
        },
        config = { extra = {
            targets = 2,
            Xmult_mod = 0.25,
            Xmult_curr = 1.0,
        }},
        pos = { x = 0, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
            return {vars = {
                card.ability.extra.targets == 1 and "a" or card.ability.extra.targets,
                card.ability.extra.targets == 1 and "" or "s",
                card.ability.extra.Xmult_mod,
                card.ability.extra.Xmult_curr,
            }}
        end,
        calculate = function(self, card, context)
            if context.setting_blind and not context.blueprint and not card.getting_sliced and #G.graveyard > 1 then
                local temp_gy = AMM.api.graveyard.get_cards()
                local success = 0
                pseudoshuffle(temp_gy, pseudoseed("exorcism"))
                if temp_gy[2] then
                    temp_gy[2]:remove_from_game()
                    success = success + 1
                end
                if temp_gy[1] then
                    temp_gy[1]:remove_from_game()
                    success = success + 1
                end
                card.ability.extra.Xmult_curr = card.ability.extra.Xmult_curr + (card.ability.extra.Xmult_mod * success)
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                }
            end
            if context.joker_main and card.ability.extra.Xmult_curr > 1 then
                return {
                    colour = G.C.MULT,
                    xmult = card.ability.extra.Xmult_curr
                }
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'gallows_humor', gallows_humor = {
        name = "Gallows Humor",
		subtitle = "Work In Progress!",
        text = {
            "{X:mult,C:white}X#1#{} Mult if there",
            "are {C:attention}#2#{} or more cards",
            "in your {C:attention}graveyard{}",
            "{C:inactive}(Currently: {C:attention}#3#{C:inactive} cards)",
        },
        config = { extra = {
            targets = 15,
            Xmult = 3,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
            return {vars = {
                card.ability.extra.Xmult,
                card.ability.extra.targets,
                AMM.api.graveyard.count_cards()
            }}
        end,
        calculate = function(self, card, context)
            if context.joker_main and AMM.api.graveyard.count_cards() > card.ability.extra.targets then
                return {
                    colour = G.C.MULT,
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'common_ground', common_ground = {
        name = "Common Ground",
		subtitle = "We all rot in the same soil",
        text = {
            "When round begins, draw #1#",
            "additional card#2# for each",
            "{C:attention}different rank{} among",
            "cards in your {C:attention}graveyard{}",
            "{C:inactive}(Currently: {C:attention}#3#{C:inactive} ranks)"
        },
        config = { extra = {
            cards = 1,
        }},
        pos = { x = 5, y = 3 },
        cost = 5,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
            return {vars = {
                math.floor(card.ability.extra.cards) == 1 and "an" or math.floor(card.ability.extra.cards),
                math.floor(card.ability.extra.cards) ~= 1 and "s" or "",
                AMM.api.graveyard.count_different_ranks()
            }}
        end,
        calculate = function(self, card, context)
            if context.first_hand_drawn then
                local gy_ranks = AMM.api.graveyard.count_different_ranks()
                if gy_ranks == 0 then return end
                local cards = math.floor(card.ability.extra.cards) * gy_ranks
                TheAutumnCircus.func.force_draw_cards(cards)
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'tombstone', tombstone = {
        name = "Tombstone",
		subtitle = "Work In Progress!",
        text = {
            "{X:chips,C:white}X#1#{} Chips for each",
            "{C:attention}Stone Card{} in your",
            "{C:attention}graveyard{}",
            "{C:inactive}(Currently: {X:chips,C:white}X#2#{C:inactive} Chips)",
        },
        config = { extra = {
            Xchips = 0.4,
        }},
        pos = { x = 0, y = 0 },
        cost = 7,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
            info_queue[#info_queue+1] = G.P_CENTERS.m_stone
            local gy_stones = AMM.api.graveyard.count_center(G.P_CENTERS.m_stone)
            return {vars = {
                card.ability.extra.Xchips,
                1 + (card.ability.extra.Xchips * gy_stones)
            }}
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                local gy_stones = AMM.api.graveyard.count_center(G.P_CENTERS.m_stone)
                if gy_stones > 0 then
                    return {
                        colour = G.C.CHIPS,
                        xchips = 1 + (card.ability.extra.Xchips * gy_stones)
                    }
                end
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_center(G.P_CENTERS.m_stone) > 0
        end,
    },
    'gem_joker', gem_joker = {
        name = "Gem Joker",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Jewel Cards{} held in",
            "hand give {X:chips,C:white} X#1# {} Chips",
        },
        config = { extra = {
            Xchips = 1.5,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS.m_thac_jewel
            return {vars = {
                card.ability.extra.Xchips,
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.hand and SMODS.has_enhancement(context.other_card, "m_thac_jewel")
                and not context.end_of_round then
                return {
                    card = context.other_card,
                    xchips = card.ability.extra.Xchips
                }
            end
        end,
        enhancement_gate = "m_thac_jewel",
    },
    'discarded_vessel', discarded_vessel = {
        name = "Discarded Vessel",
		subtitle = "* It bears the curse of AMBITION",
        text = {
            "{C:green}#1# in #2#{} chance to add",
            "a random {C:red}Aspect{} to each",
            "discarded unaspected card",
        },
        config = { extra = {
            odds = 12,
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['s_lord_retrieve_body'] = {
                name = "[S] Lord: Retrieve Body",
                text = {
                    "{C:money}I am the Lord of Void.",
                    "{C:money}All things discarded...",
                    "{C:money}Cast into the void...",
                    "{C:money}They fall into my domain.",
                    "{C:money}They are mine to claim.",
                    "{C:money}Besides...",
                    "{X:witchofmind,C:lordofvoid}YOU{C:lordofvoid}...",
                    "{C:lordofvoid}HA HA HA HA HA HA HA HA HA!",
                    "{X:witchofmind,C:lordofvoid}YOU{C:lordofvoid} CREATED ONE WITH {X:money,C:lordofvoid}MY{C:lordofvoid} {X:money,C:lordofvoid}NAME{C:lordofvoid} ON IT.",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_lord_retrieve_body', set = 'Other'}
            end
            return {vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
            }}
        end,
        calculate = function(self, card, context)
            if context.discard and context.other_card.aspect == nil and pseudorandom(pseudoseed("discarded_vessel")) < G.GAME.probabilities.normal / card.ability.extra.odds then
                local keyset={}
                local n=0
                for k,v in pairs(AMM.Aspects) do
                    n=n+1
                    keyset[n]=k
                end
                local god_tier = pseudorandom_element(keyset, pseudoseed("god_tier"))
                context.other_card:set_aspect(god_tier)
            end
        end,
    },
    'afterlife_archive', afterlife_archive = {
        name = "Afterlife Archive",
		subtitle = "It's important to keep records",
        text = {
            "Earn {C:money}$#1#{} for each {C:attention}4{} or {C:attention}9{}",
            "in your {C:attention}graveyard{}",
            "at end of round",
            "{C:inactive}(Currently: {C:money}$#2#{C:inactive})",
        },
        config = { extra = {
            money = 1
        }},
        pos = { x = 6, y = 3 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            local gy_4 = AMM.api.graveyard.count_rank("4")
            local gy_9 = AMM.api.graveyard.count_rank("9")
            return {vars = {
                math.floor(card.ability.extra.money),
                math.floor(card.ability.extra.money) * (gy_4 + gy_9)
            }}
        end,
        calc_dollar_bonus = function(self, card)
            local gy_4 = AMM.api.graveyard.count_rank("4")
            local gy_9 = AMM.api.graveyard.count_rank("9")
            return math.floor(card.ability.extra.money) * (gy_4 + gy_9)
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_rank("4") > 0 or AMM.api.graveyard.count_rank("9") > 0
        end,
    },
    'jokermancer', jokermancer = {
        name = "Jokermancer",
		subtitle = "Waste not, want not!",
        text = {
            "Each scored card gives",
            "{C:mult}+#1#{} Mult for each card",
            "in your {C:attention}graveyard{} that",
            "shares a {C:attention}suit{} or {C:attention}rank{} with it"
        },
        config = { extra = {
            mult = 1
        }},
        pos = { x = 7, y = 2 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = {card.ability.extra.mult}}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and not context.end_of_round then
                local no_suit = SMODS.has_no_suit(context.other_card)
                local no_rank = SMODS.has_no_rank(context.other_card)
                local gy_matches = 0
                local suit_check = function(v)
                    for _,k in ipairs(SMODS.Suit.obj_buffer) do
                        if v:is_suit(k) and context.other_card:is_suit(k) then return true end
                    end
                    return false
                end
                local rank_check = function(v)
                    if v.base.value == context.other_card.base.value and not SMODS.has_no_rank(v) then return true else return false end
                end
                if no_suit then
                    if no_rank then
                        return
                    else
                        gy_matches = AMM.api.graveyard.filter_count(rank_check)
                    end
                else
                    if no_rank then
                        gy_matches = AMM.api.graveyard.filter_count(suit_check)
                    else
                        gy_matches = AMM.api.graveyard.filter_count(function(v) return rank_check(v) or suit_check(v) end)
                    end
                end
                if gy_matches == 0 then return end
                return { card = context.other_card, mult = gy_matches * card.ability.extra.mult }
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 5
        end,
    },
    'gaudy_bracelet', gaudy_bracelet = {
        name = "Gaudy Bracelet",
		subtitle = "Work In Progress!",
        text = {
            "This Joker gains {C:chips}+#1#{}",
            "Chips when a played",
            "{C:attention}Jewel Card{} scores",
            "{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)",
        },
        config = { extra = {
            chips_curr = 0,
            chips = 11
        }},
        pos = { x = 0, y = 0 },
        cost = 3,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.chips,
                card.ability.extra.chips_curr
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_thac_jewel") and not context.end_of_round and not context.blueprint then
                card.ability.extra.chips_curr = card.ability.extra.chips_curr + card.ability.extra.chips
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                }
            end
            if context.joker_main and card.ability.extra.chips_curr > 1 then
                return {
                    colour = G.C.CHIPS,
                    chips = card.ability.extra.chips_curr
                }
            end
        end,
        enhancement_gate = "m_thac_jewel",
    },
    'twisted_mind', twisted_mind = {
        name = "Twisted Mind",
		subtitle = "* do you still subscribe to LOGIC?",
        text = {
            "Cards in your {C:attention}graveyard",
            "are scored as if they",
            "were held in your hand",
        },
        config = { extra = {
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
        rarity = 3,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = { }}
        end,
        -- effect handled in a lovely patch
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'joke_book_of_the_dead', joke_book_of_the_dead = {
        name = "Joke Book of the Dead",
		subtitle = "It's missing a lot of pages...",
        text = {
            "When {C:attention}Blind{} is selected, gain",
            "{C:red}+#1#{} Discard#2# for every {C:attention}#3#{} cards",
            "in your {C:attention}graveyard{}",
            "{C:inactive}(Currently: {C:red}+#4#{C:inactive} Discards)",
        },
        config = { extra = {
            discards = 1,
            targets = 4,
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            local blah = ""
            if math.floor(card.ability.extra.discards) ~= 1 then blah = "s" end
            return {vars = {
                math.floor(card.ability.extra.discards),
                blah,
                math.floor(card.ability.extra.targets),
                math.floor(card.ability.extra.discards) * math.floor(AMM.api.graveyard.count_cards() / math.floor(card.ability.extra.targets)),
            }}
        end,
        calculate = function(self, card, context)
            if context.setting_blind and not card.getting_sliced and not (context.blueprint_card or card).getting_sliced then
                local gy_count = AMM.api.graveyard.count_cards()
                local tally = math.floor(gy_count / math.floor(card.ability.extra.targets))
                local d_rate = math.floor(card.ability.extra.discards)
                if tally == 0 or d_rate == 0 then return end
                ease_discard(d_rate * tally)
                return {
                    message = "Hee Hee Hee",
                    colour = G.C.RED,
                }
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'gravedigger', gravedigger = {
        name = "Gravedigger",
		subtitle = "Somebody's gotta do it",
        text = {
            "Earn {C:money}$#1#{} when a",
            "card is put into",
            "your {C:attention}graveyard{}",
        },
        config = { extra = {
            money = 2,
        }},
        pos = { x = 7, y = 3 },
        cost = 5,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = {
                math.floor(card.ability.extra.money),
            }}
        end,
        calculate = function(self, card, context)
            if context.amm_buried_card then
                ease_dollars(math.floor(card.ability.extra.money))
                return {
                    message = "$"..math.floor(card.ability.extra.money),
                    colour = G.C.MONEY,
                }
            end
        end,
    },
    'matchbook', matchbook = {
        name = "Matchbook",
		subtitle = "Work In Progress!",
        text = {
            "{X:mult,C:white}X#1#{} Mult",
            "The first {C:red}#2#{} card#3#",
            "played each {C:attention}Round{} are",
            "{C:red,s:1.1,E:1}destroyed{}",
            "{C:inactive}(Remaining: {C:red}#4#{C:inactive} card#5#)",
        },
		boxes = { 1, 4 },
        config = { extra = {
            targets = 3,
            targets_curr = 3,
            Xmult = 3
        }},
        pos = { x = 0, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            --info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            local blah = ""
            if math.floor(card.ability.extra.targets) ~= 1 then blah = "s" end
            local blah2 = ""
            if math.floor(card.ability.extra.targets_curr) ~= 1 then blah2 = "s" end
            return {vars = {
                card.ability.extra.Xmult,
                math.floor(card.ability.extra.targets),
                blah,
                math.floor(card.ability.extra.targets_curr),
                blah2,
            }}
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
            if not context.blueprint then
                if context.setting_blind then card.ability.extra.targets_curr = math.floor(card.ability.extra.targets) end
                if context.destroying_card and card.ability.extra.targets_curr > 0 then
                    card.ability.extra.targets_curr = card.ability.extra.targets_curr - 1
                    return true
                end
            end
        end,
    },
    'dark_hallway', dark_hallway = {
        name = "Dark Hallway",
		subtitle = "Twilight shines through...",
        text = {
            "When {C:attention}Blind{} is selected,",
            "{C:red,E:1}destroy#1#{} #2# random card#3#",
            "in your {C:attention}full deck{}"
        },
        config = { extra = {
            targets = 2,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            --info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            local blah = ""
            if math.floor(card.ability.extra.targets) ~= 1 then blah = "s" end
            return {vars = {
                blah,
                math.floor(card.ability.extra.targets) == 1 and "a" or math.floor(card.ability.extra.targets),
                blah,
            }}
        end,
        calculate = function(self, card, context)
            if context.setting_blind then
                local temp_deck = {}
                for k,v in ipairs(G.playing_cards) do temp_deck[#temp_deck+1] = v end
                pseudoshuffle(temp_deck, pseudoseed("dark_hallway"))
                for i=#temp_deck,#temp_deck-math.floor(card.ability.extra.targets-1),-1 do
                    temp_deck[i]:start_dissolve()
                end
                return true
            end
        end,
    },
    'triplicate_soul', triplicate_soul = {
        name = "Triplicate Soul",
		subtitle = "my fate is indeterminate...",
        text = {
            "Create {C:attention}#1#{} extra cop#2#",
            "of each card put",
            "into your {C:attention}graveyard{}",
            "{C:inactive}(Copies are created",
            "{C:inactive}in your graveyard)",
        },
        config = { extra = {
            cards = 2,
        }},
        pos = { x = 8, y = 1 },
        cost = 10,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        -- "Ternary System"
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = {
                math.floor(card.ability.extra.cards),
                math.floor(card.ability.extra.cards) == 1 and "y" or "ies",
            }}
        end,
        calculate = function(self, card, context)
            if context.amm_buried_card then
                for i=1,math.floor(card.ability.extra.cards) do
                    local _card = copy_card(context.other_card, nil, nil, G.playing_card)
                    G.graveyard_area:emplace(_card)
                    table.insert(G.graveyard, _card)
                    _card.playing_card = #G.graveyard
                    _card.graveyard = true
                end
                return {
                    message = localize("k_copied_ex"),
                    colour = G.C.BLUE,
                }
            end
        end,
    },
    'grasp_of_emptiness', grasp_of_emptiness = {
        name = "Grasp of Emptiness",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Unscored{} played cards","give {X:mult,C:white}X#1#{} Mult",
        },
        config = { extra = {
            Xmult = 1.5,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.Xmult
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
    },
    'shutin', shutin = {
        name = "Shut-In",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Unscored{} played cards",
            "permanently gain",
            "{C:mult}+#1#{} Mult when scored",
        },
        config = { extra = {
            mult = 5,
        }},
        pos = { x = 0, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.mult
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
                return {
                    extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
                    colour = G.C.MULT,
                    card = card,
                }
            end
        end,
    },
    'ace_in_the_hole', ace_in_the_hole = {
        name = "Ace in the Hole",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Unscored{} played {C:attention}Aces{}",
            "earn {C:money}$#1#{} and are {C:red,E:1}destroyed",
        },
        config = { extra = {
            money = 5,
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.money
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round and context.other_card:get_id() == 14 then
                ease_dollars(card.ability.extra.money)
                return {
                    extra = {
                        message = localize('$')..card.ability.extra.money,
                        colour = G.C.MONEY
                    },
                    card = card,
                    colour = G.C.MONEY
                }
            end
            if context.destroying_card and context.cardarea == "unscored" and context.destroying_card:get_id() == 14 then
                return true
            end
        end,
    },
    'topple_the_titans', topple_the_titans = {
        name = "Topple the Titans",
		subtitle = "Work In Progress!",
        text = {
            "If scored Chips value is at least",
            "{X:attention,C:white}#1#X{} the Mult value, reduce",
            "{C:attention}Blind{} requirement by {C:attention}#2#%{}",
        },
        config = { extra = {
            threshold = 100,
            reduction = 0.20,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        process_loc_text = function(self)
            G.localization.descriptions.Other['s_lord_witness_victory'] = {
                name = "[S] Lord: Witness Victory",
                text = {
                    "{C:lordofvoid}A future that need not come to pass.",
                    "{C:lordofvoid}...",
                    "{C:lordofvoid}Let us not dwell here.",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_lord_witness_victory', set = 'Other'}
            end
            return {vars = {card.ability.extra.threshold, card.ability.extra.reduction * 100}}
        end,
        calculate = function(self, card, context)
            if context.final_scoring_step and hand_chips >= mult * card.ability.extra.threshold then
				return {
					extra = {focus = card,
						message = localize{type = 'variable', key = 'a_blind_minus_percent',
							vars = {card.ability.extra.reduction*100}}, },
					card = card,
                    func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            AMM.mod_blind(1-card.ability.extra.reduction, nil, true)
                            return true
                        end)}))
					end,
				}
            end
        end,
    },
    'underdogs_secret', underdogs_secret = {
        name = "Underdog's Secret",
		subtitle = "Work In Progress!",
        text = {
            "If scored Chips value is at least",
            "{X:attention,C:white}#1#X{} the Mult value, earn {C:money}$#2#",
        },
        config = { extra = {
            threshold = 50,
            money = 5,
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.threshold, card.ability.extra.money}}
        end,
        calculate = function(self, card, context)
            if context.final_scoring_step and hand_chips >= mult * card.ability.extra.threshold then
                ease_dollars(card.ability.extra.money)
                return {
                    message = localize('$')..card.ability.extra.money,
                    colour = G.C.MONEY
                }
            end
        end,
    },
    'joker_of_swords', joker_of_swords = {
        name = "Joker of Swords",
		subtitle = "Work In Progress!",
        text = {
            "Played cards with",
            "{C:thac_swords}#2#{} suit give",
            "{C:mult}+#1#{} Mult when scored", 
        },
        config = { extra = {
            s_mult = 4,
            suit = "thac_Swords",
        }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular')}}
        end,
        calculate = function(self, card, context)
            if context.individual and not context.end_of_round and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    extra = {
                        mult = card.ability.extra.s_mult,
                        colour = G.C.MULT
                    },
                    card = card,
                    colour = G.C.MULT
                }
            end
        end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.suit, true) then return true end
            end
        end,
    },
    'joker_of_coins', joker_of_coins = {
        name = "Joker of Coins",
		subtitle = "Work In Progress!",
        text = {
            "Played cards with",
            "{C:thac_coins}#2#{} suit give",
            "{C:mult}+#1#{} Mult when scored", 
        },
        config = { extra = {
            s_mult = 4,
            suit = "thac_Coins",
        }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular')}}
        end,
        calculate = function(self, card, context)
            if context.individual and not context.end_of_round and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    extra = {
                        mult = card.ability.extra.s_mult,
                        colour = G.C.MULT
                    },
                    card = card,
                    colour = G.C.MULT
                }
            end
        end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.suit, true) then return true end
            end
        end,
    },
    'joker_of_wands', joker_of_wands = {
        name = "Joker of Wands",
		subtitle = "Work In Progress!",
        text = {
            "Played cards with",
            "{C:thac_wands}#2#{} suit give",
            "{C:mult}+#1#{} Mult when scored", 
        },
        config = { extra = {
            s_mult = 4,
            suit = "thac_Wands",
        }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular')}}
        end,
        calculate = function(self, card, context)
            if context.individual and not context.end_of_round and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    extra = {
                        mult = card.ability.extra.s_mult,
                        colour = G.C.MULT
                    },
                    card = card,
                    colour = G.C.MULT
                }
            end
        end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.suit, true) then return true end
            end
        end,
    },
    'joker_of_cups', joker_of_cups = {
        name = "Joker of Cups",
		subtitle = "Work In Progress!",
        text = {
            "Played cards with",
            "{C:thac_cups}#2#{} suit give",
            "{C:mult}+#1#{} Mult when scored", 
        },
        config = { extra = {
            s_mult = 4,
            suit = "thac_Cups",
        }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular')}}
        end,
        calculate = function(self, card, context)
            if context.individual and not context.end_of_round and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    extra = {
                        mult = card.ability.extra.s_mult,
                        colour = G.C.MULT
                    },
                    card = card,
                    colour = G.C.MULT
                }
            end
        end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.suit, true) then return true end
            end
        end,
    },
    'joker_of_pickaxes', joker_of_pickaxes = {
        name = "Joker of Pickaxes",
		subtitle = "Work In Progress!",
        text = {
            "Played cards with",
            "{C:thac_pickaxes}#2#{} suit give",
            "{C:mult}+#1#{} Mult when scored", 
        },
        config = { extra = {
            s_mult = 4,
            suit = "thac_Pickaxes",
        }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular')}}
        end,
        calculate = function(self, card, context)
            if context.individual and not context.end_of_round and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    extra = {
                        mult = card.ability.extra.s_mult,
                        colour = G.C.MULT
                    },
                    card = card,
                    colour = G.C.MULT
                }
            end
        end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.suit, true) then return true end
            end
        end,
    },
    'amalgamiter', amalgamiter = {
        name = "Amalgamiter",
		subtitle = "using alchemiters in alchemy was a mistake",
        text = {
            "When round begins, if there",
            "are at least {C:attention}#1#{} cards",
            "in your {C:attention}graveyard{}, {C:attention}combine{}",
            "them and put the result",
            "into your hand",
        },
        config = { extra = {
            threshold = 2,
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
        rarity = 3,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = {card.ability.extra.threshold}}
        end,
        calculate = function(self, card, context)
            if context.first_hand_drawn and not context.blueprint then
                local gy_cards = AMM.api.graveyard.get_cards()
                if #gy_cards < card.ability.extra.threshold then return end
                local suits = {} local ranks = {}
                local enhancements = {} local seals = {} local editions = {}
                local aspects = {} local bottles = {}
                local perma = {
                    bonus = 0,
                    mult = 0,
                    x_chips = 0,
                    x_mult = 0,
                    h_chips = 0,
                    h_mult = 0,
                    h_x_chips = 0,
                    h_x_mult = 0,
                    p_dollars = 0,
                    h_dollars = 0,
                }
                for k,v in ipairs(gy_cards) do
                    suits[#suits+1] = v.base.suit
                    ranks[#ranks+1] = v.base.value
                    enhancements[#enhancements+1] = v.config.center.key
                    seals[#seals+1] = v:get_seal(true)
                    editions[#editions+1] = v.edition
                    aspects[#aspects+1] = v:get_aspect(true)
                    bottles[#bottles+1] = v.bottle
                    perma.bonus = perma.bonus + v.ability.perma_bonus
                    perma.bonus = perma.bonus + v.base.nominal
                    perma.mult = perma.mult + v.ability.perma_mult
                    -- fuck it we ball idfk how this shit works
                    perma.x_chips = perma.x_chips + v.ability.perma_x_chips
                    perma.x_mult = perma.x_mult + v.ability.perma_x_mult
                    perma.h_chips = perma.h_chips + v.ability.perma_h_chips
                    perma.h_mult = perma.h_mult + v.ability.perma_h_mult
                    perma.h_x_chips = perma.h_x_chips + v.ability.perma_h_x_chips
                    perma.h_x_mult = perma.h_x_mult + v.ability.perma_h_x_mult
                    perma.p_dollars = perma.p_dollars + v.ability.perma_p_dollars
                    perma.h_dollars = perma.h_dollars + v.ability.perma_h_dollars
                end
                -- generate and place the card
                --   remember to remove the nominal value for the generated rank from perma.bonus
                --   so its chip value isn't "counted twice"
                local suit = pseudorandom_element(suits, pseudoseed("amalgamiter"))
                local rank = pseudorandom_element(ranks, pseudoseed("amalgamiter"))
                local enhancement = pseudorandom_element(enhancements, pseudoseed("amalgamiter"))
                local seal = pseudorandom_element(seals, pseudoseed("amalgamiter"))
                local edition = pseudorandom_element(editions, pseudoseed("amalgamiter"))
                local aspect = pseudorandom_element(aspects, pseudoseed("amalgamiter"))
                local bottle = pseudorandom_element(bottles, pseudoseed("amalgamiter"))

                local new_card = create_playing_card({
                    -- this isnt exactly obvious, but create_playing_card
                    -- will default to creating a random playing card front if the
                    -- front supplied is nil, so this should actually be safe even
                    -- if for some reason certain combinations of suit and rank
                    -- are invalid; it just won't make *much* sense

                    -- you're welcome to test this though i have no idea if it works
                    front = G.P_CARDS[('%s_%s'):format(SMODS.Suits[suit].card_key, SMODS.Ranks[rank].card_key)],
                    center = G.P_CENTERS[enhancement]
                }, G.hand)

                new_card:set_seal(seal)
                new_card:set_edition(edition)
                new_card:set_aspect(aspect)
                new_card.bottle = bottle
                -- i remberd
                new_card.ability.perma_bonus = perma.bonus - new_card.base.nominal
                new_card.ability.perma_mult = perma.mult
                new_card.ability.perma_x_chips = perma.x_chips
                new_card.ability.perma_x_mult = perma.x_mult
                new_card.ability.perma_h_chips = perma.h_chips
                new_card.ability.perma_h_mult = perma.h_mult
                new_card.ability.perma_h_x_chips = perma.h_x_chips
                new_card.ability.perma_h_x_mult = perma.h_x_mult

                -- empty the graveyard
                for i=#gy_cards,1,-1 do
                    gy_cards[i]:remove_from_game(nil, true)
                end
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'stargazing', stargazing = {
        name = "Stargazing",
		subtitle = "Work In Progress!",
        text = {
            "If played hand is a",
            "{C:attention}Straight Spectrum{},",
            "fill your consumable",
            "slots with random",
            "{C:planet}Planet{} cards",
            "{C:inactive}(Must have room)",
        },
        config = { extra = {
        }},
        pos = { x = 0, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.joker_main and not context.blueprint and context.scoring_name == "spectrum_Straight Spectrum" then
                local planets = G.consumeables.config.card_limit - (#G.consumeables.cards + G.GAME.consumeable_buffer)
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + planets
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, planets do
                            if G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit then
                                local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'stargazing')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                            end
                        end
                        G.GAME.consumeable_buffer = 0
                        return true
                    end}))
                return {
                    message = "Planets!",
                    colour = G.C.SECONDARY_SET.Planet,
                }
            end
        end,
        load_check = function()
            return next(SMODS.find_mod("SpectrumFramework"))
        end,
    },
    'somber_snowfall', somber_snowfall = {
        name = "Somber Snowfall",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Unscored{} played cards",
            "give {C:chips}+#1#{} Chips for",
            "each card in your {C:attention}graveyard{}",
            "that shares a {C:attention}suit{} with it",
        },
        config = { extra = {
            chips = 5,
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.chips
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round then
                if SMODS.has_any_suit(context.other_card) then
                    return {
                        chips = card.ability.extra.chips * AMM.api.graveyard.filter_count(function(v)
                            if not SMODS.has_no_suit(v) then return true end
                        end)
                    }
                elseif not SMODS.has_no_suit(context.other_card) then
                    local SUITS = {}
                    for _,k in ipairs(SMODS.Suit.obj_buffer) do
                        if context.other_card:is_suit(k) then SUITS[#SUITS+1] = k end
                    end
                    return {
                        chips = card.ability.extra.chips * AMM.api.graveyard.filter_count(function(v)
                            if SMODS.has_no_suit(v) then return false end
                            for _,k in ipairs(SUITS) do
                                if v:is_suit(k) then return true end
                            end
                        end)
                    }
                end
            end
        end,
    },
    
    --
    'jack_of_all_trades', jack_of_all_trades = {
        name = "Jack of All Trades",
		subtitle = "Work In Progress!",
        text = {
            "Played {C:attention}Jacks{} are treated as",
            "if they are each {C:attention}enhancement{}",
            "among cards held in hand",
        },
        config = {extra = { }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.check_enhancement then
                if context.other_card.area == G.play and context.other_card.base.value == "Jack" and not context.other_card.config.center.no_rank then
                    keys = {}
                    ret = false
                    for k,v in ipairs(G.hand.cards) do
                        if v.ability.set == "Enhanced" then
                            keys[v.config.center.key] = true
                            ret = true
                        end
                    end
                    if ret then return keys end
                end
            end
        end,
    },
    'all_lucky_sevens', all_lucky_sevens = {
        name = "All Lucky Sevens",
		subtitle = "Work In Progress!",
        text = {
            "Played {C:attention}7s{} are treated",
            "as if they are also",
            "{C:attention}Lucky Cards{}",
        },
        config = {extra = { }},
        pos = { x = 0, y = 0 },
        cost = 5,
        rarity = 1,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.check_enhancement then
                if context.other_card.area == G.play and context.other_card.base.value == "7" and not context.other_card.config.center.no_rank then
                    return {
                        m_lucky = true,
                    }
                end
            end
        end,
    },
    'quantum_grass', quantum_grass = {
        name = "Quantum Grass Glass",
		subtitle = "Work In Progress!",
        text = {
            "{C:attention}Glass{} cards and",
            "{C:attention}Grass{} cards are also",
            "considered {C:attention}Grass{} cards",
            "and {C:attention}Glass{} cards, respectively"
        },
        config = {extra = { }},
        pos = { x = 0, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS['m_glass']
            info_queue[#info_queue+1] = G.P_CENTERS['m_thac_grass']
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.check_enhancement then
                if context.other_card.config.center.key == "m_glass" then
                    return {
                        m_thac_grass = true
                    }
                end
                if context.other_card.config.center.key == "m_thac_grass" then
                    return {
                        m_glass = true
                    }
                end
            end
        end,
    },
    'twin_stella', twin_stella = {
        name = "Twin Stella",
		subtitle = "Work In Progress!",
        text = {
            "Played cards with {C:six_stars}Star{} suit",
            "are treated as if they are",
            "also {C:attention}Star Cards{}",
        },
        config = {extra = { }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS.m_thac_star
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.check_enhancement then
                if context.other_card.area == G.play and
                    (context.other_card.config.center.any_suit or 
                    (context.other_card.base.suit == "six_Stars" and not context.other_card.config.center.no_suit)) then
                    return {
                        m_thac_star = true,
                    }
                end
            end
        end,
        load_check = function()
            return next(SMODS.find_mod("SixSuits"))
        end
    },
    'lunar_grave', lunar_grave = {
        name = "Lunar Grave",
		subtitle = "Work In Progress!",
        text = {
            "Played cards with {C:six_moon}Moon{} suit",
            "are treated as if they are",
            "also {C:attention}Bone Cards{}",
        },
        config = {extra = { }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS.m_thac_bone
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.check_enhancement then
                if context.other_card.area == G.play and
                    (context.other_card.config.center.any_suit or 
                    (context.other_card.base.suit == "six_Moons" and not context.other_card.config.center.no_suit)) then
                    return {
                        m_thac_bone = true,
                    }
                end
            end
        end,
        load_check = function()
            return next(SMODS.find_mod("SixSuits"))
        end
    },
    'give_the_dog_a_bone', give_the_dog_a_bone = {
        name = "Give the Dog a Bone",
		subtitle = "Work In Progress!",
        text = {
            "{X:mult,C:white}X#1#{} Mult if played hand is",
            "a {C:attention}Little Dog{} or {C:attention}Big Dog{} and",
            "contains a scoring {C:attention}Bone Card{}"
        },
        config = { extra = {
            Xmult = 4,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        enhancement_gate = "m_thac_bone",
		loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.Xmult
            }}
        end,
        calculate = function(self, card, context)
            if context.joker_main and (next(context.poker_hands["thac_little_dog"]) or next(context.poker_hands["thac_big_dog"])) then
                for k,v in ipairs(context.scoring_hand) do
                    if SMODS.has_enhancement(v,"m_thac_bone") then
                        return { xmult = card.ability.extra.Xmult }
                    end
                end
            end
        end,
    },
    'nine_lives', nine_lives = {
        name = "Nine Lives",
		subtitle = "Work In Progress!",
        text = {
            "Returns all {C:attention}Soulbound Cards{} in",
            "your {C:attention}graveyard{} to your hand if",
            "played hand is a {C:attention}Little Cat{} or {C:attention}Big Cat{} and",
            "contains a scoring {C:attention}Soulbound Card{}"
        },
        config = { extra = {
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        enhancement_gate = "m_thac_soulbound",
		loc_vars = function(self, info_queue, card)
            return {vars = {
            }}
        end,
        calculate = function(self, card, context)
            if context.joker_main and (next(context.poker_hands["thac_little_cat"]) or next(context.poker_hands["thac_big_cat"])) then
                for k,v in ipairs(context.scoring_hand) do
                    if SMODS.has_enhancement(v,"m_thac_soulbound") then
                        return {
                            message = "Returned!",
                            func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    for i=#G.graveyard,1,-1 do
                                        if SMODS.has_enhancement(G.graveyard[i], "m_thac_soulbound") then
                                            G.graveyard[i]:move_from_graveyard(G.hand)
                                        end
                                    end
                                    return true
                                end)}))
                            end,
                        }
                    end
                end
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
        if v.load_check then
            if v.load_check() then placeholder_jokers[#placeholder_jokers+1] = "j_thac_" .. k end
        else
            placeholder_jokers[#placeholder_jokers+1] = "j_thac_" .. k
        end
    end
end