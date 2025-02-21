local money_function = function(_, self, area, copier)
	local used_tarot = copier or self
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		play_sound('timpani')
		used_tarot:juice_up(0.3, 0.5)
		ease_dollars(math.max(0,self.ability.extra.dollars), true)
		return true end }))
	delay(0.6)
end

local chip_function = function(_, self, area, copier)
	local used_tarot = copier or self
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	for i=1, #G.hand.cards do
		if G.hand.cards[i].highlighted == true then
			G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus or 0
			G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus + self.ability.extra.chips
			--[[G.hand.cards[i].ability.perma_xbonus = G.hand.cards[i].ability.perma_xbonus or 1
			G.hand.cards[i].ability.perma_xbonus = G.hand.cards[i].ability.perma_xbonus * self.ability.extra.chips
			G.hand.cards[i].ability.perma_mult = G.hand.cards[i].ability.perma_mult or 0
			G.hand.cards[i].ability.perma_mult = G.hand.cards[i].ability.perma_mult + self.ability.extra.chips
			G.hand.cards[i].ability.perma_xmult = G.hand.cards[i].ability.perma_xmult or 1
			G.hand.cards[i].ability.perma_xmult = G.hand.cards[i].ability.perma_xmult * self.ability.extra.chips
			G.hand.cards[i].ability.perma_hbonus = G.hand.cards[i].ability.perma_hbonus or 0
			G.hand.cards[i].ability.perma_hbonus = G.hand.cards[i].ability.perma_hbonus + self.ability.extra.chips
			G.hand.cards[i].ability.perma_hxbonus = G.hand.cards[i].ability.perma_hxbonus or 1
			G.hand.cards[i].ability.perma_hxbonus = G.hand.cards[i].ability.perma_hxbonus * self.ability.extra.chips
			G.hand.cards[i].ability.perma_hmult = G.hand.cards[i].ability.perma_hmult or 0
			G.hand.cards[i].ability.perma_hmult = G.hand.cards[i].ability.perma_hmult + self.ability.extra.chips
			G.hand.cards[i].ability.perma_hxmult = G.hand.cards[i].ability.perma_hxmult or 1
			G.hand.cards[i].ability.perma_hxmult = G.hand.cards[i].ability.perma_hxmult * self.ability.extra.chips--]]
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
				card_eval_status_text(G.hand.cards[i], 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT, instant = true})
			return true end}))
		end
	end
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
	delay(0.5)
end

