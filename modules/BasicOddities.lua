local money_function = function(self, area, copier)
	local used_tarot = copier or self
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		play_sound('timpani')
		used_tarot:juice_up(0.3, 0.5)
		ease_dollars(math.max(0,self.ability.extra.dollars), true)
		return true end }))
	delay(0.6)
end

local chip_function = function(self, area, copier)
	local used_tarot = copier or self
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	for i=1, #G.hand.cards do
		if G.hand.cards[i].highlighted == true then
			G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus or 0
			G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus + self.ability.extra.chips
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
				card_eval_status_text(G.hand.cards[i], 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS, instant = true})
			return true end}))
		end
	end
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
	delay(0.5)
end

local oddities = {
	one_jollar = {
		name = "$1",
		text = {
			'Redeemable for {C:money}$#1#{}',
		},
		effect = 'MONIE',
		config = {
			extra = {
				dollars = 1
			}
		},
		pos = { x = 0, y = 0 },
		cost = 1,
		loc_def = function(_c) return { _c.config.extra.dollars } end,
		use = money_function,
		can_use = function(self) return true end,
	},
	two_jollar = {
		name = "$2",
		text = {
			'Redeemable for {C:money}$#1#{}',
		},
		effect = 'MONIE',
		config = {
			extra = {
				dollars = 2
			}
		},
		pos = { x = 1, y = 0 },
		cost = 2,
		loc_def = function(_c) return { _c.config.extra.dollars } end,
		use = money_function,
		can_use = function(self) return true end,
	},
	five_jollar = {
		name = "$5",
		text = {
			'Redeemable for {C:money}$#1#{}',
		},
		effect = 'MONIE',
		config = {
			extra = {
				dollars = 5
			}
		},
		pos = { x = 2, y = 0 },
		cost = 5,
		rarity = 2,
		loc_def = function(_c) return { _c.config.extra.dollars } end,
		use = money_function,
		can_use = function(self) return true end,
	},
	ten_jollar = {
		name = "$10",
		text = {
			'Redeemable for {C:money}$#1#{}',
		},
		effect = 'MONIE',
		config = {
			extra = {
				dollars = 10
			}
		},
		pos = { x = 3, y = 0 },
		cost = 10,
		rarity = 2,
		loc_def = function(_c) return { _c.config.extra.dollars } end,
		use = money_function,
		can_use = function(self) return true end,
	},
	twenty_jollar = {
		name = "$20",
		text = {
			'Redeemable for {C:money}$#1#{}',
		},
		effect = 'MONIE',
		config = {
			extra = {
				dollars = 20
			}
		},
		pos = { x = 4, y = 0 },
		cost = 20,
		rarity = 3,
		loc_def = function(_c) return { _c.config.extra.dollars } end,
		use = money_function,
		can_use = function(self) return true end,
	},
	pot_of_joker = {
		name = "Pot of Joker",
		text = {
			'Draw #1# cards',
		},
		effect = 'BUT WHAT DOES POT OF GREED DO',
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 1 },
		rarity = 1,
		loc_def = function(_c) return { _c.config.extra.cards } end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			local remember = G.hand.config.card_limit
			G.hand.config.card_limit = #G.hand.cards + self.ability.extra.cards
			G.FUNCS.draw_from_deck_to_hand(self.ability.extra.cards)
			G.hand.config.card_limit = remember
			delay(0.6)
		end,
		can_use = function(self) return #G.hand.cards > 1 and #G.deck.cards > 1 end,
	},
	green_chip = {
		name = "Green Chip",
		text = {
			'Up to {C:attention}#1#{} selected',
			'cards permanently gain',
			'{C:chips}+#2#{} Chips when scored',
		},
		effect = 'CHIP',
		config = {
			max_highlighted = 2,
			extra = {
				chips = 10
			}
		},
		pos = { x = 5, y = 0, scale_h = 0.75 },
		cost = 2,
		loc_def = function(_c) return { _c.config.max_highlighted, _c.config.extra.chips } end,
		use = chip_function,
	},
	yellow_chip = {
		name = "Yellow Chip",
		text = {
			'Up to {C:attention}#1#{} selected',
			'cards permanently gain',
			'{C:chips}+#2#{} Chips when scored',
		},
		effect = 'CHIP',
		config = {
			max_highlighted = 4,
			extra = {
				chips = 5
			}
		},
		pos = { x = 6, y = 0, scale_h = 0.75 },
		cost = 4,
		loc_def = function(_c) return { _c.config.max_highlighted, _c.config.extra.chips } end,
		use = chip_function,
	},
	red_blue_chip = {
		name = "Red-Blue Chip",
		text = {
			'Up to {C:attention}#1#{} selected',
			'cards permanently gain',
			'{C:chips}+#2#{} Chips when scored',
		},
		effect = 'CHIP',
		config = {
			max_highlighted = 2,
			extra = {
				chips = 20
			}
		},
		pos = { x = 7, y = 0, scale_h = 0.75 },
		rarity = 2,
		cost = 5,
		loc_def = function(_c) return { _c.config.max_highlighted, _c.config.extra.chips } end,
		use = chip_function,
	},
	purple_chip = {
		name = "Purple Chip",
		text = {
			'Up to {C:attention}#1#{} selected',
			'cards permanently gain',
			'{C:chips}+#2#{} Chips when scored',
		},
		effect = 'CHIP',
		config = {
			max_highlighted = 4,
			extra = {
				chips = 10
			}
		},
		pos = { x = 8, y = 0, scale_h = 0.75 },
		rarity = 2,
		cost = 7,
		loc_def = function(_c) return { _c.config.max_highlighted, _c.config.extra.chips } end,
		use = chip_function,
	},
	power_chip = {
		name = "Power Chip",
		text = {
			'{C:attention}#1#{} selected',
			'card permanently gains',
			'{C:chips}+#2#{} Chips when scored',
		},
		effect = 'CHIP',
		config = {
			max_highlighted = 1,
			extra = {
				chips = 50
			}
		},
		pos = { x = 9, y = 0, scale_h = 0.75 },
		rarity = 3,
		cost = 10,
		loc_def = function(_c) return { _c.config.max_highlighted, _c.config.extra.chips } end,
		use = chip_function,
	},
	silica_packet = {
		name = "Silica Packet",
		text = {
			'Lose all discards and all hands except 1',
			'',
		},
		effect = 'tasty...',
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 1, y = 1 },
		rarity = 2,
		loc_def = function(_c) return { _c.config.extra.cards } end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			local remember = G.hand.config.card_limit
			G.hand.config.card_limit = #G.hand.cards + self.ability.extra.cards
			G.FUNCS.draw_from_deck_to_hand(self.ability.extra.cards)
			G.hand.config.card_limit = remember
			delay(0.6)
		end,
		can_use = function(self) return #G.hand.cards > 1 and #G.deck.cards > 1 end,
	},
	jimbobread_man = {
		name = "Jimbobread Man",
		text = {
			'Gain {C:blue}+#1#{} hand',
			'{C:inactive}Looks big enough{}',
			'{C:inactive}for two sittings!{}',
		},
		effect = 'tasty...',
		config = {
			extra = {
				hands = 1
			}
		},
		pos = { x = 2, y = 1 },
		rarity = 2,
		loc_def = function(_c) return { _c.config.extra.hands } end,
		consumeable = false,
		use = function(self, area, copier)
			local used_tarot = copier or self
			ease_hands_played(self.ability.extra.hands)
			delay(0.6)
			used_tarot:juice_up()
			if not copier then
				G.E_MANAGER:add_event(Event({
					trigger = 'before',
					delay = 0.0,
					func = (function()
						self:set_ability(G.P_CENTERS.c_Thac_jimbobread_man_half)
						return true
					end)}))
			end
		end,
		can_use = function(self) return G.STATE == G.STATES.SELECTING_HAND end,
		load_check = function()
			return TheAutumnCircus.config.enabled_oddities.jimbobread_man_half
		end,
	},
	jimbobread_man_half = {
		name = "Jimbobread Man",
		subtitle = "Half-Eaten",
		text = {
			'Gain {C:blue}+#1#{} hand',
			'{C:inactive}Just one bite{}',
			'{C:inactive}left, now{}',
		},
		effect = 'tasty...',
		config = {
			extra = {
				hands = 1
			}
		},
		pos = { x = 3, y = 1 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
		loc_def = function(_c) return { _c.config.extra.hands } end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			ease_hands_played(self.ability.extra.hands)
			delay(0.6)
		end,
		can_use = function(self) return G.STATE == G.STATES.SELECTING_HAND end,
		load_check = function()
			return TheAutumnCircus.config.enabled_oddities.jimbobread_man
		end,
	},
}

local oddity_codex = {
	'one_jollar',
	'two_jollar',
	'five_jollar',
	'ten_jollar',
	'twenty_jollar',
	'pot_of_joker',
	'green_chip',
	'yellow_chip',
	'red_blue_chip',
	'purple_chip',
	'power_chip',
	--'silica_packet',
	'jimbobread_man',
	'jimbobread_man_half',
}

function TheAutumnCircus.INIT.BasicOddities()
	
	--G.localization.misc.dictionary['b_jokers'] = "Jonklers"
	
	SMODS.Sprite:new("Thac_BasicOddities", TheAutumnCircus.mod.path, "BasicOddities.png", 71, 95, "asset_atli"):register();
	
	--oddities
	for _, k in ipairs(oddity_codex) do
		local v = oddities[k]
		TheAutumnCircus.data.buffer_insert("Oddities", v, {key = k, atlas = "Thac_BasicOddities"})
	end
end