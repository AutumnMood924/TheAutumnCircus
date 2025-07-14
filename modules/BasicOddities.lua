local money_function = function(_, self, area, copier)
	local used_tarot = copier or self
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		play_sound('timpani')
		used_tarot:juice_up(0.3, 0.5)
		ease_dollars(math.max(0,self.ability.extra.dollars), true)
		return true end }))
	delay(0.6)
end

local money_update = function(self, card, dt)
	card.sell_cost = card.ability.extra.dollars
	card.sell_cost_label = card.ability.extra.dollars
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

local activate_oddity = function(self, card, area, copier)
	local used_tarot = copier or card
	card.ability.extra.active = true
	card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_thac_active"), colour = G.C.ORANGE, instant = true})
	juice_card_until(card, function(v) return v.ability.extra.active == true end, true)
end

local enhancement_potion = function(self, card, context)
	if card.ability.extra.active then
		if context.check_enhancement and (context.other_card.area == G.play or context.other_card.area == "unscored" or context.other_card.area == G.hand) and G.STATE == G.STATES.HAND_PLAYED then
			temp = {}
			temp[card.ability.extra.card_type] = true
			return temp
		end
		if context.after and not context.blueprint then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0,
				func = function()
					card:start_dissolve()
					return true
				end,
			}))
		end
	end
end

