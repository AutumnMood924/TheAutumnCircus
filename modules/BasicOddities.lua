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

	local graveyarder = function(card, enhancement, pseed)
		for i=1,card.ability.extra.cards do
			local cardmak = create_playing_card({center = G.P_CENTERS[enhancement]}, G.deck)
			cardmak:set_edition(poll_edition(pseed), true, true)
			cardmak:set_seal(SMODS.poll_seal{key = pseed, mod = 10}, true, true)
			cardmak:move_to_graveyard()
		end
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
			info_queue[#info_queue+1] = G.P_CENTERS.m_thac_star
			info_queue[#info_queue+1] = G.P_CENTERS.m_thac_soulbound
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local cards = {}
			for i=1,card.ability.extra.cards do
				local centers = {G.P_CENTERS.m_bonus, G.P_CENTERS.m_mult, G.P_CENTERS.m_wild, G.P_CENTERS.m_lucky}
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
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i=1,card.ability.extra.cards do
				local centers = {G.P_CENTERS.m_steel, G.P_CENTERS.m_gold}
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
				cards = 4,
				enh = "m_thac_bone"
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 2,
		cost = 5,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS[card.ability.extra.enh]
            --info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.cards }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			graveyarder(card, card.ability.extra.enh, self.key)
		end,
		can_use = function(self, card, area, copier)
			return true
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
				local cardmak = create_playing_card({front = G.P_CARDS.H_thac_SWORD, center = enhancement}, G.hand)
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
	'mass_reanimation', mass_reanimation = {
		config = {
			extra = {
			}
		},
		pos = { x = 0, y = 4 },
		rarity = 3,
		cost = 8,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS["m_thac_soulbound"]
			return {vars = {  }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for k,v in ipairs(G.graveyard_area.cards) do
				v:set_ability(G.P_CENTERS["m_thac_soulbound"])
			end
		end,
		can_use = function(self, card, area, copier)
			return #G.graveyard_area.cards > 0
		end,
		in_pool = function(self)
			return #G.graveyard_area.cards > 0
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