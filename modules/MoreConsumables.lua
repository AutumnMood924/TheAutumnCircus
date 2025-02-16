

local function stampcarduse(_, self, area, copier)
	local used_tarot = copier or self
	local conv_card = pseudorandom_element(self.eligible_strength_jokers, pseudoseed(self.ability.name))
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
		conv_card:set_seal(self.ability.extra, nil, true)
		return true end }))
	
	delay(0.5)
end

local function stampcardcanuse(_, self)
    if next(self.eligible_strength_jokers) then return true end
end

local function stampcardupdate(_, self, dt)
	if G.jokers then
		self.eligible_strength_jokers = EMPTY(self.eligible_strength_jokers)
		for k, v in pairs(G.jokers.cards) do
			if v.ability.set == 'Joker' and (not v.seal) then
				table.insert(self.eligible_strength_jokers, v)
			end
		end
	end
end

local suitplanettext = {
	"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
	"{V:2}#2#",
	"{C:mult}+#3#{} Mult and",
	"{C:chips}+#4#{} chips"
}

local suitplanetloc_vars = function(_c, info_queue)
	return {vars = {
		G.GAME.amm_data.suit_levels[_c.config.level_suit].level,
		localize(_c.config.level_suit, 'suits_plural'),
		AMM.config.suit_levels.mult,
		AMM.config.suit_levels.chips,
		colours = {
			(G.GAME.amm_data.suit_levels[_c.config.level_suit].level<=1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.amm_data.suit_levels[_c.config.level_suit].level)]),
			G.C.SUITS[_c.config.level_suit],
		}
	}}
end