local enhancement_potion_lv = function(_c,info_queue,card)
	info_queue[#info_queue+1] = G.P_CENTERS[card.ability.extra.card_type]
	return {vars = { 
		localize{ type = 'name_text', set = 'Enhanced', key = card.ability.extra.card_type },
	}}
end

local oddities = {
	'one_jollar', one_jollar = {
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
			 return {vars = { card.ability.extra.dollars }} end,
		use = money_function,
		update = money_update,
		can_use = function(_, self) return true end,
		in_pool = function(self)
			return G.STATE == G.STATES.SMODS_BOOSTER_OPENED
		end,
	},
	'two_jollar', two_jollar = {
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
			 return {vars = { card.ability.extra.dollars }} end,
		use = money_function,
		update = money_update,
		can_use = function(_, self) return true end,
		in_pool = function(self)
			return G.STATE == G.STATES.SMODS_BOOSTER_OPENED
		end,
	},
	'five_jollar', five_jollar = {
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
			 return {vars = { card.ability.extra.dollars }} end,
		use = money_function,
		update = money_update,
		can_use = function(_, self) return true end,
		in_pool = function(self)
			return G.STATE == G.STATES.SMODS_BOOSTER_OPENED
		end,
	},
	'ten_jollar', ten_jollar = {
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
			 return {vars = { card.ability.extra.dollars }} end,
		use = money_function,
		update = money_update,
		can_use = function(_, self) return true end,
		in_pool = function(self)
			return G.STATE == G.STATES.SMODS_BOOSTER_OPENED
		end,
	},
	'twenty_jollar', twenty_jollar = {
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
			 return {vars = { card.ability.extra.dollars }} end,
		use = money_function,
		update = money_update,
		can_use = function(_, self) return true end,
		in_pool = function(self)
			return G.STATE == G.STATES.SMODS_BOOSTER_OPENED
		end,
	},
	'green_chip', green_chip = {
		effect = 'CHIP',
		config = {
			max_highlighted = 2,
			extra = {
				chips = 15
			}
		},
		pos = { x = 5, y = 0 },
		pixel_size = { w = 71, h = 73 },
		cost = 3,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { card.ability.max_highlighted, card.ability.extra.chips }} end,
		use = chip_function,
	},
	'yellow_chip', yellow_chip = {
		effect = 'CHIP',
		config = {
			max_highlighted = 4,
			extra = {
				chips = 10
			}
		},
		pos = { x = 6, y = 0 },
		pixel_size = { w = 71, h = 73 },
		cost = 3,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { card.ability.max_highlighted, card.ability.extra.chips }} end,
		use = chip_function,
	},
	'red_blue_chip', red_blue_chip = {
		effect = 'CHIP',
		config = {
			max_highlighted = 2,
			extra = {
				chips = 30
			}
		},
		pos = { x = 7, y = 0 },
		pixel_size = { w = 71, h = 73 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { card.ability.max_highlighted, card.ability.extra.chips }} end,
		use = chip_function,
	},
	'purple_chip', purple_chip = {
		effect = 'CHIP',
		config = {
			max_highlighted = 4,
			extra = {
				chips = 15
			}
		},
		pos = { x = 8, y = 0 },
		pixel_size = { w = 71, h = 73 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { card.ability.max_highlighted, card.ability.extra.chips }} end,
		use = chip_function,
	},
	'power_chip', power_chip = {
		effect = 'CHIP',
		config = {
			max_highlighted = 1,
			extra = {
				chips = 75
			}
		},
		pos = { x = 9, y = 0 },
		pixel_size = { w = 71, h = 73 },
		rarity = 3,
		cost = 7,
		shader = 'booster',
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			 return {vars = { card.ability.max_highlighted, card.ability.extra.chips }} end,
		use = chip_function,
	},
	'pot_of_joker', pot_of_joker = {
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
			 return {vars = { card.ability.extra.cards }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			TheAutumnCircus.func.force_draw_cards(card.ability.extra.cards, nil, true)
		end,
		can_use = function(_, self) return #G.hand.cards > 1 and #G.deck.cards > 1 end,
	},
	--[['silica_packet', silica_packet = {
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
	},--]]
	'jimbobread_man', jimbobread_man = {
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
			 return {vars = { card.ability.extra.hands }} end,
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
			 return {vars = { card.ability.extra.hands }} end,
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
	--[['narwhal_horn', narwhal_horn = {
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
	},--]]
	'cultist_potion', cultist_potion = {
		effect = 'CAW CAW!!!!',
		config = {
			extra = {
				Xmult_curr = 0,
				Xmult = 1,
				active = false,
			},
		},
		pos = { x = 5, y = 1 },
		pixel_size = { w = 71, h = 60 },
		rarity = 3,
		cost = 6,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			return {
				vars = {
					card.ability.extra.Xmult,
					card.ability.extra.Xmult_curr,
				}
			}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or self
			card.ability.extra.active = true
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_thac_cawcaw"), colour = G.C.BLUE, instant = true})
			juice_card_until(card, function(v) return v.ability.extra.active == true end, true)
		end,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = function(self, card, context)
			if card.ability.extra.active then
				if context.joker_main then
					if not context.blueprint then
						card.ability.extra.Xmult_curr = card.ability.extra.Xmult_curr + card.ability.extra.Xmult
					end
					if card.ability.extra.Xmult_curr < 1 then return end
					return {
						xmult = card.ability.extra.Xmult_curr
					}
				end
				if context.end_of_round and context.main_eval and not context.blueprint then
					card:start_dissolve()
				end
			end
		end,
	},
	'fire_potion', fire_potion = {
		effect = 'boom :3',
		config = {
			extra = {
				mult = 20,
				active = false
			},
		},
		pos = { x = 6, y = 1 },
		pixel_size = { w = 71, h = 67 },
		rarity = 1,
		cost = 3,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			return {vars = {card.ability.extra.mult}}
		end,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = function(self, card, context)
			if card.ability.extra.active then
				if context.joker_main then
					return {
						mult = card.ability.extra.mult
					}
				end
				if context.after and not context.blueprint then
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0,
						func = function()
							card:start_dissolve()
							return true
						end,
					}))
				end
			end
		end,
	},
	'snecko_potion', snecko_potion = {
		effect = 'ssssssss',
		config = {
			extra = {
				cards = 5,
			},
		},
		pos = { x = 7, y = 1 },
		pixel_size = { w = 71, h = 63 },
		rarity = 3,
		cost = 7,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			return {vars = {card.ability.extra.cards}}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			TheAutumnCircus.func.force_draw_cards(card.ability.extra.cards, nil, true)
			
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					play_sound('tarot1')
					used_tarot:juice_up(0.3, 0.5)
					return true end }))
				for i=1, #G.hand.cards do
					local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.10,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
				end
				for i=1, #G.hand.cards do
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.0,func = function()	
						local card = G.hand.cards[i]
						
						SMODS.change_base(card, nil, pseudorandom_element(SMODS.Rank.obj_buffer, pseudoseed('snecko')))
						
						return true 
					end }))
				end
				for i=1, #G.hand.cards do
					local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.10,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
				end
				delay(0.1)
				return true
			end}))
			
		end,
		can_use = function(_, self) return #G.hand.cards > 1 and #G.deck.cards > 1 end,
	},
	'energy_potion', energy_potion = {
		effect = 'I FEEL SO ENERGIZED',
		config = {
			extra = {
				retriggers = 2,
				active = false,
			},
		},
		pos = { x = 8, y = 1 },
		pixel_size = { w = 71, h = 63 },
		cost = 3,
		rarity = 1,
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
			return {
				vars = {
					card.ability.extra.retriggers,
					card.ability.extra.retriggers == 1 and "" or "s",
				}
			}
		end,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = function(self, card, context)
			if card.ability.extra.active then
				if context.repetition then
					return {
						repetitions = card.ability.extra.retriggers,
						message = localize("k_again_ex"),
						colour = G.C.ORANGE,
					}
				end
				if context.after and not context.blueprint then
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0,
						func = function()
							card:start_dissolve()
							return true
						end,
					}))
				end
			end
		end,
	},
	--[['vote_sticker', vote_sticker = {
		name = "Vote For Jimbo!",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'votevotevote',
		config = {
		},
		pos = { x = 9, y = 1 },
		pixel_size = { w = 71, h = 69 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'lyman'} end
		end,
	},--]]
	--[['cpu_memory', cpu_memory = {
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
	},--]]
	'estradiol', estradiol = {
		effect = 'TASTY',
		config = {
			extra = {
				targets = {"King", "Jack"},
				effect = "Queen",
			}
		},
		pos = { x = 1, y = 2 },
		pixel_size = { w = 49, h = 95 },
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
		effect = 'uhhhh funny joke or something',
		config = {
			extra = {
				vouchers = 1,
			},
		},
		pos = { x = 2, y = 2 },
		rarity = 4,
		cost = 10,
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            return {vars = {
                card.ability.extra.vouchers == 1 and "a" or math.floor(card.ability.extra.vouchers),
                card.ability.extra.vouchers == 1 and "" or "s",
            }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			
			local voucher_key = get_next_voucher_key(true)
			
			local new_card = create_card("Voucher", G.play, nil, nil, nil, nil, voucher_key, nil)
			new_card:start_materialize()
			new_card.cost = 0
			new_card.from_tag = true
			new_card:redeem()
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.2,
				func = (function()
					new_card:start_dissolve()                    
					return true
				end)}))
		end,
		can_use = function(self, card, area, copier)
			return true
		end
	},
	'empty_bottle', empty_bottle = {
		effect = 'bottl',
		config = {
			max_highlighted = 1
		},
		pos = { x = 3, y = 2 },
		pixel_size = { w = 49, h = 62 },
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
	'trick_deck', trick_deck = {
		effect = 'immaterial',
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
			info_queue[#info_queue+1] = G.P_CENTERS.m_mult
			info_queue[#info_queue+1] = G.P_CENTERS.m_wild
			info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
			if next(SMODS.find_mod("ortalab")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_post
				info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_bent
				info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_index
				info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_iou
			end
			if next(SMODS.find_mod("MoreFluff")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_mf_monus
				info_queue[#info_queue+1] = G.P_CENTERS.m_mf_cult
				info_queue[#info_queue+1] = G.P_CENTERS.m_mf_styled
				info_queue[#info_queue+1] = G.P_CENTERS.m_mf_teal
			end
			if next(SMODS.find_mod("GrabBag")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_gb_river
			end
			if next(SMODS.find_mod("aikoyorisshenanigans")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_akyrs_scoreless
			end
			if next(SMODS.find_mod("Cryptid")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_cry_echo
			end
			if next(SMODS.find_mod("pta_saka")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_payasaka_volatile
			end
			info_queue[#info_queue+1] = G.P_CENTERS.m_thac_star
			info_queue[#info_queue+1] = G.P_CENTERS.m_thac_soulbound
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local centers = {G.P_CENTERS.m_bonus, G.P_CENTERS.m_mult, G.P_CENTERS.m_wild, G.P_CENTERS.m_lucky}
				if next(SMODS.find_mod("ortalab")) then
					centers[#centers+1] = G.P_CENTERS.m_ortalab_post
					centers[#centers+1] = G.P_CENTERS.m_ortalab_bent
					centers[#centers+1] = G.P_CENTERS.m_ortalab_index
					centers[#centers+1] = G.P_CENTERS.m_ortalab_iou
				end
				if next(SMODS.find_mod("MoreFluff")) then
					centers[#centers+1] = G.P_CENTERS.m_mf_monus
					centers[#centers+1] = G.P_CENTERS.m_mf_cult
					centers[#centers+1] = G.P_CENTERS.m_mf_styled
					centers[#centers+1] = G.P_CENTERS.m_mf_teal
				end
				if next(SMODS.find_mod("GrabBag")) then
					centers[#centers+1] = G.P_CENTERS.m_gb_river
				end
				if next(SMODS.find_mod("aikoyorisshenanigans")) then
					centers[#centers+1] = G.P_CENTERS.m_akyrs_scoreless
				end
				if next(SMODS.find_mod("Cryptid")) then
					centers[#centers+1] = G.P_CENTERS.m_cry_echo
				end
				centers[#centers+1] = G.P_CENTERS.m_thac_star
				centers[#centers+1] = G.P_CENTERS.m_thac_soulbound
				local cardmak = create_playing_card({center = pseudorandom_element(centers, pseudoseed("trick_deck"))}, G.hand)
				cardmak:set_edition(poll_edition("trick_deck"))
				cardmak:set_seal(SMODS.poll_seal{key = "trick_deck", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'box_of_rocks', box_of_rocks = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_stone
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_stone}, G.hand)
				cardmak:set_edition(poll_edition("box_of_rocks"))
				cardmak:set_seal(SMODS.poll_seal{key = "box_of_rocks", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'pouch_of_sand', pouch_of_sand = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_sand
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_ortalab_sand}, G.hand)
				cardmak:set_edition(poll_edition("pouch_of_sand"))
				cardmak:set_seal(SMODS.poll_seal{key = "pouch_of_sand", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("ortalab")) then return true else return false end
		end,
	},
	'bag_of_stardust', bag_of_stardust = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_iou
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_ortalab_iou}, G.hand)
				cardmak:set_edition(poll_edition("bag_of_stardust"))
				cardmak:set_seal(SMODS.poll_seal{key = "bag_of_stardust", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("ortalab")) then return true else return false end
		end,
	},
	'jar_of_dirt', jar_of_dirt = {
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
            info_queue[#info_queue+1] = G.P_CENTERS.m_thac_dirt
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_thac_dirt}, G.hand)
				cardmak:set_edition(poll_edition("jar_of_dirt"))
				cardmak:set_seal(SMODS.poll_seal{key = "jar_of_dirt", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'calcium', calcium = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_thac_bone
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_thac_bone}, G.hand)
				cardmak:set_edition(poll_edition("calcium"))
				cardmak:set_seal(SMODS.poll_seal{key = "calcium", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'flashlight', flashlight = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_cry_light
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_cry_light}, G.hand)
				cardmak:set_edition(poll_edition("flashlight"))
				cardmak:set_seal(SMODS.poll_seal{key = "flashlight", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("Cryptid")) then return true else return false end
		end,
	},
	'abstract_oddity', abstract_oddity = {
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 3,
		cost = 10,
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_cry_abstract
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_cry_abstract}, G.hand)
				cardmak:set_edition(poll_edition("abstract_oddity"))
				cardmak:set_seal(SMODS.poll_seal{key = "abstract_oddity", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("Cryptid")) then return true else return false end
		end,
	},
	'corrupting_shard', corrupting_shard = {
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_entr_dark
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_entr_dark}, G.hand)
				cardmak:set_edition(poll_edition("corrupting_shard"))
				cardmak:set_seal(SMODS.poll_seal{key = "corrupting_shard", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("entr")) then return true else return false end
		end,
	},
	'sack_of_meat', sack_of_meat = {
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_entr_flesh
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_entr_flesh}, G.hand)
				cardmak:set_edition(poll_edition("sack_of_meat"))
				cardmak:set_seal(SMODS.poll_seal{key = "sack_of_meat", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("entr")) then return true else return false end
		end,
	},
	'immaculate_prism', immaculate_prism = {
		config = {
			extra = {
				cards = 3
			}
		},
		pos = { x = 5, y = 2 },
		pixel_size = { w = 71, h = 70 },
		rarity = 4,
		cost = 10,
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_entr_prismatic
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_entr_prismatic}, G.hand)
				cardmak:set_edition(poll_edition("immaculate_prism"))
				cardmak:set_seal(SMODS.poll_seal{key = "immaculate_prism", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("entr")) then return true else return false end
		end,
	},
	'pot_of_honey', pot_of_honey = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_gb_honey
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_gb_honey}, G.hand)
				cardmak:set_edition(poll_edition("pot_of_honey"))
				cardmak:set_seal(SMODS.poll_seal{key = "pot_of_honey", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("GrabBag")) then return true else return false end
		end,
	},
	'bottle_of_water', bottle_of_water = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_gb_river
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_gb_river}, G.hand)
				cardmak:set_edition(poll_edition("bottle_of_water"))
				cardmak:set_seal(SMODS.poll_seal{key = "bottle_of_water", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("GrabBag")) then return true else return false end
		end,
	},
	'bag_of_bricks', bag_of_bricks = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_akyrs_brick_card
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_akyrs_brick_card}, G.hand)
				cardmak:set_edition(poll_edition("bag_of_bricks"))
				cardmak:set_seal(SMODS.poll_seal{key = "bag_of_bricks", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("aikoyorisshenanigans")) then return true else return false end
		end,
	},
	'charred_pouch', charred_pouch = {
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_akyrs_ash_card
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_akyrs_ash_card}, G.hand)
				cardmak:set_edition(poll_edition("charred_pouch"))
				cardmak:set_seal(SMODS.poll_seal{key = "charred_pouch", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("aikoyorisshenanigans")) then return true else return false end
		end,
	},
	'unstable_concoction', unstable_concoction = {
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_payasaka_volatile
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_payasaka_volatile}, G.hand)
				cardmak:set_edition(poll_edition("unstable_concoction"))
				cardmak:set_seal(SMODS.poll_seal{key = "unstable_concoction", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("pta_saka")) then return true else return false end
		end,
	},
	'vial_of_plasma', vial_of_plasma = {
		config = {
			extra = {
				cards = 2
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_payasaka_laser
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_payasaka_laser}, G.hand)
				cardmak:set_edition(poll_edition("vial_of_plasma"))
				cardmak:set_seal(SMODS.poll_seal{key = "vial_of_plasma", mod = 10})
				cards[#cards+1] = cardmak
			end
			playing_card_joker_effects(cards)
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end,
		load_check = function()
			if next(SMODS.find_mod("pta_saka")) then return true else return false end
		end,
	},
	'scrap_metal', scrap_metal = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_steel
			info_queue[#info_queue+1] = G.P_CENTERS.m_gold
			if next(SMODS.find_mod("ortalab")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_rusty
			end
			if next(SMODS.find_mod("MoreFluff")) then
				info_queue[#info_queue+1] = G.P_CENTERS.m_mf_brass
			end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local centers = {G.P_CENTERS.m_steel, G.P_CENTERS.m_gold}
				if next(SMODS.find_mod("ortalab")) then
					centers[#centers+1] = G.P_CENTERS.m_ortalab_rusty
				end
				if next(SMODS.find_mod("MoreFluff")) then
					centers[#centers+1] = G.P_CENTERS.m_mf_brass
				end
				local cardmak = create_playing_card({center = pseudorandom_element(centers, pseudoseed("scrap_metal"))}, G.deck)
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
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_thac_bone
            --info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
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
		end,
	},
	'lost_envelope', lost_envelope = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_ortalab_post
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_ortalab_post}, G.deck)
				cardmak:set_edition(poll_edition("lost_envelope"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "lost_envelope", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return next(SMODS.find_mod("ortalab")) and true
		end,
	},
	'groundwater', groundwater = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_gb_river
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_gb_river}, G.deck)
				cardmak:set_edition(poll_edition("groundwater"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "groundwater", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return next(SMODS.find_mod("GrabBag")) and true
		end,
	},
	'ritual_page', ritual_page = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_mf_cult
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_mf_cult}, G.deck)
				cardmak:set_edition(poll_edition("ritual_page"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "ritual_page", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return next(SMODS.find_mod("MoreFluff")) and true
		end,
	},
	'glimmer_beyond', glimmer_beyond = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_cry_light
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_cry_light}, G.deck)
				cardmak:set_edition(poll_edition("glimmer_beyond"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "glimmer_beyond", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return next(SMODS.find_mod("Cryptid")) and true
		end,
	},
	'bizarre_shard', bizarre_shard = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_cry_abstract
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_cry_abstract}, G.deck)
				cardmak:set_edition(poll_edition("glimmer_beyond"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "glimmer_beyond", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return next(SMODS.find_mod("Cryptid")) and true
		end,
	},
	'fading_shadow', fading_shadow = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_entr_dark
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_entr_dark}, G.deck)
				cardmak:set_edition(poll_edition("fading_shadow"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "fading_shadow", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return next(SMODS.find_mod("entr")) and true
		end,
	},
	'viscera', viscera = {
		config = {
			extra = {
				cards = 4
			}
		},
		pos = { x = 4, y = 2 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.m_entr_flesh
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_entr_flesh}, G.deck)
				cardmak:set_edition(poll_edition("viscera"), true, true)
				cardmak:set_seal(SMODS.poll_seal{key = "viscera", mod = 10}, true, true)
				cardmak:move_to_graveyard()
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return next(SMODS.find_mod("entr")) and true
		end,
	},
	'gift_of_the_knight', gift_of_the_knight = {
		config = {
			extra = {
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 4,
		cost = 10,
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
			info_queue[#info_queue+1] = G.P_ASPECTS.thac_heart
            --info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
				local enhancement = G.P_CENTERS.c_base
				if pseudorandom(pseudoseed("gift_of_the_knight")) < 0.5 then
					enhancement = pseudorandom_element(G.P_CENTER_POOLS.Enhanced)
				end
				local cardmak = create_playing_card({front = G.P_CARDS.H_3, center = enhancement}, G.hand)
				cardmak:set_edition({polychrome = true})
				cardmak:set_seal(SMODS.poll_seal{key = "gift_of_the_knight", mod = 10})
				cardmak:set_aspect("thac_heart")
			playing_card_joker_effects({cardmak})
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'dance_with_the_dead', dance_with_the_dead = {
		config = {
			extra = {
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
			return {vars = {  }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local rember = #G.hand.cards
			for i=#G.hand.cards,1,-1 do
				G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.1, func = function()
					G.hand.cards[i]:move_to_graveyard()
					return true end }))
			end
			G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
				local gy_ = {}
				for k,v in ipairs(G.graveyard) do gy_[#gy_+1]=v end
				pseudoshuffle(gy_, pseudoseed('dance_with_the_dead'))
				for i=math.min(#gy_, rember),1,-1 do
					G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.1, func = function()
						gy_[i]:move_from_graveyard()
						return true end }))
				end
				return true end }))
		end,
		can_use = function(self, card, area, copier)
			return #G.hand.cards > 1
		end
	},
	'stareater', stareater = {
		config = {
			extra = {
				dollars = 5,
				max_dollars = 60,
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 3,
		cost = 7,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			--info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
			return {vars = { card.ability.extra.dollars, card.ability.extra.max_dollars,
				math.min(card.ability.extra.max_dollars, card.ability.extra.dollars * (G.HUD_zodiac and #G.HUD_zodiac or 0))}} -- TECHNICALLY a dirty solution. TECHNICALLY works.
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local remer = G.HUD_zodiac and #G.HUD_zodiac or 0
			for k,v in pairs(G.ZODIACS) do
				if G.zodiacs[k] then
					G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.0, func = function()
						used_tarot:juice_up(0.3, 0.5)
						return true end }))
					G.zodiacs[k]:remove_zodiac("=0")
				end
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				--play_sound('timpani')
				used_tarot:juice_up(0.3, 0.5)
				ease_dollars(math.min(card.ability.extra.max_dollars, card.ability.extra.dollars * remer), false)
				return true end }))
			delay(0.6)
		end,
		can_use = function(self, card, area, copier)
			return G.HUD_zodiac and #G.HUD_zodiac > 0
		end,
		load_check = function()
			return next(SMODS.find_mod("ortalab"))
		end,
	},
	'memorial_ticket', memorial_ticket = {
		config = {
			extra = {
				dollars = 1,
				max_dollars = 40,
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 1,
		cost = 3,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = { key = "graveyard", set = "Other" }
			return {vars = { card.ability.extra.dollars, card.ability.extra.max_dollars,
				math.min(card.ability.extra.max_dollars, card.ability.extra.dollars * AMM.api.graveyard.count_cards())}} -- TECHNICALLY a dirty solution. TECHNICALLY works.
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('timpani')
				used_tarot:juice_up(0.3, 0.5)
				ease_dollars(math.max(0,math.min(card.ability.extra.max_dollars, card.ability.extra.dollars * AMM.api.graveyard.count_cards())), true)
				return true end }))
			delay(0.6)
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
	},
	'ironskin_potion', ironskin_potion = {
		effect = 'steelify',
		config = {
			extra = {
				card_type = "m_steel",
				active = false,
			},
		},
		pos = { x = 0, y = 4 },
		cost = 6,
		rarity = 2,
		loc_vars = enhancement_potion_lv,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = enhancement_potion,
	},
	'stoneskin_potion', stoneskin_potion = {
		config = {
			extra = {
				card_type = "m_stone",
				active = false,
			},
		},
		pos = { x = 0, y = 4 },
		cost = 6,
		rarity = 2,
		loc_vars = enhancement_potion_lv,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = enhancement_potion,
	},
	'midas_potion', midas_potion = {
		config = {
			extra = {
				card_type = "m_gold",
				active = false,
			},
		},
		pos = { x = 0, y = 4 },
		cost = 6,
		rarity = 2,
		loc_vars = enhancement_potion_lv,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = enhancement_potion,
	},
	'stardust_potion', stardust_potion = {
		config = {
			extra = {
				card_type = "m_ortalab_iou",
				active = false,
			},
		},
		pos = { x = 0, y = 4 },
		cost = 6,
		rarity = 2,
		loc_vars = enhancement_potion_lv,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = enhancement_potion,
		load_check = function()
			return next(SMODS.find_mod("ortalab")) and true
		end,
	},
	'teal_potion', teal_potion = {
		config = {
			extra = {
				card_type = "m_mf_teal",
				active = false,
			},
		},
		pos = { x = 0, y = 4 },
		cost = 6,
		rarity = 2,
		loc_vars = enhancement_potion_lv,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = enhancement_potion,
		load_check = function()
			return next(SMODS.find_mod("MoreFluff")) and true
		end,
	},
	'brickskin_potion', brickskin_potion = {
		config = {
			extra = {
				card_type = "m_akyrs_brick_card",
				active = false,
			},
		},
		pos = { x = 0, y = 4 },
		cost = 6,
		rarity = 2,
		loc_vars = enhancement_potion_lv,
		use = activate_oddity,
		can_use = function(self, card) return G.STATE == G.STATES.SELECTING_HAND and not card.ability.extra.active end,
		keep_on_use = function(self, card)
			return true
		end,
		calculate = enhancement_potion,
		load_check = function()
			return next(SMODS.find_mod("aikoyorisshenanigans")) and true
		end,
	},--]]
	'experience_splitter', experience_splitter = {
		config = {
			extra = {
				per_entr_level = 10,
			},
		},
		pos = { x = 0, y = 4 },
		rarity = 3,
		cost = 7,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			--info_queue[#info_queue+1] = G.P_CENTERS.m_akyrs_brick_card
			return {vars = {  }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			-- level up each of each suit's levels to the highest level among that suit's levels
			
			for _, suit in ipairs(SMODS.Suit.obj_buffer) do
				local target = 0
				
				-- AMM suit level
				target = math.max(target, G.GAME.amm_data.suit_levels[suit].level)
				
				-- Entropy suit level
				if type(Entropy) == "table" and G.GAME.SuitBuffs and G.GAME.SuitBuffs[suit] and G.GAME.SuitBuffs[suit].level and G.GAME.SuitBuffs[suit].level > target then
					target = G.GAME.SuitBuffs[suit].level
				end
				
				-- TARGET DECIDED
				
				-- AMM suit level
				if G.GAME.amm_data.suit_levels[suit].level < target then
					AMM.level_up_suit(used_tarot, suit, nil, target - G.GAME.amm_data.suit_levels[suit].level)
				end
				
				-- Entropy suit level
				if type(Entropy) == "table" then
					if not G.GAME.SuitBuffs then G.GAME.SuitBuffs = {} end
					if not G.GAME.SuitBuffs[suit] then
						G.GAME.SuitBuffs[suit] = {level = 1, chips = 0}
					end
					if not G.GAME.SuitBuffs[suit].chips then G.GAME.SuitBuffs[suit].chips = 0 end
					if not G.GAME.SuitBuffs[suit].level then G.GAME.SuitBuffs[suit].level = 1 end
					if G.GAME.SuitBuffs[suit].level < target then
						Entropy.LevelSuit(suit, used_tarot, target - G.GAME.SuitBuffs[suit].level, card.ability.extra.per_entr_level)
					end
				end
				
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("entr"))
			) and true
		end,
	},
	'chaos_harness', chaos_harness = {
		config = {
			extra = {
				balance = 0.01,
			},
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			
			local count = AMM.api.graveyard.filter_count(function(v)
				return (SMODS.has_enhancement(v, "m_cry_light") or SMODS.has_enhancement(v, "m_entr_dark")) and true
			end)
			info_queue[#info_queue+1] = G.P_CENTERS.m_cry_light
			info_queue[#info_queue+1] = G.P_CENTERS.m_entr_dark
			return {vars = { card.ability.extra.balance * 100, count or 0 }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			
			-- Each card held in hand gains #1#% Balance permanently for each Light Card or Dark Card in your graveyard
			
			local count = AMM.api.graveyard.filter_count(function(v)
				return (SMODS.has_enhancement(v, "m_cry_light") or SMODS.has_enhancement(v, "m_entr_dark")) and true
			end)
			
			if count > 1 then -- possible via revive effects following collecting this
				for i=1, #G.hand.cards do
					G.hand.cards[i].ability.perma_balance = G.hand.cards[i].ability.perma_balance or 0
					G.hand.cards[i].ability.perma_balance = G.hand.cards[i].ability.perma_balance + (card.ability.extra.balance * count)
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
						card_eval_status_text(G.hand.cards[i], 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.PURPLE, instant = true})
					return true end}))
				end
			end
			
		end,
		can_use = function(self, card, area, copier)
			return G.hand and #G.hand.cards > 0
		end,
		in_pool = function(self)
			-- check for at least one Light Card or Dark Card in your graveyard
			return AMM.api.graveyard.filter_count(function(v)
				return (SMODS.has_enhancement(v, "m_cry_light") or SMODS.has_enhancement(v, "m_entr_dark")) and true
			end) > 0
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("pta_saka")) and next(SMODS.find_mod("Cryptid")) and next(SMODS.find_mod("entr"))
			) and true
		end,
	},
	'yellow_amulet', yellow_amulet = {
		config = {
			extra = {
				
			},
		},
		pos = { x = 0, y = 4 },
		rarity = 1,
		cost = 3,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'entr_yellow_sign', set = 'Other'}
			--info_queue[#info_queue+1] = G.P_CENTERS.m_entr_dark
			return {vars = {  }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			
			for i=1, #G.hand.cards do
				local this_card = G.hand.cards[i]
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
					card_eval_status_text(this_card, 'extra', nil, nil, nil, {message = ' ', colour = G.C.GOLD, instant = true})
					this_card.ability.entr_yellow_sign = true
				return true end}))
			end
			
		end,
		can_use = function(self, card, area, copier)
			return G.GAME.blind.in_blind
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("entr"))
			) and true
		end,
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