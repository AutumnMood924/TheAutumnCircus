local aspects = {
	'breath', breath = {
		name = "breath",
		display_name = "Breath",
		text = {
			'{X:chips,C:white} X3 {} chips'
		},
		effect = 'breath',
		config = {
			extra = {
				Xchips = 3
			}
		},
		pos = { x = 0, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.Xmult}}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.main_scoring then
				return {
					xchips = 3
				}
			end
		end,
        badge_colour = "0086EB",
        badge_text_colour = "10E0FF"
	},
	'life', life = {
		name = "life",
		display_name = "Life",
		text = {
			'{C:green}1 in 3{} chance',
            'to gain {C:blue}+2 Hands{}',
            'when scored'
		},
		effect = 'life',
		config = {
			extra = {
				hands = 2,
                odds = 3
			}
		},
		pos = { x = 1, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.main_scoring and pseudorandom('life_aspect') < G.GAME.probabilities.normal / 3 then
				return {
                    message = "+2 Hands",
                    colour = G.C.BLUE,
                    func = function()
                        ease_hands_played(2)
                    end,
				}
			end
		end,
        badge_colour = "CCC3B4",
        badge_text_colour = "77C350"
	},
	'light', light = {
		name = "light",
		display_name = "Light",
		text = {
			'Earn {C:money}$5{} and each',
            '{C:attention}Joker{} and {C:attention}consumable{}',
            'gains {C:money}$2{} of sell value',
            'when this card scores'
		},
		effect = 'light',
		config = {
			extra = {
				money = 5,
                value = 2
			}
		},
		pos = { x = 2, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.main_scoring then
				return {
                    dollars = 5,
					message = localize('k_val_up'),
                    colour = G.C.MONEY,
                    func = function()
                        for k,v in ipairs(G.jokers.cards) do
                            v.ability.extra_value = (v.ability.extra_value or 0) + 2
                            v:set_cost()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'immediate',
                                delay = 0.0413,
                                func = function()
                                    v:juice_up(0.3, 0.3)
                                    return true
                                end}))
                        end
                    end,
				}
			end
		end,
        badge_colour = "F98100",
        badge_text_colour = "FFF547"
	},
	'time', time = {
		name = "time",
		display_name = "Time",
		text = {
			'{C:red}+1 Discard{} when',
            'discarded or scored'
		},
		effect = 'time',
		config = {
			extra = {
				discards = 1
			}
		},
		pos = { x = 3, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if (context.cardarea == G.play and context.main_scoring) or (context.discard and context.other_card == card) then
				return {
					message = "+1 Discard",
                    colour = G.C.RED,
                    func = function()
                        ease_discard(1)
                    end,
				}
			end
		end,
        badge_colour = "B70D0E",
        badge_text_colour = "FF2106"
	},
	'heart', heart = {
		name = "heart",
		display_name = "Heart",
		text = {
			'{X:mult,C:white}X3{C:mult} Mult'
		},
		effect = 'heart',
		config = {
			extra = {
				Xmult = 3
			}
		},
		pos = { x = 4, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.main_scoring then
				return {
					Xmult = 3
				}
			end
		end,
        badge_colour = "6E0E2E",
        badge_text_colour = "BD1864"
	},
	'rage', rage = {
		name = "rage",
		display_name = "Rage",
		text = {
			'Each played card',
            'permanently gains',
            '{X:mult,C:white}X0.15{} Mult when',
            'this card is scored'
		},
		effect = 'rage',
		config = {
			extra = {
				Xmult = 0.15
			}
		},
		pos = { x = 5, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.before then
				return {
					message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    func = function()
                        for k,v in ipairs(G.play.cards) do
                            v.ability.perma_xmult = v.ability.perma_xmult + 0.15
                            v:juice_up(0.3, 0.3)
                        end
                    end,
				}
			end
		end,
        badge_colour = "391E71",
        badge_text_colour = "9C4DAD"
	},
	'blood', blood = {
		name = "blood",
		display_name = "Blood",
		text = {
			'{C:chips}+80 chips{} for each card held',
			'in hand that {C:attention}shares a suit{}',
			'with this card when scored',
			'{C:mult}+25 Mult{} for each card held',
			'in hand that {C:attention}shares a rank{}',
			'with this card when scored',
		},
		effect = 'blood',
		config = {
			extra = {
				chips = 80,
				mult = 25,
			}
		},
		pos = { x = 0, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.main_scoring then
				--tally up matching suits
				local suits = 0
				if not SMODS.has_no_suit(card) then
					for k,v in ipairs(G.hand.cards) do
						if not (SMODS.has_no_suit(v)) then
							-- shortcut if either card is wild
							if SMODS.has_any_suit(card) or SMODS.has_any_suit(v) then
								suits = suits + 1
							else
								--iterate over all suits there is no better way this is stupid
								for _, suit in ipairs(SMODS.Suit.obj_buffer) do
									if card:is_suit(suit) and v:is_suit(suit) then
										suits = suits + 1
										break
									end
								end
							end
						end
					end
				end
				--tally up matching ranks
				local ranks = 0
				if not SMODS.has_no_rank(card) then
					for k,v in ipairs(G.hand.cards) do
						if not SMODS.has_no_rank(v) and card.base.value == v.base.value then
							ranks = ranks + 1
						end
					end
				end
				return {
					chips = suits * 80,
					mult = ranks * 25,
				}
			end
		end,
        badge_colour = "3D1909",
        badge_text_colour = "BA1915"
	},
	'doom', doom = {
		name = "doom",
		display_name = "Doom",
		text = {
			'Blind requirement',
            '{C:attention}-25%{} when scored'
		},
		effect = 'doom',
		config = {
			extra = {
				reduction = 0.25,
			}
		},
		pos = { x = 1, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = {25}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play then
				return {
					extra = {focus = card,
					message = localize{type = 'variable', key = 'a_blind_minus_percent',
						vars = {25}}, },
					func = function()
						G.E_MANAGER:add_event(Event({
							trigger = 'immediate',
							delay = 0.0,
							func = function()
								AMM.mod_blind(0.75, nil, true)
								return true
							end}))
					end
				}
			end
		end,
        badge_colour = "20401F",
        badge_text_colour = "000000"
	},
	'void', void = {
		name = "void",
		display_name = "Void",
		text = {
			"Scores this card's",
            "{C:chips}Chips{} and {C:mult}Mult{}",
            "values while it is",
            "held in hand"
		},
		effect = 'void',
		config = {
			extra = {
			}
		},
		pos = { x = 2, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.hand and context.main_scoring then
				return {
					chips = card:get_chip_bonus(),
                    mult = card:get_chip_mult(),
                    Xmult = math.max(1, card:get_chip_x_mult()),
				}
			end
		end,
        badge_colour = "033476",
        badge_text_colour = "00164F"
	},
	'space', space = {
		name = "space",
		display_name = "Space",
		text = {
			'{X:mult,C:white}X0.5{} Mult for',
			'each card held in',
			'hand when scored',
			'{C:inactive}(Starts at {X:mult,C:white}X1{C:inactive} Mult)'
		},
		effect = 'space',
		config = {
			extra = {
				Xmult = 0.5
			}
		},
		pos = { x = 3, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.Xmult}}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.main_scoring then
				return {
					Xmult = 1 + (0.5 * #G.hand.cards)
				}
			end
		end,
        badge_colour = "000000",
        badge_text_colour = "FFFFFF"
	},
	'mind', mind = {
		name = "mind",
		display_name = "Mind",
		text = {
			'This card permanently',
			'gains {X:mult,C:white}X0.2{} Mult while',
			'held in hand each',
			'{C:blue}Hand{} played while this',
			'card is held in hand'
		},
		effect = 'mind',
		config = {
			extra = {
				Xmult = 0.2
			}
		},
		pos = { x = 4, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.Xmult}}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.hand and context.before then
				return {
					message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    func = function()
						card.ability.perma_hxmult = card.ability.perma_hxmult + 0.2
                    end,
				}
			end
		end,
        badge_colour = "50B250",
        badge_text_colour = "46FBC4"
	},
	'hope', hope = {
		name = "hope",
		display_name = "Hope",
		text = {
			'Retrigger this card',
            '{C:attention}1{} time for each {C:blue}Hand{}',
            'played this round'
		},
		effect = 'hope',
		config = {
			extra = {
				retrigger = 1
			}
		},
		pos = { x = 5, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.repetition_only then
				return {
					repetitions = G.GAME.round_resets.hands_played,
                    message = localize('k_again_ex')
				}
			end
		end,
        badge_colour = "FFE094",
        badge_text_colour = "FDFDFD"
	},
}

SMODS.Atlas{
	key = "HamSpect",
	path = "HamSpect.png",
	px = 71,
	py = 95,
}

--aspects
for _, k in ipairs(aspects) do
	local v = aspects[k]
	TheAutumnCircus.data.buffer_insert("Aspects", v, {key = k, atlas = "HamSpect"})
end