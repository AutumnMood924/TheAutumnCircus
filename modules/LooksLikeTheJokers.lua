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
            "This Joker gains {X:mult,C:white} X#1# {} Mult",
            "whenever another {C:attention}Joker{}",
            "is gained",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
        },
        config = {extra = {Xmult_mod = 0.10, xmult = 1.0}},
        pos = { x = 0, y = 0 },
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
            if context.amm_added_card and context.other_card.config.center.set == "Joker" and not context.from_debuff and not context.blueprint then
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
        text = {
            "Played cards are {C:attention}converted{} to {C:hearts}Hearts{}",
            "and this Joker gains the following",
            "depending on the card's {C:attention}original suit{}:",
            "{C:spades}Spades{}: {C:chips}+#1#{} Chips {C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
            "{C:clubs}Clubs{}: {C:mult}+#3#{} Mult {C:inactive}(Currently {C:mult}+#4#{C:inactive} Mult)",
            "{C:diamonds}Diamonds{}: {C:money}+$#5#{} at end of round {C:inactive}(Currently {C:money}$#6#{C:inactive})",
            "{C:attention}Other suits{}: {C:mult}+{X:mult,C:white} X#7# {} Mult {C:inactive}(Currently {X:mult,C:white} X#8# {C:inactive} Mult)"
        },
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
        name = "Muse of Mind",
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