local tarots = {
	'universe', universe = {
		name = "The Universe",
		text = {
			'Randomly enhances {C:attention}#1#{}',
			'selected cards',
			'{C:inactive}Having seen the World\'s vastness,{}',
			'{C:inactive}the Fool saw endless possibility{}',
		},
		boxes = { 2, 2, },
		effect = 'Random Enhancement',
		config = {
			max_highlighted = 3,
		},
		pos = { x = 0, y = 0 },
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				return true end }))
			for i=1, #G.hand.highlighted do
				local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.2)
			for i=1, #G.hand.highlighted do
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(TheAutumnCircus.func.pseudorandom_enhancement());return true end }))
			end
			for i=1, #G.hand.highlighted do
				local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
		end,
	},
	'void', void = {
		name = "Void",
		text = {
			'{C:attention}Removes{} each enhancement from',
			'up to {C:attention}#1#{} cards and gain {C:money}$#2#{} for',
			'each {C:attention}removed{} enhancement',
			'{C:inactive}However, the Fool was unable to handle{}',
			'{C:inactive}this freedom, and fell to aimless despair{}',
		},
		boxes = { 3, 2, },
		effect = 'Remove Enhancement',
		config = {
			max_highlighted = 5,
			extra = {
				dollars = 6,
			},
		},
		pos = { x = 1, y = 0 },
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted, _c.config.extra.dollars }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			local payout = 0
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				return true end }))
			for i=1, #G.hand.highlighted do
				local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.2)
			for i=1, #G.hand.highlighted do
				if G.hand.highlighted[i].config.center ~= G.P_CENTERS['c_base'] then
					payout = payout + self.ability.extra.dollars
				end
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(G.P_CENTERS['c_base']);return true end }))
			end
			for i=1, #G.hand.highlighted do
				local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
            if payout > 0 then ease_dollars(payout) end
		end,
	},
	'happy_squirrel', happy_squirrel = {
		name = "The Happy Squirrel",
		text = {
			"Create {C:attention}#2#{} copy of",
			"{C:attention}#1#{} selected card",
			"without an enhancement",
			"in your hand",
			'{C:inactive}Seeking meaning once again, the Fool{}',
			'{C:inactive}looked to nature\'s simplicity{}',
		},
		boxes = { 4, 2, },
		effect = 'Copy Unenhanced',
		config = {
			--max_highlighted = 1,
			extra = {
				copies = 1,
			}
		},
		pos = { x = 2, y = 0 },
		loc_vars = function(_c) return {vars = { 1, _c.config.extra.copies }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				return true end }))
			G.E_MANAGER:add_event(Event({
				func = function()
					local _first_dissolve = nil
					local new_cards = {}
					for i = 1, self.ability.extra.copies do
						G.playing_card = (G.playing_card and G.playing_card + 1) or 1
						local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
						_card:add_to_deck()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						table.insert(G.playing_cards, _card)
						G.hand:emplace(_card)
						_card:start_materialize(nil, _first_dissolve)
						_first_dissolve = true
						new_cards[#new_cards+1] = _card
					end
					playing_card_joker_effects(new_cards)
					return true
				end
			}))
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
		end,
		can_use = function(_, self) return #G.hand.highlighted == 1 and G.hand.highlighted[1].ability.set == "Default" end
	},
	'artist', artist = {
		name = "The Artist",
		text = {
			'Select {C:attention}#1#{} card,',
			'apply its {C:attention}enhancement{}, {C:dark_edition}edition{},',
			'and {C:purple}seal{} to {C:attention}#2#{} {C:green}random{}',
			'cards in your hand'
		},
		effect = 'A PAINTING OF THE SOUL',
		config = {
			max_highlighted = 1,
			extra = {
				targets = 2,
			},
		},
		pos = { x = 3, y = 0 },
		loc_vars = function(_c) return {vars = { _c.config.max_highlighted, _c.config.extra.targets }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			local selected_card = G.hand.highlighted[1]
			local target_cards = {}
				
            local temp_hand = {}
            for k, v in ipairs(G.hand.cards) do
				if v ~= selected_card then
					temp_hand[#temp_hand+1] = v
				end
			end
            table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
            pseudoshuffle(temp_hand, pseudoseed('artist'))

            for i = 1, self.ability.extra.targets do target_cards[#target_cards+1] = temp_hand[i] end

			for i=1, #target_cards do
				local percent = 1.15 - (i-0.999)/(#target_cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() target_cards[i]:flip();play_sound('card1', percent);target_cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.2)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true end }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    for i=#target_cards, 1, -1 do
                        local card = target_cards[i]
						card:set_ability(selected_card.config.center)
						card:set_edition(selected_card.edition)
						card:set_seal(selected_card.seal)
                    end
                    return true end }))
			for i=1, #target_cards do
				local percent = 0.85 + (i-0.999)/(#target_cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() target_cards[i]:flip();play_sound('tarot2', percent, 0.6);target_cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
		end,
	},
	'veteran', veteran = {
		name = "The Veteran",
		text = {
			"Enhances {C:attention}#1#",
			"selected cards to",
			"{C:attention}#2#s"
		},
		effect = 'vet',
		config = {
			mod_conv = "m_thac_star",
			max_highlighted = 2,
		},
		pos = { x = 4, y = 0 },
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS[card.ability.consumeable.mod_conv]
			return {
				vars = {
					card.ability.consumeable.max_highlighted,
					localize{
						type = 'name_text',
						set = 'Enhanced',
						key = card.ability.consumeable.mod_conv
					}
				}
			}
		end,
	},
	'drunkard', drunkard = {
		name = "The Drunkard",
		text = {
			"Enhances {C:attention}#1#",
			"selected cards to",
			"{C:attention}#2#s"
		},
		effect = 'dunk',
		config = {
			mod_conv = "m_thac_dirt",
			max_highlighted = 3,
		},
		pos = { x = 5, y = 0 },
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS[card.ability.consumeable.mod_conv]
			return {
				vars = {
					card.ability.consumeable.max_highlighted,
					localize{
						type = 'name_text',
						set = 'Enhanced',
						key = card.ability.consumeable.mod_conv
					}
				}
			}
		end,
	},
	'juggler', juggler = {
		name = "The Juggler",
		subtitle = "Work In Progress!",
		text = {
			'{C:inactive}Not Yet Implemented',
		},
		effect = 'jugs',
		config = {
		},
		pos = { x = 6, y = 0 },
		yes_pool_flag = "neversetthis",
	},
	'grass', grass = {
		name = "The Grass",
		subtitle = "Work In Progress!",
		text = {
			"Enhances {C:attention}#1#",
			"selected cards to",
			"{C:attention}#2#s"
		},
		effect = 'grass',
		config = {
			mod_conv = "m_thac_grass",
			max_highlighted = 3,
		},
		pos = { x = 7, y = 6 },
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS[card.ability.consumeable.mod_conv]
			return {
				vars = {
					card.ability.consumeable.max_highlighted,
					localize{
						type = 'name_text',
						set = 'Enhanced',
						key = card.ability.consumeable.mod_conv
					}
				}
			}
		end,
	},
	'joker', joker = {
		name = "The Joker",
		text = {
			'{C:red}+#1#{} Mult while in your',
			'{C:attention}consumable{} area',
			'{C:inactive}Hee hee, hoo hoo!{}',
			'{C:inactive}Looks like the joke\'s{}',
			'{C:dark_edition,E:2,s:1.75}ON YOU!{}',
		},
		boxes = { 2, 3, },
		effect = 'NOTHING',
		config = {
			mult = 4
		},
		pos = { x = 0, y = 1 },
		loc_vars = function(_c) return {vars = { _c.config.mult }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, func = function()
                attention_text({
                    text = 'Hee hee!',
                    scale = 1.3, 
                    hold = 1.2,
                    major = used_tarot,
                    backdrop_colour = G.C.PURPLE,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    used_tarot:juice_up(0.3, 0.5)
            return true end }))
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.5, func = function()
                attention_text({
                    text = 'Hoo hoo!',
                    scale = 1.3, 
                    hold = 1.2,
                    major = used_tarot,
                    backdrop_colour = G.C.ORANGE,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    used_tarot:juice_up(0.3, 0.5)
            return true end }))
			delay(2.5)
		end,
		can_use = function(_, self) return true end,
		calculate = function(self, card, context)
			if context.joker_main then
				local function append_extra(ret, append)
					if ret.extra then return append_extra(ret.extra, append) end
					ret.extra = append
					return ret
				end
				local ret = {
					message = 'Hee hee!',
					colour = G.C.PURPLE
				}
				append_extra(ret, {
					message = 'Hoo hoo!',
					colour = G.C.ORANGE
				})
				if pseudorandom(pseudoseed('joker_tarot_secret')) < G.GAME.probabilities.normal / 1000 then
					append_extra(ret, {
						message = 'It is time!',
						colour = G.C.BLUE
					})
					append_extra(ret, {
						message = 'For my true power!',
						colour = G.C.RED
					})
					for i=1, 1000 do
						append_extra(ret, {
							message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.consumeable.mult}},
							func = function()
								percent = percent + percent_delta
							end,
							mult_mod = card.ability.consumeable.mult
						})
					end
					return ret
				end
				append_extra(ret, {
					message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.consumeable.mult}},
					mult_mod = card.ability.consumeable.mult
				})
				return ret
			end
		end,
	},
	'page_of_cups', page_of_cups = {
		name = "Page of Cups",
		text = {
			"Converts up to",
			"{C:attention}#1#{} selected cards",
			"to {V:1}#2#{}"
		},
		pos = {x = 1, y = 1},
		effect = "Suit Conversion",
		config = {
			suit_conv = "thac_Cups",
			max_highlighted = 3,
		},
		loc_vars = function(_c)
			return {vars = { _c.config.max_highlighted, localize(_c.config.suit_conv, 'suits_plural'), colours = { G.C.SUITS[_c.config.suit_conv] } }}
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord and TheAutumnCircus.config.enabled_suits.cups
		end,
	},
	'page_of_wands', page_of_wands = {
		name = "Page of Wands",
		text = {
			"Converts up to",
			"{C:attention}#1#{} selected cards",
			"to {V:1}#2#{}"
		},
		pos = {x = 2, y = 1},
		effect = "Suit Conversion",
		config = {
			suit_conv = "thac_Wands",
			max_highlighted = 3,
		},
		loc_vars = function(_c)
			return {vars = { _c.config.max_highlighted, localize(_c.config.suit_conv, 'suits_plural'), colours = { G.C.SUITS[_c.config.suit_conv] } }}
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord and TheAutumnCircus.config.enabled_suits.wands
		end,
	},
	'page_of_coins', page_of_coins = {
		name = "Page of Coins",
		text = {
			"Converts up to",
			"{C:attention}#1#{} selected cards",
			"to {V:1}#2#{}"
		},
		pos = {x = 3, y = 1},
		effect = "Suit Conversion",
		config = {
			suit_conv = "thac_Coins",
			max_highlighted = 3,
		},
		loc_vars = function(_c)
			return {vars = { _c.config.max_highlighted, localize(_c.config.suit_conv, 'suits_plural'), colours = { G.C.SUITS[_c.config.suit_conv] } }}
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord and TheAutumnCircus.config.enabled_suits.coins
		end,
	},
	'page_of_swords', page_of_swords = {
		name = "Page of Swords",
		text = {
			"Converts up to",
			"{C:attention}#1#{} selected cards",
			"to {V:1}#2#{}"
		},
		pos = {x = 4, y = 1},
		effect = "Suit Conversion",
		config = {
			suit_conv = "thac_Swords",
			max_highlighted = 3,
		},
		loc_vars = function(_c)
			return {vars = { _c.config.max_highlighted, localize(_c.config.suit_conv, 'suits_plural'), colours = { G.C.SUITS[_c.config.suit_conv] } }}
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord and TheAutumnCircus.config.enabled_suits.swords
		end,
	},
}