local oddities = {
	'one_jollar', one_jollar = {
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
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.dollars }} end,
		use = money_function,
		can_use = function(_, self) return true end,
	},
	'two_jollar', two_jollar = {
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
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.dollars }} end,
		use = money_function,
		can_use = function(_, self) return true end,
	},
	'five_jollar', five_jollar = {
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
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.dollars }} end,
		use = money_function,
		can_use = function(_, self) return true end,
	},
	'ten_jollar', ten_jollar = {
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
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.dollars }} end,
		use = money_function,
		can_use = function(_, self) return true end,
	},
	'twenty_jollar', twenty_jollar = {
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
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.dollars }} end,
		use = money_function,
		can_use = function(_, self) return true end,
	},
	'green_chip', green_chip = {
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
		pos = { x = 5, y = 0, scale_h = 73/95 },
		cost = 3,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
		use = chip_function,
	},
	'yellow_chip', yellow_chip = {
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
		pos = { x = 6, y = 0, scale_h = 73/95 },
		cost = 3,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
		use = chip_function,
	},
	'red_blue_chip', red_blue_chip = {
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
		pos = { x = 7, y = 0, scale_h = 73/95 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
		use = chip_function,
	},
	'purple_chip', purple_chip = {
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
		pos = { x = 8, y = 0, scale_h = 73/95 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
		use = chip_function,
	},
	'power_chip', power_chip = {
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
		pos = { x = 9, y = 0, scale_h = 73/95 },
		rarity = 3,
		cost = 7,
		shader = 'booster',
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
		use = chip_function,
	},
	'pot_of_joker', pot_of_joker = {
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
		cost = 2,
		rarity = 1,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.cards }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			TheAutumnCircus.func.force_draw_cards(card.ability.extra.cards, nil, true)
		end,
		can_use = function(_, self) return #G.hand.cards > 1 and #G.deck.cards > 1 end,
	},
	'silica_packet', silica_packet = {
		name = "Silica Packet",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'tasty...',
		config = {
		},
		pos = { x = 1, y = 1 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},
	'jimbobread_man', jimbobread_man = {
		name = "Jimbobread Man",
		text = {
			'Gain {C:blue}+#1#{} hand',
			'{C:inactive}Looks big enough{}',
			'{C:inactive}for two sittings!{}',
		},
		boxes = { 1, 2, },
		effect = 'tasty...',
		config = {
			extra = {
				hands = 1
			}
		},
		pos = { x = 2, y = 1 },
		rarity = 2,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.hands }} end,
		keep_on_use = function(self, card)
			return true
		end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			delay(0.6)
			if not copier then
				G.E_MANAGER:add_event(Event({
					trigger = 'before',
					delay = 0.0,
					func = (function()
						play_sound('cardFan2')
						used_tarot:juice_up()
						self:set_ability(G.P_CENTERS.c_thac_jimbobread_man_half)
						ease_hands_played(self.ability.extra.hands)
						return true
					end)}))
			end
		end,
		can_use = function(_, self) return G.STATE == G.STATES.SELECTING_HAND end,
		load_check = function()
			return TheAutumnCircus.config.enabled_consumables.jimbobread_man_half
		end,
	},
	'jimbobread_man_half', jimbobread_man_half = {
		name = "Jimbobread Man",
		subtitle = "Half-Eaten",
		text = {
			'Gain {C:blue}+#1#{} hand',
			'{C:inactive}Just one bite{}',
			'{C:inactive}left, now{}',
		},
		boxes = { 1, 2, },
		effect = 'tasty...',
		config = {
			extra = {
				hands = 1
			}
		},
		pos = { x = 3, y = 1 },
		rarity = 1,
		in_pool = function() return false end,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { _c.config.extra.hands }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			ease_hands_played(self.ability.extra.hands)
			delay(0.6)
		end,
		can_use = function(_, self) return G.STATE == G.STATES.SELECTING_HAND end,
		load_check = function()
			return TheAutumnCircus.config.enabled_consumables.jimbobread_man
		end,
	},
	'narwhal_horn', narwhal_horn = {
		name = "Narwhal Horn",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'pokey',
		config = {
		},
		pos = { x = 4, y = 1 },
		rarity = 2,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},
	'cultist_potion', cultist_potion = {
		name = "Cultist Potion",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'CAW CAW!!!!',
		config = {
		},
		pos = { x = 5, y = 1, scale_h = 60/95 },
		rarity = 3,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},
	'fire_potion', fire_potion = {
		name = "Fire Potion",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'boom :3',
		config = {
		},
		pos = { x = 6, y = 1, scale_h = 67/95 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},
	'snecko_potion', snecko_potion = {
		name = "Snecko Oil",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'ssssssss',
		config = {
		},
		pos = { x = 7, y = 1, scale_h = 63/95 },
		rarity = 3,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},
	'energy_potion', energy_potion = {
		name = "Energy Potion",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'I FEEL SO ENERGIZED',
		config = {
		},
		pos = { x = 8, y = 1, scale_h = 63/95 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},
	'vote_sticker', vote_sticker = {
		name = "Vote For Jimbo!",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'votevotevote',
		config = {
		},
		pos = { x = 9, y = 1, scale_h = 69/95 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},
	'cpu_memory', cpu_memory = {
		name = "CPU Memory",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'reject modernity become anime girl',
		config = {
		},
		pos = { x = 0, y = 2 },
		rarity = 3,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
		end,
	},
	'estradiol', estradiol = {
		name = "Estradiol",
		text = {
			'Converts {C:attention}all{} {C:attention}Kings{}',
			'and {C:attention}Jacks{} in your {C:attention}full{}',
			'{C:attention}deck{} into {C:attention}Queens{}',
		},
		effect = 'TASTY',
		config = {
			extra = {
				targets = {"King", "Jack"},
				effect = "Queen",
			}
		},
		pos = { x = 1, y = 2, scale_w = 49/71 },
		rarity = 4,
		cost = 10,
		loc_vars = function(_c) return {vars = {}} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			if #G.hand.cards > 1 then
				for i=1, #G.hand.cards do
					local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
				end
			end
            for i = 1, #G.playing_cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0,
                    func = function()
                        local card = G.playing_cards[i]
                        local suit_data = SMODS.Suits[card.base.suit]
                        local suit_prefix = suit_data.card_key
                        local rank_data = SMODS.Ranks[card.base.value]
                        local rank_suffix
						for i=1, #self.ability.extra.targets do
							if card.base.value == self.ability.extra.targets[i] then
								rank_suffix = SMODS.Ranks[self.ability.extra.effect].card_key
								break
							end
						end
						if rank_suffix then
							card:set_base(G.P_CARDS[suit_prefix .. '_' .. rank_suffix])
						end
                        return true
                    end
                }))
            end
			delay(0.05)
			if #G.hand.cards > 1 then
				for i=1, #G.hand.cards do
					local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
				end
			end
			delay(0.2)
		end,
		can_use = function(_, self) return true end,
	},
	'faded_voucher', faded_voucher = {
		name = "Faded Voucher",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'uhhhh funny joke or something',
		config = {
		},
		pos = { x = 2, y = 2 },
		rarity = 4,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
		end,
	},
	'empty_bottle', empty_bottle = {
		name = "Empty Bottle",
		text = {
			"{C:attention}Bottles #1#{}","selected card"
		},
		effect = 'bottl',
		config = {
			max_highlighted = 1
		},
		pos = { x = 3, y = 2, scale_w = 49/71, scale_h = 62/95 },
		rarity = 3,
		cost = 7,
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = {key = 'bottle', set = 'Other'} return {vars = { _c.config.max_highlighted }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local selected_card = G.hand.highlighted[1]
			selected_card.bottle = true
			selected_card:juice_up(0.3, 2.0)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.highlighted == 1 and not G.hand.highlighted[1].bottle
		end
	},
	'box_of_rocks', box_of_rocks = {
		name = "Box of Rocks",
		subtitle = "They seem pretty smart, actually",
		text = {
			"Creates {C:attention}#1#{} random {C:attention}Stone Cards{}",
			"and puts them in your hand"
		},
		effect = 'Create 2 Stone Cards Create 2 Stone Cards Create 2 Stone Cards',
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 1,
		cost = 3,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_stone}, G.hand)
				cardmak:set_edition(poll_edition("box_of_rocks"))
				cardmak:set_seal(SMODS.poll_seal{key = "box_of_rocks", mod = 10})
			end
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'calcium', calcium = {
		name = "Calcium",
		subtitle = "Grows your bones!",
		text = {
			"Creates {C:attention}#1#{} random",
			"{C:attention}Bone Cards{} and puts",
			"them in your hand"
		},
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 1,
		cost = 3,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_thac_bone}, G.hand)
				cardmak:set_edition(poll_edition("calcium"))
				cardmak:set_seal(SMODS.poll_seal{key = "calcium", mod = 10})
			end
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'scrap_metal', scrap_metal = {
		name = "Scrap Metal",
		subtitle = "Work In Progress!",
		text = {
			"Creates {C:attention}#1#{} random",
			"{C:attention}metal Enhanced Cards{}","and puts them in","your {C:attention}graveyard{}"
		},
		config = {
			extra = {
				cards = 3
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = pseudorandom_element({
					G.P_CENTERS.m_steel, G.P_CENTERS.m_gold,
					G.P_CENTERS.m_ortalab_rusty or nil,
				}, pseudoseed("scrap_metal"))}, G.deck)
				cardmak:set_edition(poll_edition("scrap_metal"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "scrap_metal", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end
	},
	'fossil', fossil = {
		name = "Fossil",
		subtitle = "Work In Progress!",
		text = {
			"Creates {C:attention}#1#{} random",
			"{C:attention}Bone Cards{} and","puts them in","your {C:attention}graveyard{}"
		},
		config = {
			extra = {
				cards = 3
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_thac_bone}, G.deck)
				cardmak:set_edition(poll_edition("fossil"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "fossil", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end
	},
}

SMODS.Atlas{
	key = "BasicOddities",
	path = "BasicOddities.png",
	px = 71,
	py = 95,
}

--oddities
for _, k in ipairs(oddities) do
	local v = oddities[k]
	if not v.rarity then v.rarity = 1 end
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Oddity", key = k, atlas = "BasicOddities"})
end