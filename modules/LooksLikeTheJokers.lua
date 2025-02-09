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
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
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
            return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds}}
        end,
        calculate = function(self, card, context)
            if context.joker_main and (pseudorandom(pseudoseed("placeholder_joker")) < G.GAME.probabilities.normal/card.ability.extra.odds) then
                card:set_ability(G.P_CENTERS[pseudorandom_element(placeholder_jokers, pseudoseed('placeholder_joker'))])
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
        config = {extra = {Xmult_mod = 0.25, xmult = 1.0}},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'thac_animal_hands', set = 'Other'}
            return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.xmult}}
        end,
        calculate = function(self, card, context)
            if context.before and not context.blueprint and (
                next(context.poker_hands['thac_little_dog']) or
                next(context.poker_hands['thac_big_dog']) or
                next(context.poker_hands['thac_little_cat']) or
                next(context.poker_hands['thac_big_cat'])
            ) then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.Xmult_mod
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                }
            end
            if context.joker_main and card.ability.extra.xmult > 1 then
                return {
                    colour = G.C.MULT,
                    xmult = card.ability.extra.xmult
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
        config = {extra = {Xmult_mod = 0.10, xmult = 1.0}},
        pos = { x = 4, y = 3 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.xmult}}
        end,
        calculate = function(self, card, context)
            if context.amm_added_card and context.other_card.ability.set == "Joker" and not context.from_debuff and not context.blueprint then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.Xmult_mod
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                }
            end
            if context.joker_main and card.ability.extra.xmult > 1 then
                return {
                    colour = G.C.MULT,
                    xmult = card.ability.extra.xmult
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
		subtitle = "Work In Progress!",
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
    'muse_of_mind', muse_of_mind = {
        name = "Maid of Mind",
		subtitle = "Work In Progress!",
        text = {
            "Rescore each scoring Joker",
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
        calculate = function(self, card, context)
            if context.joker_main and not context.muse_of_mind_repeat then
                local ret = {}
                context.muse_of_mind_repeat = true
                ret = SMODS.calculate_context(context)
                context.muse_of_mind_repeat = false
                return ret
            end
        end,
    },
    'lord_of_void', lord_of_void = {
        name = "Lord of Void",
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
                name = "heart, mind, and void",
                text = {
                    "{C:money}Mindless drone, driven by pursuit",
                    "{C:money}of the highest possible number;",
                    "{C:money}You know how this story ends,",
                    "{C:money}but you continue onwards towards a",
                        "{C:dark_edition}Dark Apotheosis.",
                    "{C:money}What is it you hope to accomplish, child?{}",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
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
							vars = {card.ability.extra.reduction*100}}, 
						func = function()
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 0.0,
							func = (function()
								AMM.mod_blind(1-card.ability.extra.reduction, nil, true)
								return true
							end)}))
					end},
					card = card
				}
            end
            if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss and not context.blueprint then
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
                    "{C:hearts}don't worry",
                    "{C:hearts}i'm well prepared",
                    "{C:hearts}at least,",
                    "{C:hearts}as much as i need to be",
                    "{C:hearts}to get rid of you"
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
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
                    "{C:hearts}i dont make the rules",
                    "{C:hearts}if you see a strife specibus",
                    "{C:hearts}that is unowned",
                    "{C:hearts}you now have another strife specibus",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
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
            G.localization.descriptions.Other['maid_examine_pokerkind'] = {
                name = "Maid: Examine POKERKIND specibus",
                text = {
                    "{C:clubs}i guess you can just put any cards in this thing",
                    "{C:clubs}maybe someone out there plays poker with credit cards",
                    "{C:clubs}all i need to know is i can stuff this thing full of cards",
                    "{C:clubs}pretty useful if lacking in combat application"
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 'maid_examine_pokerkind', set = 'Other'}
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
                    "{C:money}However,",
                    "{C:money}You'll find that's not",
                    "{C:money}quite as relevant as you",
                    "{C:money}hoped it would be.",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
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
            "Maid of Mind",
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
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_ascend', set = 'Other'}
            end
            info_queue[#info_queue+1] = G.P_CENTERS['j_thac_knight_of_heart']
            info_queue[#info_queue+1] = G.P_CENTERS['j_thac_muse_of_mind']
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