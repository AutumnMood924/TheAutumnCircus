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
			--[[G.hand.cards[i].ability.perma_mult = G.hand.cards[i].ability.perma_mult or 0
			G.hand.cards[i].ability.perma_mult = G.hand.cards[i].ability.perma_mult + self.ability.extra.chips
			G.hand.cards[i].ability.perma_xmult = G.hand.cards[i].ability.perma_xmult or 1
			G.hand.cards[i].ability.perma_xmult = G.hand.cards[i].ability.perma_xmult * self.ability.extra.chips
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
		loc_vars = function(_c) return {vars = { _c.config.extra.dollars }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.extra.dollars }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.extra.dollars }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.extra.dollars }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.extra.dollars }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted, _c.config.extra.chips }} end,
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
		loc_vars = function(_c) return {vars = { _c.config.extra.cards }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			local remember = G.hand.config.card_limit
			G.hand.config.card_limit = #G.hand.cards + self.ability.extra.cards
			G.FUNCS.draw_from_deck_to_hand(self.ability.extra.cards)
			G.hand.config.card_limit = remember
			delay(0.6)
		end,
		can_use = function(_, self) return #G.hand.cards > 1 and #G.deck.cards > 1 end,
	},
	'silica_packet', silica_packet = {
		name = "Silica Packet",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'tasty...',
		config = {
		},
		pos = { x = 1, y = 1 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
	},
	'jimbobread_man', jimbobread_man = {
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
		loc_vars = function(_c) return {vars = { _c.config.extra.hands }} end,
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
		effect = 'tasty...',
		config = {
			extra = {
				hands = 1
			}
		},
		pos = { x = 3, y = 1 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
		loc_vars = function(_c) return {vars = { _c.config.extra.hands }} end,
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
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'pokey',
		config = {
		},
		pos = { x = 4, y = 1 },
		rarity = 2,
		yes_pool_flag = "neversetthis",
	},
	'cultist_potion', cultist_potion = {
		name = "Cultist Potion",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'CAW CAW!!!!',
		config = {
		},
		pos = { x = 5, y = 1, scale_h = 60/95 },
		rarity = 3,
		yes_pool_flag = "neversetthis",
	},
	'fire_potion', fire_potion = {
		name = "Fire Potion",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'boom :3',
		config = {
		},
		pos = { x = 6, y = 1, scale_h = 67/95 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
	},
	'snecko_potion', snecko_potion = {
		name = "Snecko Oil",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'ssssssss',
		config = {
		},
		pos = { x = 7, y = 1, scale_h = 63/95 },
		rarity = 3,
		yes_pool_flag = "neversetthis",
	},
	'energy_potion', energy_potion = {
		name = "Energy Potion",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'I FEEL SO ENERGIZED',
		config = {
		},
		pos = { x = 8, y = 1, scale_h = 63/95 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
	},
	'vote_sticker', vote_sticker = {
		name = "Vote For Jimbo!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'votevotevote',
		config = {
		},
		pos = { x = 9, y = 1, scale_h = 69/95 },
		rarity = 1,
		yes_pool_flag = "neversetthis",
	},
	'cpu_memory', cpu_memory = {
		name = "CPU Memory",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'reject modernity become anime girl',
		config = {
		},
		pos = { x = 0, y = 2 },
		rarity = 3,
		yes_pool_flag = "neversetthis",
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
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'uhhhh funny joke or something',
		config = {
		},
		pos = { x = 2, y = 2 },
		rarity = 4,
		yes_pool_flag = "neversetthis",
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