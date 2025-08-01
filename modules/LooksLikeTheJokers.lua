TheAutumnCircus.placeholder_jokers = { }

local jokers = {
    'helpful_joker', helpful_joker = {
        config = { extra = {
            s_chips = 30,
            suit = "six_Stars",
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.s_chips, localize(card.ability.extra.suit, 'suits_singular')}}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and not context.end_of_round and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    extra = {
                        chips = card.ability.extra.s_chips,
                        colour = G.C.CHIPS
                    },
                    card = card,
                    colour = G.C.CHIPS
                }
            end
			if context.forcetrigger then
				return {
					chips = card.ability.extra.s_chips
				}
			end
        end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.extra.suit, true) then return true end
            end
        end,
		dependencies = { "SixSuits" },
    },
    'dutiful_joker', dutiful_joker = {
        config = { extra = {
            s_chips = 30,
            suit = "six_Moons",
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.s_chips, localize(card.ability.extra.suit, 'suits_singular')}}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and not context.end_of_round and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    extra = {
                        chips = card.ability.extra.s_chips,
                        colour = G.C.CHIPS
                    },
                    card = card,
                    colour = G.C.CHIPS
                }
            end
			if context.forcetrigger then
				return {
					chips = card.ability.extra.s_chips
				}
			end
        end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.extra.suit, true) then return true end
            end
        end,
		dependencies = { "SixSuits" },
    },
	'frivolous_joker', frivolous_joker = {
		config = {
            extra = {
                mult = 7
            },
		},
		pos = { x = 0, y = 0 },
		cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.mult }} end,
		dependencies = { "SpectrumFramework" },
        calculate = function(self, card, context)
            if context.joker_main and not (next(context.poker_hands['spectrum_Spectrum'])) then
                return { mult = card.ability.extra.mult }
            end
			if context.forcetrigger then
				return {
					mult = card.ability.extra.mult
				}
			end
        end,
	},
	'groaning_joker', groaning_joker = {
		config = {
            extra = {
                chips = 65
            },
		},
		pos = { x = 0, y = 0 },
		cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.chips }} end,
		dependencies = { "SpectrumFramework" },
        calculate = function(self, card, context)
            if context.joker_main and not (next(context.poker_hands['spectrum_Spectrum'])) then
                return { chips = card.ability.extra.chips }
            end
			if context.forcetrigger then
				return {
					chips = card.ability.extra.chips
				}
			end
        end,
	},
    'standardized', standardized = {
        config = {
            extra = {
                Xmult = 1.7,
            },
        },
        pos = { x = 0, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'thac_standard_hands', set = 'Other'}
            return {vars = { card.ability.extra.Xmult }}
        end,
        calculate = function(self, card, context)
            if context.joker_main and TheAutumnCircus.func.context_strict_standard_hands(context) then
                return { xmult = card.ability.extra.Xmult }
            end
			if context.forcetrigger then
				return {
					xmult = card.ability.extra.Xmult
				}
			end
        end,
    },
    'nonstandard', nonstandard = {
        config = {
            extra = {
                Xmult = 3.2,
            },
        },
        pos = { x = 0, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'thac_standard_hands', set = 'Other'}
            return {vars = { card.ability.extra.Xmult }}
        end,
        calculate = function(self, card, context)
            if context.joker_main and not TheAutumnCircus.func.context_strict_standard_hands(context) then
                return { xmult = card.ability.extra.Xmult }
            end
			if context.forcetrigger then
				return {
					xmult = card.ability.extra.Xmult
				}
			end
        end,
    },
    'gift_from_the_void', gift_from_the_void = {
        config = { },
        pos = { x = 1, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = {}}
        end,
        calculate = function(self, card, context)
            if (context.end_of_round and not context.individual and not context.repetition) or context.forcetrigger then
				return {
					extra = {
						func = function()
							G.deck.config.card_limit = G.deck.config.card_limit + 1
							local _card = create_playing_card({
								front = pseudorandom_element(G.P_CARDS, pseudoseed('gftv')), 
								center = G.P_CENTERS.c_base}, G.deck, nil, nil, {G.C.SECONDARY_SET.Enhanced})
							_card:set_edition({negative = true}, nil, true)
							G.deck:emplace(_card)
							G.GAME.blind:debuff_card(_card)
							if context.blueprint_card then context.blueprint_card:juice_up() else card:juice_up() end
							playing_card_joker_effects({true})
							return true
						end,
					},
					message = localize("k_thac_negative"),
				}
            end
        end,
    },
    'lord_of_the_meek', lord_of_the_meek = {
        config = {extra = {retriggers = 1}},
        pos = { x = 2, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = false,
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
			-- incompatible with context.forcetrigger
        end,
    },
    'mirage_joker', mirage_joker = {
        config = {extra = {odds = 4, retriggers = 1}},
        pos = { x = 3, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = false,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            local blah = ""
            if card.ability.extra.retriggers > 1 then blah = "s" end
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2], card.ability.extra.retriggers, blah}}
        end,
        calculate = function(self, card, context)
            if (context.retrigger_joker_check and (not context.other_context.mod_probability) and (not context.other_context.fix_probability) and context.other_card ~= card and SMODS.pseudorandom_probability(card, 'mirage_joker', 1, card.ability.extra.odds)) then
                return {
                    repetitions = card.ability.extra.retriggers,
                    card = card,
                    colour = G.C.ORANGE,
                    message = localize('k_again_ex')
                }     
            end
			-- incompatible with context.forcetrigger
        end,
    },
    'transfusion', transfusion = {
        config = {extra = {rate = 0.4, Xmult = 1.25, buffer = 0}},
        pos = { x = 4, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            return {vars = {card.ability.extra.rate * 100, card.ability.extra.Xmult}}
        end,
        calculate = function(self, card, context)
            if context.joker_main or (context.forcetrigger and type(hand_chips) == "number" and hand_chips > -1) then
				local hchips = hand_chips - card.ability.extra.buffer
				local val = math.floor(card.ability.extra.rate * hchips)
				card.ability.extra.buffer = card.ability.extra.buffer + val
				return {
					chip_mod = -val,
					mult_mod = val * card.ability.extra.Xmult,
					card = card,
					colour = G.C.PURPLE,
					message = localize("k_thac_converted"),
					func = function()
						card.ability.extra.buffer = 0
						return true
					end,
				}
            end
        end,
    },
    'placeholder_joker', placeholder_joker = {
        config = {extra = {odds = 3}},
        pos = { x = 0, y = 0 },
        cost = 3,
        rarity = 1,
        blueprint_compat = false,
        eternal_compat = false,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2]}}
        end,
        calculate = function(self, card, context)
            if (context.joker_main or context.forcetrigger) and SMODS.pseudorandom_probability(card, 'placeholder_joker', 1, card.ability.extra.odds) then
                card:set_ability(G.P_CENTERS[pseudorandom_element(TheAutumnCircus.placeholder_jokers, pseudoseed('placeholder_joker'))])
            end
        end,
    },
    'filler_card', filler_card = {
        config = {extra = { Xchips_curr = 1, Xchips = 0.05 }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
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
					focus = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                }
            end
            if (context.joker_main or context.forcetrigger) and card.ability.extra.Xchips_curr > 1 then
                return {
                    colour = G.C.CHIPS,
                    xchips = card.ability.extra.Xchips_curr
                }
            end
        end,
    },
    'test_print', test_print = {
        config = {extra = { Xchips = 1.8 }},
        pos = { x = 0, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.Xchips }}
        end,
        calculate = function(self, card, context)
            if context.other_joker and not context.end_of_round then
                local do_it = false
                for k,v in ipairs(TheAutumnCircus.placeholder_jokers) do
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
			if context.forcetrigger then
				return {
					xchips = card.ability.extra.Xchips
				}
			end
        end,
    },
    'sans', sans = {
        config = {extra = {  }},
        pos = { x = 0, y = 0 },
        cost = 20,
        rarity = 4,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = false,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = {  }}
        end,
        calculate = function(self, card, context)
            if context.retrigger_joker_check then
                local do_it = false
                for k,v in ipairs(TheAutumnCircus.placeholder_jokers) do
                    if context.other_card.config.center.key == v then do_it = true; break end
                end
                if do_it then
                    return {
                        card = context.blueprint_card or card,
                        colour = G.C.BLUE,
                        repetitions = 1,
						message = localize('k_again_ex')
                    }
                end
            end
			-- incompatible with context.forcetrigger
        end,
    },
    'null', null = {
        config = {extra = {  }},
        pos = { x = 0, y = 0 },
        cost = 20,
        rarity = 4,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.e_negative
            return {vars = {  }}
        end,
        calculate = function(self, card, context)
            if (context.setting_blind or context.forcetrigger) and not (context.blueprint_card or card).getting_sliced then
				local do_anything = false
				local candidates = {}
				for i=1, #G.jokers.cards do
					local do_it = false
					local card2 = G.jokers.cards[i]
					for k,v in ipairs(TheAutumnCircus.placeholder_jokers) do
						if card2.config.center.key == v and (not card2.edition or not card2.edition.negative) then do_it = true; do_anything = true; break end
					end
					if do_it then
						candidates[#candidates+1] = card2
					end
				end
				if do_anything then
                    return {
                        card = context.blueprint_card or card,
                        colour = G.C.JOKER_GREY,
						extra = {
							func = function()
								pseudoshuffle(candidates, pseudoseed("null"))
								candidates[1]:set_edition({negative = true})
							end,
						},
						message = localize("k_thac_negative")
                    }
				end
            end
        end,
    },
    'clown_posse', clown_posse = {
        config = {extra = {Xmult_mod = 0.10, Xmult_curr = 1.0}},
        pos = { x = 4, y = 3 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
        demicolon_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult_curr}}
        end,
        calculate = function(self, card, context)
            if context.card_added and context.card.ability.set == "Joker" and not context.blueprint then
                card.ability.extra.Xmult_curr = card.ability.extra.Xmult_curr + card.ability.extra.Xmult_mod
                return {
                    card = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                }
            end
            if (context.joker_main or context.forcetrigger) and card.ability.extra.Xmult_curr > 1 then
                return {
                    colour = G.C.MULT,
                    xmult = card.ability.extra.Xmult_curr
                }
            end
        end,
    },
    'stellar_alignment', stellar_alignment = {
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
        load_check = function()
            return TheAutumnCircus.config.enabled_modules.enhancable and not TheAutumnCircus.config.enabled_enhancements.star == false
        end,
    },
    'paint_mixer', paint_mixer = {
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
		dependencies = { "SpectrumFramework" },
    },
    'knight_of_heart', knight_of_heart = {
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
						if v.ability.akyrs_special_card_type == "rank" then
							v.ability.akyrs_special_card_type = nil
							v:change_suit("Hearts")
							state = 1
						end
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
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 'what_are_you_wearing', set = 'Other'}
            end
        end,
        calculate = function(self, card, context)
            if context.joker_main and not context.retrigger_joker_check and not context.witch_of_mind_repeat then
                return {
					message = localize("k_again_ex"),
					colour = G.ARGS.LOC_COLOURS['witchofmind'],
					func = function()
						context.witch_of_mind_repeat = true
						SMODS.calculate_context(context)
						context.witch_of_mind_repeat = false
						return true
					end,
				}
            end
        end,
    },
    'lord_of_void', lord_of_void = {
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
    'highest_number', highest_number = {
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
                    message = localize("k_thac_lvup"),
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
		no_collection = true,
		no_doe = true,
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
		no_collection = true,
		no_doe = true,
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
                    "{C:witchofmind}i gu3ss you can just put any cards in this thing",
                    "{C:witchofmind}mayb3 som3on3 out th3r3 plays pok3r with cr3dit cards",
                    "{C:witchofmind}all i n33d to know is i can stuff this thing 3ndl3ssly with cards",
                    "{C:witchofmind}pretty us3ful if lacking in combat application"
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
		no_collection = true,
		no_doe = true,
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
		no_collection = true,
		no_doe = true,
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
                    "{C:clubs}pl3as3 shut up",
                    "{X:hearts,C:hearts}??????{C:clubs} just hurry up and us3 the slab",
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
		no_collection = true,
		no_doe = true,
    },
    'astront', astront = {
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
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2],
            }}
        end,
        calculate = function(self, card, context)
            if context.before and SMODS.pseudorandom_probability(card, 'astront', 1, card.ability.extra.odds) then
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
    'lost_sock', lost_sock = {
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
        in_pool = function(self)
            return #G.P_CENTER_POOLS.Oddity ~= 0
        end,
    },
    'exorcist', exorcist = {
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
        load_check = function()
            return TheAutumnCircus.config.enabled_modules.enhancable and not TheAutumnCircus.config.enabled_enhancements.jewel == false
        end,
    },
    'discarded_vessel', discarded_vessel = {
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
		loc_vars = function(self, info_queue, card)
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_lord_retrieve_body', set = 'Other'}
            end
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2],
            }}
        end,
        calculate = function(self, card, context)
            if context.discard and context.other_card.aspect == nil and SMODS.pseudorandom_probability(card, 'discarded_vessel', 1, card.ability.extra.odds) then
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
        load_check = function()
            return TheAutumnCircus.config.enabled_modules.enhancable and not TheAutumnCircus.config.enabled_enhancements.jewel == false
        end,
    },
    'twisted_mind', twisted_mind = {
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
                    message = localize("k_thac_heeheehee"),
                    colour = G.C.RED,
                }
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'gravedigger', gravedigger = {
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
				local destroyed_cards = {}
                for k,v in ipairs(G.playing_cards) do temp_deck[#temp_deck+1] = v end
                pseudoshuffle(temp_deck, pseudoseed("dark_hallway"))
                for i=#temp_deck,#temp_deck-math.floor(card.ability.extra.targets-1),-1 do
					destroyed_cards[#destroyed_cards+1] = temp_deck[i]
                end
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.1,
					func = function() 
                    for i=#destroyed_cards, 1, -1 do
                        local card = destroyed_cards[i]
                        if SMODS.shatters(card) then
                            card:shatter()
                        else
                            card:start_dissolve(nil, i == #destroyed_cards)
                        end
                    end
                    return true end }))
				delay(0.3)
				SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })
                return true
            end
        end,
    },
    'triplicate_soul', triplicate_soul = {
        config = { extra = {
            cards = 2,
        }},
        pos = { x = 8, y = 1 },
        cost = 10,
        rarity = 3,
		discovered = true,
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
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_copied_ex"), colour = G.C.JOKER_GREY, instant = true})
            end
        end,
    },
    'grasp_of_emptiness', grasp_of_emptiness = {
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
                return {
                    dollars = card.ability.extra.money
                }
            end
            if context.destroy_card and context.cardarea == "unscored" and context.destroy_card:get_id() == 14 then
                return { remove = true }
            end
        end,
    },
    'underdogs_secret', underdogs_secret = {
        config = { extra = {
            threshold = 20,
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
    'topple_the_titans', topple_the_titans = {
        config = { extra = {
            threshold = 50,
            reduction = 0.20,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
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
    'autoapotheosis', autoapotheosis = {
        config = { extra = {
            threshold = 200,
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.threshold}}
        end,
        calculate = function(self, card, context)
            if context.final_scoring_step and hand_chips >= mult * card.ability.extra.threshold then
                local keyset={}
                local n=0
                for k,v in pairs(AMM.Aspects) do
                    n=n+1
                    keyset[n]=k
                end n = 0
                for k,v in ipairs(context.scoring_hand) do
                    if v.aspect == nil then
                        local god_tier = pseudorandom_element(keyset, pseudoseed("god_tier"))
                        G.E_MANAGER:add_event(Event({
                            trigger = 'immediate',
                            func = function() 
                                v:set_aspect(god_tier,nil,true)
                                return true
                            end
                        }))
                        n = 1
                    end
                end
                if n ~= 0 then delay(0.6) return {
                    message = localize("k_thac_godtier"),
                    colour = G.C.RED
                } end
            end
        end,
    },
    'amalgamiter', amalgamiter = {
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

                AMM.combine_cards(gy_cards, "amalgamiter", G.hand)
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'celestial_awe', celestial_awe = {
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
                    message = localize("k_thac_planets"),
                    colour = G.C.SECONDARY_SET.Planet,
                }
            end
        end,
		dependencies = { "SpectrumFramework" },
    },
    'somber_snowfall', somber_snowfall = {
        config = { extra = {
            chips = 15,
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
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
    
    --[[
    'jack_of_all_trades', jack_of_all_trades = {
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
                if context.other_card.area == G.play then
					if context.other_card.base.value == "Jack" then
						if context.other_card.config.center.key ~= "m_stone" then
							if not context.other_card.config.center.no_rank then
								keys = {}
								ret = false
								for k,v in ipairs(G.hand.cards) do
									if v.config.center.set == "Enhanced" then
										keys[v.config.center.key] = true
										ret = true
									end
								end
								if ret then return keys end
							end
						end
					end
                end
            end
        end,
    },
    'all_lucky_sevens', all_lucky_sevens = {
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
                if context.other_card.area == G.play and context.other_card.base.value == "7" and not
				context.other_card.config.center.key == "m_stone" and not context.other_card.config.center.no_rank then
                    return {
                        m_lucky = true,
                    }
                end
            end
        end,
    },
    'celestial_crossing', celestial_crossing = {
        config = {extra = { in_progress = false }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_iou
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 's_lord_continue', set = 'Other'}
            end
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.check_enhancement and not card.ability.extra.in_progress then
                card.ability.extra.in_progress = true
				if context.other_card.area == G.play and
                    (SMODS.has_any_suit(context.other_card) or 
                    context.other_card.base.suit == "six_Stars") and not SMODS.has_no_suit(context.other_card) then
					card.ability.extra.in_progress = false
                    return {
                        m_ortalab_iou = true,
                    }
                end
				card.ability.extra.in_progress = false
            end
        end,
		dependencies = { "SixSuits", "ortalab" },
    },
    'twin_stella', twin_stella = {
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
                    (context.other_card.config.center.key == "m_wild" or context.other_card.config.center.any_suit or 
                    (context.other_card.base.suit == "six_Stars" and not (context.other_card.config.center.key == "m_stone" or context.other_card.config.center.no_suit))) then
                    return {
                        m_thac_star = true,
                    }
                end
            end
        end,
		dependencies = { "SixSuits" },
    },
    'lunar_grave', lunar_grave = {
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
                    (context.other_card.config.center.key == "m_wild" or context.other_card.config.center.any_suit or 
                    (context.other_card.base.suit == "six_Moons" and not (context.other_card.config.center.key == "m_stone" or context.other_card.config.center.no_suit))) then
                    return {
                        m_thac_bone = true,
                    }
                end
            end
        end,
		dependencies = { "SixSuits" },
    },
    'lunatic_cultist', lunatic_cultist = {
        config = {extra = { }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS.m_mf_cult
            return {vars = { }}
        end,
        calculate = function(self, card, context)
            if context.check_enhancement then
                if context.other_card.area == G.play and
                    (context.other_card.config.center.key == "m_wild" or context.other_card.config.center.any_suit or 
                    (context.other_card.base.suit == "six_Moons" and not (context.other_card.config.center.key == "m_stone" or context.other_card.config.center.no_suit))) then
                    return {
                        m_mf_cult = true,
                    }
                end
            end
        end,
		dependencies = { "SixSuits", "MoreFluff" },
    },
    --[['paradoxic_prophecy', paradoxic_prophecy = {
        name = "Paradoxic Prophecy",
		subtitle = "Work In Progress!",
        text = {
            "",
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
        process_loc_text = function(self)
            G.localization.descriptions.Other['witch_read_note'] = {
                name = "Witch: Read Note",
                text = {
                    "{C:lordofvoid}Hello, child.",
                    "{C:lordofvoid}You, the one who carries me.",
                    "{C:lordofvoid}...",
                    "{C:lordofvoid}I'd say to keep this between us,",
                    "{C:lordofvoid}But we know how that goes.",
                    "{C:lordofvoid}Hello to you as well, outsider.",
                    "{C:lordofvoid}I hope you find all this to be Fun.",
                }
            }
            SMODS.Joker.process_loc_text(self)
        end,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if math.random() < 0.01 then
                info_queue[#info_queue+1] = {key = 'witch_read_note', set = 'Other'}
            end
            return {vars = { }}
        end,
        calculate = function(self, card, context)

        end,
    },--]]
    'grave_legion', grave_legion = {
        config = { extra = {
            cards = 1,
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
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2],
                card.ability.extra.cards == 1 and "a" or math.floor(card.ability.extra.cards),
                card.ability.extra.cards == 1 and "y" or "ies",
                card.ability.extra.cards == 1 and "it" or "them",
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and not context.repetition and not context.end_of_round
            and SMODS.pseudorandom_probability(card, 'grave_legion', 1, card.ability.extra.odds) then
                local card_ = context.other_card
                return {
                    extra = {
                        message = localize("k_copied_ex"),
                        colour = G.C.JOKER_GREY,
                    },
                    card = card,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'immediate',
                            func = function() 
                                for i=1,math.floor(card.ability.extra.cards) do
                                    local _card = copy_card(card_, nil, nil, G.playing_card)
                                    _card:move_to_graveyard()
                                end
                                return true
                            end
                        }))
                    end,
                    colour = G.C.JOKER_GREY
                }
            end
        end,
    },
    'scrapper', scrapper = {
        config = { extra = {
            cards = 1,
        }},
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_steel
			info_queue[#info_queue+1] = G.P_CENTERS.m_gold
			if next(SMODS.find_mod("ortalab")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_rusty
			end
			if next(SMODS.find_mod("MoreFluff")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_mf_brass
			end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = {
				card.ability.extra.cards == 1 and "a" or card.ability.extra.cards,
				card.ability.extra.cards == 1 and "" or "s",
				card.ability.extra.cards == 1 and "it" or "them"
			}}
        end,
        calculate = function(self, card, context)
            if context.first_hand_drawn and not context.blueprint then
				local centers = {G.P_CENTERS.m_steel, G.P_CENTERS.m_gold}
				if next(SMODS.find_mod("ortalab")) then
					centers[#centers+1] = G.P_CENTERS.m_ortalab_rusty
				end
				if next(SMODS.find_mod("MoreFluff")) then
					centers[#centers+1] = G.P_CENTERS.m_mf_brass
				end
				
                local gy_cards = AMM.api.graveyard.get_cards()
                if #gy_cards < 1 then return end
				
				local metals = {}
				
				for i=1, #gy_cards do
					local gy_card = gy_cards[i]
					for ii=1, #centers do
						if centers[ii].key == gy_card.config.center.key then
							metals[#metals+1] = gy_card
						end
					end
				end
				if #metals < 1 then return end
                pseudoshuffle(metals, pseudoseed("scrapper"))
                metals[1]:remove_from_game()

                -- actually make cards
                for i=1, card.ability.extra.cards do
					local cardmak = create_playing_card({center = pseudorandom_element(centers, pseudoseed("scrapper"))}, G.hand)
					cardmak:set_edition(poll_edition("scrapper"), true, true)
					cardmak:set_seal(SMODS.poll_seal{key = "scrapper", mod = 10}, true, true)
                end
				
				return {
                    card = card,
                    message = localize("k_thac_scrapped"),
                    colour = G.C.JOKER_GREY,
                }
            end
        end,
        in_pool = function(self)
            return AMM.api.graveyard.count_cards() > 0
        end,
    },
    'snecko_eye', snecko_eye = {
        config = { h_size = 2, extra = {
        }},
        pos = { x = 0, y = 0 },
        cost = 7,
        rarity = 3,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {
				card.ability.h_size,
			}}
        end,
        calculate = function(self, card, context)
			local temp_drawn = context.hand_drawn or context.other_drawn
            if temp_drawn and #temp_drawn > 0 and not context.blueprint then
				return {
					colour = G.C.GREEN,
					func = function()
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
							play_sound('tarot1')
							card:juice_up(0.3, 0.5)
							return true end }))
						for i=1, #temp_drawn do
							local percent = 1.15 - (i-0.999)/(#temp_drawn-0.998)*0.3
							G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.10,func = function() temp_drawn[i]:flip();play_sound('card1', percent);temp_drawn[i]:juice_up(0.3, 0.3);return true end }))
							end
						for i=1, #temp_drawn do
							G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.0,func = function()	
								local card = temp_drawn[i]
								
								SMODS.change_base(card, nil, pseudorandom_element(SMODS.Rank.obj_buffer, pseudoseed('snecko')))
								
								return true 
							end }))
						end
						for i=1, #temp_drawn do
							local percent = 0.85 + (i-0.999)/(#temp_drawn-0.998)*0.3
							G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.10,func = function() temp_drawn[i]:flip();play_sound('tarot2', percent, 0.6);temp_drawn[i]:juice_up(0.3, 0.3);return true end }))
						end
						delay(0.1)
						return true
					end
				}
            end
        end,
    },
    'hardlyquin', hardlyquin = {
        config = { extra = {
			odds = 3,
			mult = 15,
        }},
        pos = { x = 0, y = 0 },
        cost = 3,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2],
				card.ability.extra.mult
			}}
        end,
        calculate = function(self, card, context)
			if context.joker_main then
				if SMODS.pseudorandom_probability(card, 'hardlyquin', 1, card.ability.extra.odds) then
					return { mult = card.ability.extra.mult }
				else
					return { message = localize('k_nope_ex'), colour = G.C.ORANGE }
				end
			end
        end,
    },
    'penumbra_phantasm', penumbra_phantasm = {
        config = {extra = { cards = 1 }},
        pos = { x = 0, y = 0 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
            return {vars = { card.ability.extra.cards == 1 and "a" or card.ability.extra.cards, card.ability.extra.cards == 1 and "" or "s" }}
        end,
        calculate = function(self, card, context)
            if context.amm_buried_card then
                if context.other_card:is_suit("six_Moons") and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					for i=1, card.ability.extra.cards do
						if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
							G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								delay = 0.0,
								func = (function()
										local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'penumbra_phantasm')
										card:add_to_deck()
										G.consumeables:emplace(card)
										G.GAME.consumeable_buffer = 0
									return true
								end)}))
						end
					end
					return {
						message = localize('k_plus_spectral'),
						colour = G.C.SECONDARY_SET.Spectral,
						card = card
					}
                end
            end
        end,
		dependencies = { "SixSuits" },
    },
	"golden_ratio", golden_ratio = {
        config = {extra = { Xmult = 1.618033988749894 }},
        pos = { x = 8, y = 2 },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			--info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
            return {vars = { card.ability.extra.Xmult }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and not context.repetition and not context.end_of_round then
                if context.other_card.base.value == "Ace" or context.other_card.base.value == "2" or context.other_card.base.value == "3" or context.other_card.base.value == "5" or context.other_card.base.value == "8" then
					return { xmult = card.ability.extra.Xmult }
                end
            end
        end,
	},
	"whispers_of_beyond", whispers_of_beyond = {
        config = {extra = { retriggers = 2 }},
        pos = { x = 9, y = 2 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			--info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
            return {vars = { card.ability.extra.retriggers == 1 and "once" or card.ability.extra.retriggers, card.ability.extra.retriggers == 1 and "" or " times" }}
        end,
        calculate = function(self, card, context)
            if context.retrigger_joker_check then
				if #G.jokers.cards < 6 then return end
                if context.other_card == G.jokers.cards[6] then
                    return {
                        card = context.blueprint_card or card,
                        colour = G.C.ORANGE,
                        repetitions = card.ability.extra.retriggers,
						message = localize('k_again_ex')
                    }
                end
            end
        end,
	},
    'jet_worldmage', jet_worldmage = {
        config = { extra = {
            Xchips = 1.6,
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
                card.ability.extra.Xchips
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round and context.other_card:is_suit("Spades") then
                return {
                    xchips = card.ability.extra.Xchips
                }
            end
        end,
    },
    'ruby_sunmage', ruby_sunmage = {
        config = { extra = {
            mult = 12,
			mult_curr = 0
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
                card.ability.extra.mult,
				card.ability.extra.mult_curr
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round and context.other_card:is_suit("Hearts") then
				card.ability.extra.mult_curr = card.ability.extra.mult_curr + card.ability.extra.mult
                return {
                    card = context.other_card,
					focus = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                }
            end
			if context.joker_main and card.ability.extra.mult_curr > 0 then
				return { mult = card.ability.extra.mult_curr }
			end
			if context.end_of_round and not context.repetition and not context.individual and context.cardarea == G.jokers then
				card.ability.extra.mult_curr = 0
                return {
                    card = card,
					focus = card,
                    message = localize('k_reset'),
                    colour = G.C.MULT,
                }
			end
        end,
    },
    'opal_moonmage', opal_moonmage = {
        config = { extra = {
			temp_cardlist = {},
			
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
            }}
        end,
        calculate = function(self, card, context)
			-- so the interesting thing here is
			-- *screams unintelligibly*
			if context.before then
				card.ability.extra.temp_cardlist = {}
				for i=1,#G.play.cards do
					if G.play.cards[i]:is_suit("Clubs") then
						local do_it = true
						for ii=1,#context.scoring_hand do
							if context.scoring_hand[ii] == G.play.cards[i] then do_it = false; break end
						end
						if do_it then
							card.ability.extra.temp_cardlist[#card.ability.extra.temp_cardlist+1] = {G.play.cards[i], i}
						end
					end
				end
			end
            if context.repetition and not context.end_of_round then
                -- find the card in the hand
				local index = 0
				for i=1,#G.play.cards do
					if G.play.cards[i] == context.other_card then
						index = i
						break -- no need
					end
				end
				-- check if any unscored clubs are in temp_cardlist in positions +/-1
				local ret = {}
				for i=1,#card.ability.extra.temp_cardlist do
					if card.ability.extra.temp_cardlist[i][2] == index-1 or card.ability.extra.temp_cardlist[i][2] == index+1 then
						if not ret.focus then
							-- first one
							ret = {
								focus = card.ability.extra.temp_cardlist[i][1],
								card = card,
								repetitions = 1,
								colour = G.C.ORANGE,
								message = localize("k_again_ex"),
							}
						else
							-- second one
							ret.extra = {
								focus = card.ability.extra.temp_cardlist[i][1],
								card = card,
								repetitions = 1,
								colour = G.C.ORANGE,
								message = localize("k_again_ex"),
							}
						end
					end
				end
				if ret.focus then
					return ret
				end
            end
			if context.after then
				card.ability.extra.temp_cardlist = {}
			end
        end,
    },
    'topaz_starmage', topaz_starmage = {
        config = { extra = {
            odds = 2,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2],
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round and context.other_card:is_suit("Diamonds") then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					if SMODS.pseudorandom_probability(card, 'topaz_starmage', 1, card.ability.extra.odds) then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						return {
							extra = {func = function() 
                                local card = create_card('Oddity',G.consumeables, nil, nil, nil, nil, nil, 'topaz_starmage')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end},
							message = localize("k_plus_oddity"),
							card = card,
							focus = context.other_card,
							colour = G.C.PURPLE,
						}
					else
						return {
							message = localize('k_nope_ex'),
							card = card,
							focus = context.other_card,
							colour = G.C.PURPLE
						}
					end
				end
            end
        end,
    },
    'amethyst_starmage', amethyst_starmage = {
        config = { extra = {
            odds = 3,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2],
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round and context.other_card:is_suit("six_Stars") then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					if SMODS.pseudorandom_probability(card, 'amethyst_starmage', 1, card.ability.extra.odds) then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						return {
							extra = {func = function() 
                                local card = create_card('Zodiac',G.consumeables, nil, nil, nil, nil, nil, 'amethyst_starmage')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end},
							message = localize("ortalab_zodiac_add"),
							card = card,
							focus = context.other_card,
							colour = G.C.RED,
						}
					else
						return {
							message = localize('k_nope_ex'),
							card = card,
							focus = context.other_card,
							colour = G.C.RED
						}
					end
				end
            end
        end,
		dependencies = { "SixSuits", "ortalab" },
    },
    'onyx_moonmage', onyx_moonmage = {
        config = { extra = {
            chips = 1,
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
                card.ability.extra.chips,
				card.ability.extra.chips*((G.deck and G.deck.cards) and #G.deck.cards or 78)
            }}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round and context.other_card:is_suit("six_Moons") then
                return {
					chips = card.ability.extra.chips * #G.deck.cards
				}
            end
        end,
		dependencies = { "SixSuits" },
    },
	'coven', coven = {
        config = {
            extra = {
                mult = 15,
            },
        },
        pos = { x = 0, y = 0 },
        cost = 4,
        rarity = 1,
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = { card.ability.extra.mult }}
        end,
        calculate = function(self, card, context)
            if context.joker_main then
				local ranks = {}
				local ranknum = 0
				for i=1,#G.play.cards do
					if not ranks[G.play.cards[i].base.value] and not SMODS.has_no_rank(G.play.cards[i]) then
						ranks[G.play.cards[i].base.value] = true
						ranknum = ranknum + 1
					end
				end
				if ranknum >= 3 then
					return { mult = card.ability.extra.mult }
				end
            end
        end,
    },
	'meteorite', meteorite = {
        config = { extra = {
			odds = 4,
			level_up = 2,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --info_queue[#info_queue+1] = G.P_CENTERS.m_thac_jewel
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2],
				card.ability.extra.level_up
            }}
        end,
        calculate = function(self, card, context)
            if context.before then
				for i=1, #G.hand.cards do
					if G.hand.cards[i]:is_suit("six_Stars") and SMODS.pseudorandom_probability(card, 'meteorite', 1, card.ability.extra.odds) then
						G.GAME.ortalab.temp_levels = G.GAME.ortalab.temp_levels + card.ability.extra.level_up
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
							card_eval_status_text(G.hand.cards[i], 'extra', nil, nil, nil, {message = localize('ortalab_level_up'), colour = G.C.PURPLE, instant = true})
						return true end}))
					end
				end
            end
        end,
		dependencies = { "SixSuits", "ortalab" },
    },
	'olivine', olivine = {
        config = { extra = {
			reduction = 0.04,
        }},
        pos = { x = 0, y = 0 },
        cost = 6,
        rarity = 2,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --info_queue[#info_queue+1] = G.P_CENTERS.m_thac_jewel
            return {vars = {card.ability.extra.reduction * 100}}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.hand and context.other_card:is_suit("six_Moons") and not context.end_of_round then
				return {
					extra = {focus = context.other_card,
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
		dependencies = { "SixSuits" },
	},
	'cartowomancer', cartowomancer = {
        config = { extra = {
        }},
        pos = { x = 8, y = 3 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'astro'} end
			info_queue[#info_queue+1] = { key = "petting", set = "Other" }
            return {vars = {}}
        end,
		func_cartowo = function(cardkey, direction)
			local ret = nil
			local table = {
				["clockwise"] = {
					["c_fool"] = "c_mf_rot_fool",
					["c_magician"] = "c_mf_rot_magician",
					["c_high_priestess"] = "c_mf_rot_high_priestess",
					["c_empress"] = "c_mf_rot_empress",
					["c_emperor"] = "c_mf_rot_emperor",
					["c_heirophant"] = "c_mf_rot_heirophant",
					["c_lovers"] = "c_mf_rot_lovers",
					["c_chariot"] = "c_mf_rot_chariot",
					["c_justice"] = "c_mf_rot_justice",
					["c_hermit"] = "c_mf_rot_hermit",
					["c_wheel_of_fortune"] = "c_mf_rot_wheel",
					["c_strength"] = "c_mf_rot_strength",
					["c_hanged_man"] = "c_mf_rot_hanged_man",
					["c_death"] = "c_mf_rot_death",
					["c_temperance"] = "c_mf_rot_temperance",
					["c_devil"] = "c_mf_rot_devil",
					["c_tower"] = "c_mf_rot_tower",
					["c_star"] = "c_mf_rot_star",
					["c_moon"] = "c_mf_rot_moon",
					["c_sun"] = "c_mf_rot_sun",
					["c_judgement"] = "c_mf_rot_judgement",
					["c_world"] = "c_mf_rot_world",
					
					["c_thac_universe"] = "c_thac_rot_universe",
					["c_thac_void"] = "c_thac_rot_void",
					["c_thac_happy_squirrel"] = "c_thac_rot_happy_squirrel",
					["c_thac_artist"] = "c_thac_rot_artist",
					["c_thac_veteran"] = "c_thac_rot_veteran",
					["c_thac_drunkard"] = "c_thac_rot_drunkard",
					["c_thac_juggler"] = "c_thac_rot_juggler",
					["c_thac_joker"] = "c_thac_rot_joker",
					
					["c_six_star_q"] = "c_thac_rotflip_star",
					["c_six_moon_q"] = "c_thac_rotflip_moon",
					
					["j_thac_cartowomancer"] = "j_thac_rot_cartowomancer",
					["j_cartomancer"] = "j_mf_rot_cartomancer",
				},
				["counter-clockwise"] = {
				},
			}
			for k, v in pairs(table["clockwise"]) do
				table["counter-clockwise"][v] = k
			end
			if table[direction][cardkey] then ret = table[direction][cardkey] end
			return ret
		end,
        calculate = function(self, card, context)
            if context.amm_pet_card and self.func_cartowo(context.amm_pet_card.config.center.key, context.amm_pet_direction) and G.P_CENTERS[self.func_cartowo(context.amm_pet_card.config.center.key, context.amm_pet_direction)] then
				return {
					message = localize("k_thac_owo"),
					card = context.amm_pet_card,
					focus = context.amm_pet_card,
					colour = G.C.GREEN,
                    func = function()
						context.amm_pet_card:set_ability(G.P_CENTERS[self.func_cartowo(context.amm_pet_card.config.center.key, context.amm_pet_direction)])
						context.amm_pet_card:set_cost()
						context.amm_pet_card:set_sprites(context.amm_pet_card.config.center)
					end,
				}
            end
        end,
		dependencies = { "MoreFluff" },
	},
	'rot_cartowomancer', rot_cartowomancer = {
        config = { extra = {
        }},
        pos = { x = 0, y = 0 },
		atlas = "specialjoker",
		display_size = { w = 113, h = 113 },
        cost = 6,
        rarity = 2,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'astro'} end
			info_queue[#info_queue+1] = { key = "petting", set = "Other" }
            return {vars = {}}
        end,
		func_cartowo = function(cardkey, direction)
			local ret = nil
			local table = {
				["clockwise"] = {
					["c_fool"] = "c_mf_rot_fool",
					["c_magician"] = "c_mf_rot_magician",
					["c_high_priestess"] = "c_mf_rot_high_priestess",
					["c_empress"] = "c_mf_rot_empress",
					["c_emperor"] = "c_mf_rot_emperor",
					["c_heirophant"] = "c_mf_rot_heirophant",
					["c_lovers"] = "c_mf_rot_lovers",
					["c_chariot"] = "c_mf_rot_chariot",
					["c_justice"] = "c_mf_rot_justice",
					["c_hermit"] = "c_mf_rot_hermit",
					["c_wheel_of_fortune"] = "c_mf_rot_wheel",
					["c_strength"] = "c_mf_rot_strength",
					["c_hanged_man"] = "c_mf_rot_hanged_man",
					["c_death"] = "c_mf_rot_death",
					["c_temperance"] = "c_mf_rot_temperance",
					["c_devil"] = "c_mf_rot_devil",
					["c_tower"] = "c_mf_rot_tower",
					["c_star"] = "c_mf_rot_star",
					["c_moon"] = "c_mf_rot_moon",
					["c_sun"] = "c_mf_rot_sun",
					["c_judgement"] = "c_mf_rot_judgement",
					["c_world"] = "c_mf_rot_world",
					
					["c_thac_universe"] = "c_thac_rot_universe",
					["c_thac_void"] = "c_thac_rot_void",
					["c_thac_happy_squirrel"] = "c_thac_rot_happy_squirrel",
					["c_thac_artist"] = "c_thac_rot_artist",
					["c_thac_veteran"] = "c_thac_rot_veteran",
					["c_thac_drunkard"] = "c_thac_rot_drunkard",
					["c_thac_juggler"] = "c_thac_rot_juggler",
					["c_thac_joker"] = "c_thac_rot_joker",
					
					["c_six_star_q"] = "c_thac_rotflip_star",
					["c_six_moon_q"] = "c_thac_rotflip_moon",
					
					["j_thac_cartowomancer"] = "j_thac_rot_cartowomancer",
					["j_cartomancer"] = "j_mf_rot_cartomancer",
				},
				["counter-clockwise"] = {
				},
			}
			for k, v in pairs(table["clockwise"]) do
				table["counter-clockwise"][v] = k
			end
			if table[direction][cardkey] then ret = table[direction][cardkey] end
			return ret
		end,
        calculate = function(self, card, context)
            if context.amm_pet_card and self.func_cartowo(context.amm_pet_card.config.center.key, context.amm_pet_direction) and G.P_CENTERS[self.func_cartowo(context.amm_pet_card.config.center.key, context.amm_pet_direction)] then
				return {
					message = localize("k_thac_owo"),
					card = context.amm_pet_card,
					focus = context.amm_pet_card,
					colour = G.C.PURPLE,
                    func = function()
						context.amm_pet_card:set_ability(G.P_CENTERS[self.func_cartowo(context.amm_pet_card.config.center.key, context.amm_pet_direction)])
						context.amm_pet_card:set_cost()
						context.amm_pet_card:set_sprites(context.amm_pet_card.config.center)
					end,
				}
            end
        end,
		dependencies = { "MoreFluff" },
	},
	"nekogloop", nekogloop = {
		pos = { x = 0, y = 4 },
		rarity = "hmlt_player",
		cost = 4,
		dependencies = { "homelatro" },
		config = {
			extra = {
				numer = 1,
				denom = 4.13,
			},
		},
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			local probvars = {SMODS.get_probability_vars(card, card.ability.extra.numer, card.ability.extra.denom)}
			return {vars = {
				probvars[1],
				probvars[2],
			}}
		end,
		calculate = function(self, card, context)
			if context.debuff_card and context.debuff_card:is_suit("Hearts", true) then
				return { prevent_debuff = true }
			end
			if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
				if SMODS.pseudorandom_probability(card, 'thac_nekogloop_extinct', card.ability.extra.numer, card.ability.extra.denom) then
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('slice1')
							G.E_MANAGER:add_event(Event({
								trigger = 'after',
								delay = 0,
								blockable = false,
								func = function()
									card:remove()
									G.GAME.pool_flags.thac_nekogloop_extinct = true
									return true
								end
							}))
						return true
					end }))
					return { message = localize('hmlt_extinct') }
				else
					return { message = localize('hmlt_safe') }
				end
			end
		end,
		no_pool_flag = 'thac_nekogloop_extinct',
	},
	"autumnmood", autumnmood = {
		pos = { x = 1, y = 4 },
		rarity = "hmlt_player",
		cost = 4,
		dependencies = { "homelatro" },
		config = {
			extra = {
				numer = 1,
				denom = 4.13,
				mult = 3,
				threshold = 3,
			},
		},
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			local probvars = {SMODS.get_probability_vars(card, card.ability.extra.numer, card.ability.extra.denom)}
			if card.area.config.collection then
				return {vars = {
					probvars[1],
					probvars[2],
					card.ability.extra.mult,
					math.floor(card.ability.extra.threshold),
					"N/A",
				}}
			end
			local threezones = 0
			for k,v in ipairs(G.I.CARDAREA) do
				if v.cards and #v.cards == math.floor(card.ability.extra.threshold) then threezones = threezones + 1 end
			end
			return {vars = {
				probvars[1],
				probvars[2],
				card.ability.extra.mult,
				math.floor(card.ability.extra.threshold),
				card.ability.extra.mult * threezones,
			}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				local threezones = 0
				for k,v in ipairs(G.I.CARDAREA) do
					if v.cards and #v.cards == math.floor(card.ability.extra.threshold) then threezones = threezones + 1 end
				end
				return { mult = card.ability.extra.mult * threezones }
			end
			if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
				if SMODS.pseudorandom_probability(card, 'thac_autumnmood_extinct', card.ability.extra.numer, card.ability.extra.denom) then
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('slice1')
							G.E_MANAGER:add_event(Event({
								trigger = 'after',
								delay = 0,
								blockable = false,
								func = function()
									card:remove()
									G.GAME.pool_flags.thac_autumnmood_extinct = true
									return true
								end
							}))
						return true
					end }))
					return { message = localize('hmlt_extinct') }
				else
					return { message = localize('hmlt_safe') }
				end
			end
		end,
		no_pool_flag = 'thac_autumnmood_extinct',
	},
	"", [""] = {
		pos = { x = 2, y = 4 },
		rarity = "hmlt_player",
		cost = 4,
		dependencies = { "homelatro" },
		config = {
			extra = {
				numer = 1,
				denom = 4.13,
				mult = 3,
			},
		},
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.e_negative
			local probvars = {SMODS.get_probability_vars(card, card.ability.extra.numer, card.ability.extra.denom)}
			if card.area.config.collection then
				return {vars = {
					probvars[1],
					probvars[2],
					card.ability.extra.mult,
					"N/A",
				}}
			end
			local negatives = 0
			for k,v in ipairs(G.playing_cards) do
				if v.edition and v.edition.negative then negatives = negatives + 1 end
			end
			for k,v in ipairs(G.jokers.cards) do
				if v.edition and v.edition.negative then negatives = negatives + 1 end
			end
			for k,v in ipairs(G.consumeables.cards) do
				if v.edition and v.edition.negative then negatives = negatives + 1 end
			end
			return {vars = {
				probvars[1],
				probvars[2],
				card.ability.extra.mult,
				card.ability.extra.mult * negatives,
			}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				local negatives = 0
				for k,v in ipairs(G.playing_cards) do
					if v.edition and v.edition.negative then negatives = negatives + 1 end
				end
				for k,v in ipairs(G.jokers.cards) do
					if v.edition and v.edition.negative then negatives = negatives + 1 end
				end
				for k,v in ipairs(G.consumeables.cards) do
					if v.edition and v.edition.negative then negatives = negatives + 1 end
				end
				return { mult = card.ability.extra.mult * negatives }
			end
			if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
				if SMODS.pseudorandom_probability(card, 'thac__extinct', card.ability.extra.numer, card.ability.extra.denom) then
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('slice1')
							G.E_MANAGER:add_event(Event({
								trigger = 'after',
								delay = 0,
								blockable = false,
								func = function()
									card:remove()
									G.GAME.pool_flags.thac__extinct = true
									return true
								end
							}))
						return true
					end }))
					return { message = localize('hmlt_extinct') }
				else
					return { message = localize('hmlt_safe') }
				end
			end
		end,
		no_pool_flag = 'thac__extinct',
	},
	"hmlt_knightofheart", hmlt_knightofheart = {
		pos = { x = 0, y = 5 },
		rarity = "hmlt_godtier",
		cost = 8,
		dependencies = { "homelatro" },
		config = { extra = {
		}},
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
			return { vars = {
			}}
		end,
		calculate = function(self, card, context)
			if context.debuff_card and context.debuff_card:is_suit("Hearts", true) then
				return { prevent_debuff = true }
			end
			if context.amm_buried_card and context.other_card:is_suit("Hearts") then
				local _card = copy_card(context.other_card, nil, nil, G.playing_card)
				return { 
					message = localize('k_copied_ex'),
					func = function()
						_card:add_to_deck()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						G.deck:emplace(_card)
						table.insert(G.playing_cards, _card)
						playing_card_joker_effects({true})
						return true
					end,
				}
			end
		end,
		yes_pool_flag = "thac_nekogloop_extinct",
	},
	"hmlt_witchofmind", hmlt_witchofmind = {
		pos = { x = 1, y = 5 },
		rarity = "hmlt_godtier",
		cost = 8,
		dependencies = { "homelatro" },
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			if card.area.config.collection then
				return {vars = {
					card.ability.extra.xmult,
					math.floor(card.ability.extra.threshold),
					"N/A",
				}}
			end
			local threezones = 0
			for k,v in ipairs(G.I.CARDAREA) do
				if v.cards and #v.cards == math.floor(card.ability.extra.threshold) then threezones = threezones + 1 end
			end
			return {vars = {
				card.ability.extra.xmult,
				math.floor(card.ability.extra.threshold),
				1 + (card.ability.extra.xmult * threezones),
			}}
		end,
		config = { extra = {
			xmult = 3,
			threshold = 3,
		}},
		calculate = function(self, card, context)
			if context.joker_main then
				local threezones = 0
				for k,v in ipairs(G.I.CARDAREA) do
					if v.cards and #v.cards == math.floor(card.ability.extra.threshold) then threezones = threezones + 1 end
				end
				return { xmult = 1 + (card.ability.extra.xmult * threezones) }
			end
		end,
		yes_pool_flag = "thac_autumnmood_extinct",
	},
	"hmlt_lordofvoid", hmlt_lordofvoid = {
		pos = { x = 2, y = 5 },
		rarity = "hmlt_godtier",
		cost = 8,
		dependencies = { "homelatro" },
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.e_negative
			local probvars = {SMODS.get_probability_vars(card, card.ability.extra.numer, card.ability.extra.denom)}
			local probvars2 = {SMODS.get_probability_vars(card, 1, 10)}
			if card.area.config.collection then
				return {vars = {
					card.ability.extra.mult,
					"N/A",
					probvars[1],
					probvars[2],
					"",
				}}
			end
			local negatives = 0
			for k,v in ipairs(G.playing_cards) do
				if v.edition and v.edition.negative then negatives = negatives + 1 end
			end
			for k,v in ipairs(G.jokers.cards) do
				if v.edition and v.edition.negative then negatives = negatives + 1 end
			end
			for k,v in ipairs(G.consumeables.cards) do
				if v.edition and v.edition.negative then negatives = negatives + 1 end
			end
			return { vars = {
				card.ability.extra.mult,
				card.ability.extra.mult * negatives,
				probvars[1],
				probvars[2],
				probvars2[1] >= probvars2[2] and localize("k_thac_hubris") or "",
			}}
		end,
		config = {extra = {
			mult = 6,
			numer = 33,
			denom = 666,
		}},
		calculate = function(self, card, context)
			if context.joker_main then
				local negatives = 0
				for k,v in ipairs(G.playing_cards) do
					if v.edition and v.edition.negative then negatives = negatives + 1 end
				end
				for k,v in ipairs(G.jokers.cards) do
					if v.edition and v.edition.negative then negatives = negatives + 1 end
				end
				for k,v in ipairs(G.consumeables.cards) do
					if v.edition and v.edition.negative then negatives = negatives + 1 end
				end
				return { mult = card.ability.extra.mult * negatives }
			end
			if context.card_added and context.card.ability.set == "Joker" and (not context.card.edition or context.card.edition == {}) and SMODS.pseudorandom_probability(card, 'thac_lordofvoid2', card.ability.extra.numer, card.ability.extra.denom) then
				local probvars2 = {SMODS.get_probability_vars(card, 1, 10)}
				if probvars2[1] >= probvars2[2] then
					return {
						func = function()
							card:shatter()
							context.card:shatter()
							return true
						end,
						message = localize('k_thac_not_fun')
					}
				end
				return {
					func = function()
						context.card:set_edition{negative = true}
						return true
					end,
					message = localize('k_thac_negative')
				}
			end
		end,
		yes_pool_flag = "thac__extinct",
	},
    'stirring_graves', stirring_graves = {
        config = { extra = {
            retriggers = 1,
        }},
        pos = { x = 0, y = 0 },
        cost = 9,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
            info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = {
                math.floor(card.ability.extra.retriggers),
            }}
        end,
        calculate = function(self, card, context)
            if context.amm_buried_card then
                context.other_card.ability.perma_retriggers = context.other_card.ability.perma_retriggers + math.floor(card.ability.extra.retriggers)
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.ORANGE,
                }
            end
        end,
		dependencies = { "allinjest" },
    },
}

SMODS.Atlas{
	key = "LooksLikeTheJokers",
	path = "LooksLikeTheJokers.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "specialjoker",
	path = "specialjoker.png",
	px = 113,
	py = 113,
}

--jokers
for _, k in ipairs(jokers) do
	local v = jokers[k]
	if not v.rarity then v.rarity = 1 end
	TheAutumnCircus.data.buffer_insert("Jokers", v, {key = k, atlas = "LooksLikeTheJokers"})
    if v.pos.x == 0 and v.pos.y == 0 then
        if v.load_check then
            if v.load_check() then TheAutumnCircus.placeholder_jokers[#TheAutumnCircus.placeholder_jokers+1] = "j_thac_" .. k end
        else
            TheAutumnCircus.placeholder_jokers[#TheAutumnCircus.placeholder_jokers+1] = "j_thac_" .. k
        end
    end
end