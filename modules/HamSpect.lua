local aspects = {
	'breath', breath = {
		name = "breath",
		effect = 'breath',
		config = {
			extra = {
				Xchips = 3
			}
		},
		pos = { x = 0, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = {self.config.extra.Xchips}}
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
			if context.cardarea == G.play and context.main_scoring and SMODS.pseudorandom_probability(card, 'life_aspect', 1, 3) then
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
		effect = 'rage',
		config = {
			extra = {
				chips = 60
			}
		},
		pos = { x = 5, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = { }}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.play and context.main_scoring then
				return {
					chips = G.GAME.current_round.hands_played == 0 and 300 or 60
				}
			end
		end,
        badge_colour = "391E71",
        badge_text_colour = "9C4DAD"
	},
	'blood', blood = {
		name = "blood",
		boxes = { 3, 3, },
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
                    xchips = math.max(1, card:get_chip_x_bonus()),
                    xmult = math.max(1, card:get_chip_x_mult()),
				}
			end
		end,
        badge_colour = "033476",
        badge_text_colour = "00164F"
	},
	'space', space = {
		name = "space",
		effect = 'space',
		config = {
			extra = {
				Xmult = 0.5
			}
		},
		pos = { x = 3, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = {self.config.extra.Xmult}}
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
		effect = 'mind',
		config = {
			extra = {
				mult = 5
			}
		},
		pos = { x = 4, y = 1 },
		loc_vars = function(self, info_queue, card)
			return {vars = {self.config.extra.mult}}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.hand and context.before then
				return {
					message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    func = function()
						card.ability.perma_h_mult = math.max(card.ability.perma_h_mult, 0)
						card.ability.perma_h_mult = card.ability.perma_h_mult + 5
                    end,
				}
			end
		end,
        badge_colour = "50B250",
        badge_text_colour = "46FBC4"
	},
	'hope', hope = {
		name = "hope",
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
			if (context.repetition_only) then
				return {
					repetitions = (G.GAME.current_round.hands_left == 0) and 3 or 1,
                    message = localize('k_again_ex'),
					card = card
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