local planets = {
	'comet', comet = {
		name = "Comet",
		text = {
			"Upgrades a {C:green}random{}",
			"poker hand by {C:attention}#1#{} levels",
		},
		effect = 'Random Hand Upgrade',
		config = {strength = 2},
		pos = { x = 0, y = 2 },
		loc_vars = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_comet', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_comet', set = 'Other'}
			end
			return {vars = { _c.config.strength }}
		end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			local chosen_hand = TheAutumnCircus.func.pseudorandom_unlocked_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(_, self) return true end,
		set_badges = function(_, self, badges)
			if self.config.center.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Comet", get_type_colour(self.config.center or self.config, self), nil, 1.2)
				return badges
			end
		end,
		calculate = function(_, self, context)
			if context.joker_main then
				if G.GAME.used_vouchers.v_observatory and context.scoring_name == TheAutumnCircus.func.pseudorandom_unlocked_hand(nil, 'comet_observatory') then
					local value = G.P_CENTERS.v_observatory.config.extra * G.P_CENTERS.v_observatory.config.extra
					return {
						message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
						Xmult_mod = value
					}
				end
				if G.GAME.used_vouchers.v_observatory then return {
					message = localize('k_nope_ex'),
				} end
			end
		end,
	},
	'meteor', meteor = {
		name = "Meteor",
		text = {
			"Upgrades a {C:green}random{}",
			"poker hand by {C:attention}#1#{} levels,",
			"but {C:attention}decreases{} a different",
			"{C:green}random{} poker hand's level by #2#"
		},
		effect = 'Random Hand Upgrade And Downgrade',
		config = {strength = 3, weakness = 1},
		pos = { x = 1, y = 2 },
		loc_vars = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_meteor', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_meteor', set = 'Other'}
			end
			return {vars = { _c.config.strength, _c.config.weakness }}
		end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			-- upgrade
			local chosen_hand = TheAutumnCircus.func.pseudorandom_unlocked_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
			-- downgrade
			chosen_hand = TheAutumnCircus.func.pseudorandom_unlocked_hand(chosen_hand)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			if (type(G.GAME.hands[chosen_hand].level) == 'table' and G.GAME.hands[chosen_hand].level:lte(1)) or G.GAME.hands[chosen_hand].level <= 1 then delay(1.5) else
				level_up_hand(used_tarot, chosen_hand, nil, -1 * (used_tarot.ability.consumeable.weakness or 1))
			end
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(_, self) return true end,
		set_badges = function(_, self, badges)
			if self.config.center.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Meteor", get_type_colour(self.config.center or self.config, self), nil, 1.2)
				return badges
			end
		end,
		calculate = function(_, self, context)
			if context.joker_main then
				local hand_1 = TheAutumnCircus.func.pseudorandom_unlocked_hand(nil, 'meteor_observatory')
				local hand_2 = TheAutumnCircus.func.pseudorandom_unlocked_hand(nil, 'meteor_observatory')
				if G.GAME.used_vouchers.v_observatory and context.scoring_name == hand_1 then
					local value = G.P_CENTERS.v_observatory.config.extra * G.P_CENTERS.v_observatory.config.extra * G.P_CENTERS.v_observatory.config.extra
					return {
						message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
						Xmult_mod = value
					}
				elseif G.GAME.used_vouchers.v_observatory and context.scoring_name == hand_2 then
					local value = 1 / G.P_CENTERS.v_observatory.config.extra
					value = math.floor(value * 100) / 100 -- should round to 2 digits???
					return {
						message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
						Xmult_mod = value
					}
				end
				if G.GAME.used_vouchers.v_observatory then return {
					message = localize('k_nope_ex'),
				} end
			end
		end,
	},
	'satellite', satellite = {
		name = "Satellite",
		subtitle = "(Not the Joker One)",
		text = {
            "Creates up to {C:attention}2",
            "random {C:planet}Planet{} cards",
            "{C:inactive}(Must have room)"
        },
		effect = 'Round Bonus',
		config = {planets = 2},
		pos = { x = 2, y = 2 },
		loc_vars = function(_c) return {vars = { _c.config.planets }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			for i = 1, math.min(self.ability.consumeable.planets, G.consumeables.config.card_limit - #G.consumeables.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'pri')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(_, self) if #G.consumeables.cards < G.consumeables.config.card_limit or self.area == G.consumeables then return true end end,
		set_badges = function(_, self, badges)
			if self.config.center.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Space Junk", get_type_colour(self.config.center or self.config, self), nil, 1.2)
				return badges
			end
		end,
	},
	'moon', moon = {
		name = "Moon",
		subtitle = "Moon of Earth",
		text = {
            "Creates #1# random",
            "{C:tarot}Tarot{}, {C:planet}Planet{}, or",
			"{C:spectral}Spectral{} card",
            "{C:inactive}(Must have room)"
        },
		effect = 'Random Round Bonus',
		config = {cards = 1},
		pos = { x = 3, y = 2 },
		loc_vars = function(_c) return {vars = { _c.config.cards }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			for i = 1, math.min(self.ability.consumeable.cards, G.consumeables.config.card_limit - #G.consumeables.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local types = {'Tarot', 'Planet', 'Spectral'}
						local chosen_type = pseudorandom_element(types, pseudoseed("moon_planet_type"))
						local card = create_card(chosen_type, G.consumeables, nil, nil, nil, nil, nil, 'moon_planet')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(_, self) if #G.consumeables.cards < G.consumeables.config.card_limit or self.area == G.consumeables then return true end end,
		set_badges = function(_, self, badges)
			if self.config.center.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Moon", get_type_colour(self.config.center or self.config, self), nil, 1.2)
				return badges
			end
		end,
		load_check = function()
			return true
		end
	},
	'station', station = {
		name = "Space Station",
		text = {
			"Upgrades your most played",
			"poker hand by {C:attention}#1#{} level",
			"{C:inactive}Currently: {C:attention}#2#{}",
		},
		effect = 'Favorite Hand Upgrade',
		config = {strength = 1},
		pos = { x = 4, y = 2 },
		loc_vars = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_station', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_station', set = 'Other'}
			end
			return {vars = { _c.config.strength, TheAutumnCircus.func.favorite_hand() }}
		end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			local chosen_hand = TheAutumnCircus.func.favorite_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(_, self) return true end,
		set_badges = function(_, self, badges)
			if self.config.center.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Space Junk", get_type_colour(self.config.center or self.config, self), nil, 1.2)
				return badges
			end
		end,
		calculate = function(_, self, context)
			if context.joker_main then
				if G.GAME.used_vouchers.v_observatory and context.scoring_name == TheAutumnCircus.func.favorite_hand() then
					local value = G.P_CENTERS.v_observatory.config.extra
					return {
						message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
						Xmult_mod = value
					}
				end
			end
		end,
	},
	'dysnomia', dysnomia = {
		name = "Dysnomia",
		subtitle = "Moon of Eris",
		text = {
			"{C:green}Shuffle{} your poker hands' levels",
			"{C:green}#1# in #2#{} chance to {C:green}randomly{}",
			"{C:attention}upgrade{} or {C:attention}downgrade{}",
			"each shuffled hand",
		},
		boxes = { 1, 3, },
		effect = 'The D8',
		config = { extra = 2 },
		pos = { x = 5, y = 2 },
		loc_vars = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_dysnomia', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_dysnomia', set = 'Other'}
			end
			return {vars = { G.GAME.probabilities.normal, _c.config.extra }}
		end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
            local temp_hands = {{},{},{}}
            for k, v in pairs(G.GAME.hands) do
				if v.visible then
					temp_hands[1][#temp_hands[1]+1] = v
					temp_hands[2][#temp_hands[2]+1] = v.level
					temp_hands[3][#temp_hands[3]+1] = k
				end
			end
            pseudoshuffle(temp_hands[3], pseudoseed('dysnomia'))
			for i=1, #temp_hands[1] do
				G.GAME.hands[temp_hands[3][i]].level = temp_hands[2][i]
				if pseudorandom(pseudoseed('dysnomia_check1')) < G.GAME.probabilities.normal/self.ability.extra then
					if pseudorandom(pseudoseed('dysnomia_check2')) < 1/2 then
						G.GAME.hands[temp_hands[3][i]].level = math.max(1,G.GAME.hands[temp_hands[3][i]].level - 1)
					else
						G.GAME.hands[temp_hands[3][i]].level = G.GAME.hands[temp_hands[3][i]].level + 1
					end
				end
				level_up_hand(nil, temp_hands[3][i], true, 0)
			end
			
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                attention_text({
                    text = localize('k_thac_shuffle'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = used_tarot,
                    backdrop_colour = G.C.SECONDARY_SET.Planet,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    used_tarot:juice_up(0.3, 0.5)
            return true end }))
			
			delay(0.5)
		end,
		can_use = function(_, self) return true end,
		set_badges = function(_, self, badges)
			if self.config.center.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("wow this is useless", get_type_colour(self.config.center or self.config, self), nil, 1.4)
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1].nodes[1].nodes = {
				{n=G.UIT.R, config={align = "cm"},
					nodes = {
						{n=G.UIT.R, config={align = "cm"},nodes={{n=G.UIT.O, config={object = DynaText({string = 'Moon', colours = {G.C.WHITE},float = true, shadow = true, offset_y = -0.05, silent = true, spacing = 1, scale = 0.33*1.2})}}}},
						{n=G.UIT.R, config={align = "cm"},nodes={{n=G.UIT.O, config={object = DynaText({string = ' of a dwarf planet ', colours = {G.C.WHITE},float = true, shadow = true, offset_y = -0.05, silent = true, spacing = 1, scale = 0.33*0.7})}}}},
					}
				},
				}
				return badges
			end
		end,
		calculate = function(_, self, context)
			if G.GAME.used_vouchers.v_observatory then
				local value = G.P_CENTERS.v_observatory.config.extra
                --[[return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }]]
			end
		end,
	},
	'planet_s', planet_s = {
		name = "Planet S",
		subtitle = "Spades in Spades",
		text = suitplanettext,
		effect = 'Suit Level Upgrade',
		config = {level_suit = "Spades"},
		pos = { x = 6, y = 2 },
		loc_vars = suitplanetloc_vars,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.level_up_suit(used_tarot, self.config.level_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Planet?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
	},
	'planet_h', planet_h = {
		name = "Planet H",
		subtitle = "Hearty Hearts",
		text = suitplanettext,
		effect = 'Suit Level Upgrade',
		config = {level_suit = "Hearts"},
		pos = { x = 7, y = 2 },
		loc_vars = suitplanetloc_vars,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.level_up_suit(used_tarot, self.config.level_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Planet?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
	},
	'planet_c', planet_c = {
		name = "Planet C",
		subtitle = "Club's Clubbin'",
		text = suitplanettext,
		effect = 'Suit Level Upgrade',
		config = {level_suit = "Clubs"},
		pos = { x = 8, y = 2 },
		loc_vars = suitplanetloc_vars,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.level_up_suit(used_tarot, self.config.level_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Planet?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
	},
	'planet_d', planet_d = {
		name = "Planet D",
		subtitle = "Diamonds twice (funny somehow?)",
		text = suitplanettext,
		effect = 'Suit Level Upgrade',
		config = {level_suit = "Diamonds"},
		pos = { x = 9, y = 2 },
		loc_vars = suitplanetloc_vars,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.level_up_suit(used_tarot, self.config.level_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Planet?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
	},
	'shooting_star', shooting_star = {
		name = "Shooting Star",
		subtitle = "Look out it's got a gun!",
		text = suitplanettext,
		effect = 'Suit Level Upgrade',
		config = {level_suit = "six_Stars"},
		pos = { x = 4, y = 3 },
		loc_vars = suitplanetloc_vars,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.level_up_suit(used_tarot, self.config.level_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Star?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		load_check = function()
			return next(SMODS.find_mod('SixSuits'))
		end,
	},
	'chill_moon', chill_moon = {
		name = "Chill Moon",
		subtitle = "That moon has sunglasses on?",
		text = suitplanettext,
		effect = 'Suit Level Upgrade',
		config = {level_suit = "six_Moons"},
		pos = { x = 5, y = 3 },
		loc_vars = suitplanetloc_vars,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.level_up_suit(used_tarot, self.config.level_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Moon?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		load_check = function()
			return next(SMODS.find_mod('SixSuits'))
		end,
	},
	'nice_planet', nice_planet = {
		name = "Cancer",
		subtitle = "The Tumor",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_nice', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 0, y = 3 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Constellation...?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'blaze_planet', blaze_planet = {
		name = "Blaze Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_blaze', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'twice_nice_planet', twice_nice_planet = {
		name = "Twice Nice Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_twice_nice', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'skeet_planet', skeet_planet = {
		name = "The Veil",
		subtitle = "Edge of the Incipisphere",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_skeet', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 3, y = 3 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Asteroid Belt", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'little_dog_planet', little_dog_planet = {
		name = "Canis Minor",
		subtitle = "* The dog blocks the constellation.",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_little_dog', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 1, y = 3 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Constellation...?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'big_dog_planet', big_dog_planet = {
		name = "Big Dog Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_big_dog', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'little_cat_planet', little_cat_planet = {
		name = "Little Cat Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_little_cat', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'big_cat_planet', big_cat_planet = {
		name = "Big Cat Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_big_cat', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'castle_planet', castle_planet = {
		name = "Battlefield",
		subtitle = "Where Skaia's fate is decided",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_castle', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 2, y = 3 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Battlefield", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'blaze_house_planet', blaze_house_planet = {
		name = "Blaze House Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_blaze_house', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'flushblaze_planet', flushblaze_planet = {
		name = "Flushblaze Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_flushblaze', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'spectrumblaze_planet', spectrumblaze_planet = {
		name = "Spectrumblaze Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_spectrumblaze', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	'castle_flush_planet', castle_flush_planet = {
		name = "Castle Flush Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_castle_flush', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'castle_spectrum_planet', castle_spectrum_planet = {
		name = "Castle Spectrum Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_castle_spectrum', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	'skeet_flush_planet', skeet_flush_planet = {
		name = "Skeet Flush Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_skeet_flush', softlock = TheAutumnCircus.config.mechanics.all_hands_are_secret},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'skeet_spectrum_planet', skeet_spectrum_planet = {
		name = "Skeet Spectrum Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_skeet_spectrum', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	'blaze_five_planet', blaze_five_planet = {
		name = "Blaze Five Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_blaze_five', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'flushblaze_house_planet', flushblaze_house_planet = {
		name = "Flushblaze House Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_flushblaze_house', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'spectrumblaze_house_planet', spectrumblaze_house_planet = {
		name = "Spectrumblaze House Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_spectrumblaze_house', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	'flushblaze_five_planet', flushblaze_five_planet = {
		name = "Flushblaze Five Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_flushblaze_five', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'spectrumblaze_five_planet', spectrumblaze_five_planet = {
		name = "Spectrumblaze Five Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_spectrumblaze_five', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	'castle_stone_planet', castle_stone_planet = {
		name = "Stone Castle Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_castle_stone', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'castle_gold_planet', castle_gold_planet = {
		name = "Gold Castle Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_castle_gold', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'castle_steel_planet', castle_steel_planet = {
		name = "Steel Castle Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_castle_steel', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
	'castle_glass_planet', castle_glass_planet = {
		name = "Glass Castle Planet",
		subtitle = "Work In Progress!",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_castle_glass', softlock = true},
		pos = { x = 8, y = 6 },
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("ERROR", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		generate_ui = 0,
	},
}

local spectrals = {
	'chance', chance = {
		name = "Chance",
		text = {
			'{C:attention}COMPLETELY{} {C:green}randomizes{} each card',
			'in your hand, giving each of them a new',
			'{C:red}suit{}, {C:blue}rank{}, {C:attention}enhancement{}, {C:dark_edition}edition{}, and {C:purple}seal{}',
		},
		config = {
		},
		pos = { x = 0, y = 4 },
		loc_vars = function(_c) return {vars = {  }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				return true end }))
			for i=1, #G.hand.cards do
				local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.2)	
			local seal_list = {}
			for __, v in ipairs(G.P_CENTER_POOLS['Seal']) do
				table.insert(seal_list, v.key)
			end
			for i=1, #G.hand.cards do
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()	
					local card = G.hand.cards[i]
					
					-- Suit and Rank randomized
					card:set_base(pseudorandom_element(G.P_CARDS))
					
					-- Enhancement (~ 80% chance)
					if pseudorandom(pseudoseed('chancetime')) < 0.8 then
						card:set_ability(TheAutumnCircus.func.pseudorandom_enhancement())
					else
						card:set_ability(G.P_CENTERS['c_base'])
					end
					
					-- Edition (boosted rate dont ask me for numbers)
					-- 10% to apply Negative instead of polling a normal edition
					if pseudorandom(pseudoseed('chancetime')) < 0.1 then
						card:set_edition({negative = true})
					else
						local edition_rate = 2
						card:set_edition(poll_edition('standard_edition'..G.GAME.round_resets.ante, edition_rate, true))
					end


					
					-- Seal (~ 20% chance)
					local seal_rate = 10
					local seal_poll = pseudorandom(pseudoseed('stdseal'..G.GAME.round_resets.ante))
					if seal_poll > 1 - 0.02*seal_rate then
						local seal_type = pseudorandom(pseudoseed('stdsealtype'..G.GAME.round_resets.ante))
						seal_type = math.floor(seal_type * #seal_list)
						card:set_seal(seal_list[seal_type])
					else card:set_seal() end
					
					return true 
				end }))
			end
			for i=1, #G.hand.cards do
				local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.5)
		end,
		can_use = function(_, self) if #G.hand.cards > 1 then return true end end,
	},
	'offering', offering = {
		name = "Offering",
		text = {
			"Destroys half of your",
			"{C:attention}full deck{} at random,",
			"gain {C:dark_edition}+#2#{} Joker Slot",
		},
		config = { remove_card = true, extra = {destroy = 2, slots = 1} },
		pos = { x = 1, y = 4 },
		loc_vars = function(_c) return {vars = { _c.config.extra.destroy, _c.config.extra.slots }} end,
		use = function(_, self, area, copier)
			local destroyed_cards = {}
			local used_tarot = copier or self
            local temp_deck = {}
            for k, v in ipairs(G.playing_cards) do temp_deck[#temp_deck+1] = v end
            table.sort(temp_deck, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
            pseudoshuffle(temp_deck, pseudoseed('immolate'))

            for i = 1, math.floor(#temp_deck / self.ability.extra.destroy) do destroyed_cards[#destroyed_cards+1] = temp_deck[i] end

            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true end }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    for i=#destroyed_cards, 1, -1 do
                        local card = destroyed_cards[i]
                        if card.ability.name == 'Glass Card' then 
                            card:shatter()
                        else
                            card:start_dissolve(nil, i == #destroyed_cards)
                        end
                    end
                    return true end }))
			delay(0.3)
			for i = 1, #G.jokers.cards do
				G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
			end
            delay(0.2)
			G.E_MANAGER:add_event(Event({func = function()
				if G.jokers then 
					G.jokers.config.card_limit = G.jokers.config.card_limit + self.ability.extra.slots
				end
				return true end }))
		end,
		can_use = function(_, self) if #G.playing_cards > 1 then return true end end,
	},
	'tribute', tribute = {
		name = "Tribute",
		subtitle = "Work In Progress!",
		text = {
			"Destroys {C:red}all{} of your {C:attention}Jokers{},",
			"gain {C:dark_edition}+#1#{} Joker Slot",
		},
		config = { remove_card = true, extra = {slots = 1} },
		pos = { x = 9, y = 6 },
		loc_vars = function(_c) return {vars = { _c.config.extra.slots }} end,
		use = function(_, self, area, copier)
			local destroyed_cards = {}
			local used_tarot = copier or self

            for i = 1, #G.jokers.cards do 
				if not G.jokers.cards[i].ability.eternal then
					destroyed_cards[#destroyed_cards+1] = G.jokers.cards[i]
				end
			end

            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true end }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    for i=#destroyed_cards, 1, -1 do
                        local card = destroyed_cards[i]
                            card:start_dissolve(nil, i == #destroyed_cards)
                    end
                    return true end }))
            delay(0.2)
			G.E_MANAGER:add_event(Event({func = function()
				if G.jokers then 
					G.jokers.config.card_limit = G.jokers.config.card_limit + self.ability.extra.slots
				end
				return true end }))
		end,
		can_use = function(_, self) if #G.jokers.cards > 0 then return true end end,
	},
	'sacrifice', sacrifice = {
		name = "Sacrifice",
		subtitle = "Work In Progress!",
		text = {
			"{C:dark_edition}+#1#{} Joker Slot",
			"{C:blue}-#2# Hand{} per round"
		},
		config = { remove_card = true, extra = {slots = 1, hands = 1} },
		pos = { x = 9, y = 6 },
		loc_vars = function(_c) return {vars = { _c.config.extra.slots, _c.config.extra.hands }} end,
		use = function(_, self, area, copier)
			local destroyed_cards = {}
			local used_tarot = copier or self

            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
				card_eval_status_text(self, 'extra', nil, nil, nil, {message = '-1 Hand', colour = G.C.BLUE})
                return true end }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
					G.GAME.round_resets.hands = G.GAME.round_resets.hands - self.ability.extra.hands
					ease_hands_played(-self.ability.extra.hands)
                    return true end }))
            delay(0.2)
			G.E_MANAGER:add_event(Event({func = function()
				if G.jokers then 
					G.jokers.config.card_limit = G.jokers.config.card_limit + self.ability.extra.slots
				end
				return true end }))
		end,
		can_use = function(_, self) return true end,
	},
	'scry', scry = {
		name = "Scry",
		text = {
            "Creates up to {C:attention}2",
            "random {C:spectral}Spectral{} cards",
            "{C:inactive}(Must have room)"
		},
		config = { extra = {spectrals = 2} },
		pos = { x = 2, y = 4 },
		loc_vars = function(_c) return {vars = { _c.config.extra.destroy, _c.config.extra.slots }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			for i = 1, math.min(self.ability.extra.spectrals, G.consumeables.config.card_limit - #G.consumeables.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'scry')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(_, self) if #G.consumeables.cards < G.consumeables.config.card_limit or self.area == G.consumeables then return true end end,
	},
	'lotus', lotus = {
		name = "Lotus",
		subtitle = "Work In Progress!",
		text = {
            "Creates {C:attention}#1# random",
			"{C:dark_edition}Negative {C:tarot}Tarot{} cards",
            "{C:inactive}(Must have room)"
		},
		config = { extra = {tarots = 3} },
		pos = { x = 9, y = 6 },
		loc_vars = function(_c, iq, card) return {vars = { card.ability.extra.tarots }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			for i = 1, self.ability.extra.tarots do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					play_sound('timpani')
					local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'lotus')
					card:set_edition({negative = true})
					card:add_to_deck()
					G.consumeables:emplace(card)
					used_tarot:juice_up(0.3, 0.5)
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(_, self) return true end,
	},
	'phantom', phantom = {
		name = "Phantom",
		text = {
			"Creates a random {C:dark_edition}Negative{}",
			"and {C:attention}Perishable{} {C:attention}Joker{},",
			"then sets the {C:attention}sell value{}",
			"of {C:attention}all Jokers{} to {C:money}$0{}",
		},
		config = {extra = {jokers = 1}},
		pos = {x = 3, y = 4},
		loc_vars = function(_c) return {vars = {}} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, 'phantom')
			card:set_edition({negative = true})
			card:set_eternal(false) -- just in case
			card:set_perishable(true)
			card:add_to_deck()
			G.jokers:emplace(card)
			delay(0.6)
			for i=1, #G.jokers.cards do
				G.jokers.cards[i].base_cost = 0
				G.jokers.cards[i].ability.extra_value = 0
				G.jokers.cards[i].cost = 0
				G.jokers.cards[i].sell_cost = 0
				G.jokers.cards[i].sell_cost_label = G.jokers.cards[i].facing == 'back' and '?' or G.jokers.cards[i].sell_cost
			end
		end,
		can_use = function(_, self) return true end,
		load_check = function()
			return not not Card.set_perishable
		end,
	},
	'mischief', mischief = {
		name = "Mischief",
		text = {
			"{C:attention}Destroys{} a random {C:attention}Joker{},",
			"then add a {C:green}random{} {C:purple}stamp{}",
			"to each other {C:attention}Joker{}"
		},
		config = { },
		pos = {x = 4, y = 4},
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			-- destroy a random joker
			AMM.destroy_random_jokers(G.jokers.cards, 1)
			delay(0.6)
			-- add stamps to the rest
			for k, v in ipairs(G.jokers.cards) do
				if not chosen_joker or v ~= chosen_joker then
					local keyset={}
					local n=0

					for k,v in pairs(SMODS.Stamps) do
						n=n+1
						keyset[n]=k
					end
					G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function() v:set_seal(pseudorandom_element(keyset, pseudoseed("mischiefs_reward")), false, true); return true end }))
				end
			end
			delay(0.5)
		end,
		can_use = function(_, self) 
			return #G.jokers.cards > 1
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps
		end,
	},
	'comedy', comedy = {
		name = "Comedy",
		text = {
			"Add {C:red}Steven's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_steven" },
		pos = {x = 5, y = 4},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.todd
		end,
	},
	'tragedy', tragedy = {
		name = "Tragedy",
		text = {
			"Add {C:blue}Todd's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_todd" },
		pos = {x = 6, y = 4},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.steven
		end,
	},
	'whimsy', whimsy = {
		name = "Whimsy",
		text = {
			"Add {C:attention}Jimbo's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_jimbo" },
		pos = {x = 7, y = 4},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.jimbo
		end,
	},
	'entropy', entropy = {
		name = "Entropy",
		text = {
			"Add {C:green}Chaos' Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_chaos" },
		pos = {x = 8, y = 4},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.chaos
		end,
	},
	'wonder', wonder = {
		name = "Wonder",
		text = {
			"Add {C:purple}Andy's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_andy" },
		pos = {x = 9, y = 4},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.andy
		end,
	},
	'macabre', macabre = {
		name = "Macabre",
		subtitle = "Work In Progress!",
		text = {
			"Add Mr. Bones' Stamp",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_mr_bones" },
		pos = {x = 9, y = 6},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.mr_bones
		end,
	},
	'duplicity', duplicity = {
		name = "Duplicity",
		subtitle = "Work In Progress!",
		text = {
			"Add {C:inactive}Sock and Buskin's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_sock_and_buskin" },
		pos = {x = 9, y = 6},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.sock_and_buskin
		end,
	},
	'banana', banana = {
		name = "Banana",
		subtitle = "Work In Progress!",
		text = {
			"Add a {C:money}Gros Michel Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_gros_michel" },
		pos = {x = 9, y = 6},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.gros_michel
		end,
	},
	'artifice', artifice = {
		name = "Artifice",
		subtitle = "Work In Progress!",
		text = {
			"Add a {C:blue}Blueprint Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "thac_blueprint" },
		pos = {x = 9, y = 6},
		loc_vars = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = _c.config.extra.."_stamp", set = "Other"}
			return {vars = {}}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps and TheAutumnCircus.config.enabled_stamps.blueprint
		end,
	},
	'quest_bed', quest_bed = {
		name = "Quest Bed",
		subtitle = "Work In Progress!",
		text = {
			"{C:attention}Destroys{} 2 random {C:attention}Jokers{},",
			"then add a {C:green}random{} {C:red}Aspect{}",
			"to each card held in hand",
			"{C:inactive}(Each card will receive the same {C:red}Aspect{C:inactive})"
		},
		config = { },
		pos = {x = 9, y = 6},
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			-- destroy a random joker
			AMM.destroy_random_jokers(G.jokers.cards, 2)
			delay(0.6)
			local keyset={}
			local n=0
			for k,v in pairs(AMM.Aspects) do
				n=n+1
				keyset[n]=k
			end
			local god_tier = pseudorandom_element(keyset, pseudoseed("god_tier"))
			for k, v in ipairs(G.hand.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function() v:set_aspect(god_tier, false, true); return true end }))
			end
			delay(0.5)
		end,
		can_use = function(_, self) 
			return #G.jokers.cards >= 2 and #G.hand.cards > 1
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.hamspect
		end,
	},
}

SMODS.Atlas{
	key = "MoreConsumables",
	path = "MoreConsumables.png",
	px = 71,
	py = 95,
}

--tarots
for _, k in ipairs(tarots) do
	local v = tarots[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Tarot", key = k, atlas = "MoreConsumables"})
end

--planets
for _, k in ipairs(planets) do
	local v = planets[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Planet", key = k, atlas = "MoreConsumables"})
end

--spectrals
for _, k in ipairs(spectrals) do
	local v = spectrals[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Spectral", key = k, atlas = "MoreConsumables"})
end