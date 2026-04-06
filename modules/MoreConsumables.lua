

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

local suitplanetloc_vars = function(_c, info_queue, card)
	local cfg = (card and card.ability) or _c.config
	return {vars = {
		G.GAME.amm_data.suit_levels[cfg.level_suit].level,
		localize(cfg.level_suit, 'suits_plural'),
		AMM.config.suit_levels.mult,
		AMM.config.suit_levels.chips,
		colours = {
			(G.GAME.amm_data.suit_levels[cfg.level_suit].level<=1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.amm_data.suit_levels[cfg.level_suit].level)]),
			G.C.SUITS[cfg.level_suit],
		}
	}}
end

local handplanetloc_vars = function(_c, info_queue, card)
	local cfg = (card and card.ability) or _c.config
	return {vars = {
		G.GAME.hands[cfg.hand_type].level,localize(cfg.hand_type, 'poker_hands'), G.GAME.hands[cfg.hand_type].l_mult, G.GAME.hands[cfg.hand_type].l_chips,
		colours = {(G.GAME.hands[cfg.hand_type].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[cfg.hand_type].level)])}
	}}
end

local tarots = {
	'fool', fool = {
		config = {
			mod_conv = "m_thac_cardboard",
			max_highlighted = 2,
		},
		pos = { x = 0, y = 0 },
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
	'magician', magician = {
		config = {
			extra = {
				dollars = 4,
				p_dollars = 13,
				h_dollars = 0,
			},
		},
		pos = { x = 1, y = 0 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.dollars, card.ability.extra.p_dollars, card.ability.extra.h_dollars }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			
			local mode = pseudorandom("magic2", 1, 6)
			
			if mode == 1 then -- dollars
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
						ease_dollars(card.ability.extra.dollars)
						used_tarot:juice_up(0.3, 0.5)
					return true end }))
			elseif mode == 2 then -- p_dollars
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
						ease_dollars(card.ability.extra.p_dollars)
						used_tarot:juice_up(0.3, 0.5)
					return true end }))
			elseif mode == 3 then -- h_dollars
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
						ease_dollars(card.ability.extra.h_dollars)
						used_tarot:juice_up(0.3, 0.5)
					return true end }))
			elseif mode == 4 then -- tarot
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'magic2')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			elseif mode == 5 then -- class
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Class', G.consumeables, nil, nil, nil, nil, nil, 'magic2')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			elseif mode == 6 then -- spectral
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'magic2')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(self, card) if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then return true end end,
	},
	'high_priestess', high_priestess = {
		config = {
			extra = {
			},
		},
		pos = { x = 2, y = 0 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		use = function(_, self, area, copier)
		end,
		can_use = function(_, self) return true end,
		in_pool = function() return false end,
	},
	'empress', empress = {
		config = {
			extra = {
			},
		},
		pos = { x = 3, y = 0 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		use = function(_, self, area, copier)
		end,
		can_use = function(_, self) return true end,
		in_pool = function() return false end,
	},
	'emperor', emperor = {
		config = {
			mod_conv = "m_thac_plan",
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
	'hierophant', hierophant = {
		config = {
			extra = {
				cards = 2
			},
		},
		pos = { x = 5, y = 0 },
		loc_vars = function(self,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.cards }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i = 1, math.min(card.ability.extra.cards, G.consumeables.config.card_limit - #G.consumeables.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Class', G.consumeables, nil, nil, nil, nil, nil, 'seer')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(self, card) if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then return true end end,
	},
	'lovers', lovers = {
		config = {
			max_highlighted = 2,
		},
		pos = { x = 6, y = 0 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.consumeable.max_highlighted }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				return true end }))
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() AMM.combine_cards(G.hand.highlighted, "temp2", G.hand); return true end }))
			delay(0.3)
		end,
	},
	'chariot', chariot = {
		config = {
			mod_conv = "m_thac_school",
			max_highlighted = 2,
		},
		pos = { x = 7, y = 0 },
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
	'justice', justice = {
		config = {
			extra = {
			},
		},
		pos = { x = 8, y = 0 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		use = function(_, self, area, copier)
		end,
		can_use = function(_, self) return true end,
		in_pool = function() return false end,
	},
	'hermit', hermit = {
		config = {
			mod_conv = "m_thac_mint",
			max_highlighted = 1,
		},
		pos = { x = 9, y = 0 },
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
	'wheel_of_fortune', wheel_of_fortune = {
		config = {
			max_highlighted = 3,
		},
		pos = { x = 10, y = 0 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.consumeable.max_highlighted }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
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
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() 
					SMODS.change_base(G.hand.highlighted[i], pseudorandom_element(SMODS.Suit.obj_buffer, pseudoseed('wof2')), pseudorandom_element(SMODS.Rank.obj_buffer, pseudoseed('wof2')));
					G.hand.highlighted[i]:set_ability(pseudorandom_element(G.P_CENTER_POOLS["Enhanced"], pseudoseed('wof2')))
				return true end }))
			end
			for i=1, #G.hand.highlighted do
				local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
		end,
	},
	'strength', strength = {
		config = {
			extra = {
			},
		},
		pos = { x = 0, y = 1 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		use = function(_, self, area, copier)
		end,
		can_use = function(_, self) return true end,
		in_pool = function() return false end,
	},
	'hanged_man', hanged_man = {
		config = {
			mod_conv = "m_thac_mist",
			max_highlighted = 2,
		},
		pos = { x = 1, y = 1 },
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
	'death', death = {
		config = {
			mod_conv = "m_thac_ecto",
			max_highlighted = 2,
		},
		pos = { x = 2, y = 1 },
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
	'temperance', temperance = {
		config = {
			extra = {
				dollars = 40
			},
		},
		pos = { x = 3, y = 1 },
		loc_vars = function(self, info_queue, card)
			local sum = 0
			if G.hand then
				for k,v in ipairs(G.hand.highlighted) do
					if not SMODS.has_no_suit(v) then
						sum = sum + G.GAME.amm_data.suit_levels[v.base.suit].level
					end
				end
				sum = math.min(sum, card.ability.extra.dollars)
			end
			return {
				vars = {
					card.ability.extra.dollars,
					sum
				}
			}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local sum = 0
			for k,v in ipairs(G.hand.highlighted) do
				if not SMODS.has_no_suit(v) then
					sum = sum + G.GAME.amm_data.suit_levels[v.base.suit].level
				end
			end
			sum = math.min(sum, card.ability.extra.dollars)
			
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					ease_dollars(sum)
					used_tarot:juice_up(0.3, 0.5)
				return true end }))
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
		end,
		can_use = function(self, card)
			return #G.hand.highlighted > 0
		end,
	},
	'devil', devil = {
		config = {
			mod_conv = "m_thac_shadow",
			max_highlighted = 1,
		},
		pos = { x = 4, y = 1 },
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
	'tower', tower = {
		config = {
			extra = {
				cards = 4
			},
		},
		pos = { x = 5, y = 1 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.cards }} end,
		use = function(self, card, area, copier)
			local destroyed_cards = {}
			local used_tarot = copier or card
            local temp_deck = {}
            for k, v in ipairs(G.playing_cards) do temp_deck[#temp_deck+1] = v end
            table.sort(temp_deck, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
            pseudoshuffle(temp_deck, pseudoseed('tower2'))

            for i = 1, math.floor(card.ability.extra.cards) do destroyed_cards[#destroyed_cards+1] = temp_deck[i] end

            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true end }))
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.2,
				func = function() 
					for i=#destroyed_cards, 1, -1 do
						local _card = destroyed_cards[i]
						if SMODS.shatters(_card) then
							_card:shatter()
						else
							_card:start_dissolve(nil, i == #G.hand.highlighted)
						end
					end
					return true end }))
			delay(0.3)
			SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })
		end,
		can_use = function(_, self) return true end,
	},
	'star', star = {
		config = {
			mod_conv = "m_thac_star",
			max_highlighted = 2,
		},
		pos = { x = 6, y = 1 },
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
	'mon', mon = {
		config = {
			extra = {
				tags = 1
			},
		},
		pos = { x = 7, y = 1 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = {key = 'tag_orbital', set = 'Tag'}
			return {vars = { card.ability.extra.tags, card.ability.extra.tags == 1 and "" or "s" }} end,
		use = function(_, card, area, copier)
			for i = 1, card.ability.extra.tags do
				local tag_ = Tag("tag_orbital", false, 'Small')
				tag_.ability.orbital_hand = TheAutumnCircus.func.pseudorandom_unlocked_hand()
				add_tag(tag_)
			end
			play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
			play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
			G.E_MANAGER:add_event(Event({
				func = (function()
					  for i = 1, #G.GAME.tags do
						G.GAME.tags[i]:apply_to_run({type = 'immediate'})
						G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'})
					  end
					return true
				end)
			}))
		end,
		can_use = function(_, self) return true end,
	},
	'sun', sun = {
		config = {
			mod_conv = "m_thac_spark",
			max_highlighted = 2,
		},
		pos = { x = 8, y = 1 },
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
	'judgement', judgement = {
		config = {
			extra = {
				tags = 2
			},
		},
		pos = { x = 9, y = 1 },
		loc_vars = function(_c, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.tags }} end,
		use = function(self, card, area, copier)
			local tagpool = get_current_pool('Tag')
			local tagset = {}
			for i = 1, card.ability.extra.tags do
				local tag = pseudorandom_element(tagpool, pseudoseed('chaos_tag'))
				while tag == 'UNAVAILABLE' do
					tag = pseudorandom_element(tagpool, pseudoseed('chaos_tag'))
				end
				tagset[i] = tag
			end
			G.E_MANAGER:add_event(Event({
				func = (function()
					for _, tag in pairs(tagset) do
						local tag_ = Tag(tag, false, 'Small')
						if tag == "tag_orbital" then
							tag_.ability.orbital_hand = TheAutumnCircus.func.pseudorandom_unlocked_hand()
						end
						add_tag(tag_)
					end
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
					G.E_MANAGER:add_event(Event({
						func = (function()
							  for i = 1, #G.GAME.tags do
								G.GAME.tags[i]:apply_to_run({type = 'immediate'})
								G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'})
							  end
							return true
						end)
					}))
					return true
				end)
			}))
		end,
		can_use = function(_, self) return true end,
	},
	'world', world = {
		config = {
			mod_conv = "m_thac_party",
			max_highlighted = 2,
		},
		pos = { x = 10, y = 1 },
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
		effect = 'NOTHING',
		config = {
			mult = 4
		},
		pos = { x = 0, y = 2 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { _c.config.mult }} end,
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
				if pseudorandom(pseudoseed('joker_tarot_secret')) < 1 / 100000 then
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
}

local planets = {
	'battlefield', battlefield = {
		name = "The Battlefield",
		effect = 'Hand Upgrade',
		config = {hand_type = 'thac_manus_arcana', softlock = true},
		pos = { x = 2, y = 3 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'fritz'} end
			return handplanetloc_vars(_c,info_queue,card)
		end,
		process_loc_text = function(self)
			local target_text = G.localization.descriptions.Planet['c_earth'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions.Planet[self.key].text = target_text
		end,
		set_badges = function(self, card, badges)
			if self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Skaian Cuboid", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		--generate_ui = 0, --??????
	},
	'satellite', satellite = {
		effect = 'Round Bonus',
		config = {planets = 2},
		pos = { x = 2, y = 2 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { _c.config.planets }} end,
		use = function(_, self, area, copier)
			local used_tarot = copier or self
			for i = 1, math.min(self.ability.consumeable.planets, G.consumeables.config.card_limit - #G.consumeables.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'satellite_planet')
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
		effect = 'Random Round Bonus',
		config = {cards = 1},
		pos = { x = 3, y = 2 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { _c.config.cards }} end,
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
	'dysnomia', dysnomia = {
		effect = 'The D8',
		config = { extra = {odds = 2} },
		pos = { x = 5, y = 2 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { SMODS.get_probability_vars(card, 1, card.ability.extra.odds) }}
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
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
				if SMODS.pseudorandom_probability(card, 'dysnomia_check', 1, card.ability.extra.odds) then
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
		effect = 'Suit Level Upgrade',
		config = {level_suit = "Spades"},
		pos = { x = 6, y = 2 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitplanetloc_vars(_c,info_queue,card)
		end,
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
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.level_suit, true) then return true end
            end
        end,
	},
	'planet_h', planet_h = {
		effect = 'Suit Level Upgrade',
		config = {level_suit = "Hearts"},
		pos = { x = 7, y = 2 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitplanetloc_vars(_c,info_queue,card)
		end,
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
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.level_suit, true) then return true end
            end
        end,
	},
	'planet_c', planet_c = {
		effect = 'Suit Level Upgrade',
		config = {level_suit = "Clubs"},
		pos = { x = 8, y = 2 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitplanetloc_vars(_c,info_queue,card)
		end,
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
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.level_suit, true) then return true end
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
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitplanetloc_vars(_c,info_queue,card)
		end,
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
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.level_suit, true) then return true end
            end
        end,
	},
}

local spectrals = {
	'quest_bed', quest_bed = {
		name = "Quest Bed",
		text = {
			"{C:attention}Destroys{} 2 random {C:attention}Jokers{},",
			"then adds a random {C:red}Aspect{}",
			"to each card held in hand",
			"{C:inactive}(Each card will receive the same {C:red}Aspect{C:inactive})"
		},
		config = { },
		pos = {x = 0, y = 5},
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
		end,
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

G.C.SET.Class = HEX("4f6367")
G.C.SECONDARY_SET.Class = HEX("d2cdca")
loc_colour("mult", nil)
G.ARGS.LOC_COLOURS["class"] = G.C.SECONDARY_SET.Class

SMODS.ConsumableType {
	key = 'Class',
	collection_rows = { 7, 7 },
	primary_colour = G.C.SET.Class,
	secondary_colour = G.C.SECONDARY_SET.Class,
	loc_txt = {
		name = "Class Card",
		collection = "Class Cards",
		label = "Class Card",
		undiscovered = {
			name = "Not Discovered",
			text = {
				"Purchase or use",
				"this card in an",
				"unseeded run to",
				"learn what it does"
			},
		},
	},
	inject_card = function(self, center)
		if not self.default then self.default = center.key end
		SMODS.ConsumableType.inject_card(self, center)
	end,
	shop_rate = 4,
}

local rank_conv_use = function(self, card, area, copier)
			local used_tarot = copier or card
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
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() SMODS.change_base(G.hand.highlighted[i], nil, card.ability.extra.rank_conv);return true end }))
	end
	for i=1, #G.hand.highlighted do
		local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
	end
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
	delay(0.5)
end

local rank_conv_loc_vars = function(self, info_queue, card)
	info_queue[#info_queue+1] = {set = "Other", key = card.ability.extra.rank_conv .. "_info"}
	return {vars = {
		card.ability.max_highlighted,
		localize(card.ability.extra.rank_conv, 'ranks'),
	}}
end

local classes = {
	'sylph', sylph = {
		config = {
			mod_conv = "m_thac_loop",
			max_highlighted = 2,
		},
		pos = { x = 0, y = 0 },
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
	'mage', mage = {
		config = {
			extra = {
				rank_conv = "thac_wand"
			},
			max_highlighted = 2,
		},
		pos = { x = 1, y = 0 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return rank_conv_loc_vars(_c, info_queue, card) end,
		use = rank_conv_use,
		can_use = function(_, self) return #G.hand.highlighted > 0 end,
	},
	'knight', knight = {
		config = {
			extra = {
				rank_conv = "thac_sword"
			},
			max_highlighted = 2,
		},
		pos = { x = 2, y = 0 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return rank_conv_loc_vars(_c, info_queue, card) end,
		use = rank_conv_use,
		can_use = function(_, self) return #G.hand.highlighted > 0 end,
	},
	'thief', thief = {
		config = {
			mod_conv = "m_thac_jewel",
			max_highlighted = 1,
		},
		pos = { x = 3, y = 0 },
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
	'prince', prince = {
		config = {
			extra = {
			},
			max_highlighted = 3,
		},
		pos = { x = 4, y = 0 },
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.max_highlighted }} end,
		use = function(self, card, area, copier)
			local destroyed_cards = {}
			local used_tarot = copier or card
			for i=#G.hand.highlighted, 1, -1 do
				destroyed_cards[#destroyed_cards+1] = G.hand.highlighted[i]
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				return true end }))
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.2,
				func = function() 
					for i=#G.hand.highlighted, 1, -1 do
						local _card = G.hand.highlighted[i]
						if SMODS.shatters(_card) then
							_card:shatter()
						else
							_card:start_dissolve(nil, i == #G.hand.highlighted)
						end
					end
					return true end }))
			delay(0.3)
			SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })
		end,
		can_use = function(self, card)
			local SUIT_MAP = {}
			local ret = false
			
			if #G.hand.highlighted == 0 then return false end
			
			for i = #SMODS.Suit.obj_buffer, 1, -1 do
				SUIT_MAP[SMODS.Suit.obj_buffer[i]] = 0
			end
			
			for k,v in ipairs(G.hand.highlighted) do
				for _,suit in pairs(SUIT_MAP) do
					if v:is_suit(_) then
						SUIT_MAP[_] = suit + 1
					end
				end
			end
			
			for k,v in pairs(SUIT_MAP) do
				if v >= #G.hand.highlighted then
					ret = true
					break
				end
			end
			
			return ret
		end,
	},
	'witch', witch = {
		config = {
			mod_conv = "m_thac_bone",
			max_highlighted = 2,
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
	'lord', lord = {
		config = {
			mod_conv = "m_thac_angel",
			max_highlighted = 9999999,
		},
		pos = { x = 6, y = 0 },
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS[card.ability.consumeable.mod_conv]
			return {
				vars = {
					localize{
						type = 'name_text',
						set = 'Enhanced',
						key = card.ability.consumeable.mod_conv
					}
				}
			}
		end,
		hidden = true,
		soul_rate = 0.0413,
		soul_set = "Tarot",
	},
	'maid', maid = {
		config = {
			extra = {
				tags = 1
			},
		},
		pos = { x = 0, y = 1 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = {key = 'tag_double', set = 'Tag'}
			return {vars = { card.ability.extra.tags, card.ability.extra.tags == 1 and "" or "s" }} end,
		use = function(_, card, area, copier)
			for i = 1, card.ability.extra.tags do
				add_tag(Tag("tag_double", false, 'Small'))
			end
			play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
			play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
			G.E_MANAGER:add_event(Event({
				func = (function()
					  for i = 1, #G.GAME.tags do
						G.GAME.tags[i]:apply_to_run({type = 'immediate'})
						G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'})
					  end
					return true
				end)
			}))
		end,
		can_use = function(_, self) return true end,
	},
	'seer', seer = {
		config = {
			extra = {
				cards = 2
			},
		},
		pos = { x = 1, y = 1 },
		loc_vars = function(self,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.cards }} end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i = 1, math.min(card.ability.extra.cards, G.consumeables.config.card_limit - #G.consumeables.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Class', G.consumeables, nil, nil, nil, nil, nil, 'seer')
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(self, card) if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then return true end end,
	},
	'page', page = {
		config = {
			mod_conv = "m_thac_ruled",
			max_highlighted = 1,
		},
		pos = { x = 2, y = 1 },
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
	'rogue', rogue = {
		config = {
			extra = {
				rank_conv = "thac_coin",
			},
			max_highlighted = 2,
		},
		pos = { x = 3, y = 1 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return rank_conv_loc_vars(_c, info_queue, card) end,
		use = rank_conv_use,
		can_use = function(_, self) return #G.hand.highlighted > 0 end,
	},
	'bard', bard = {
		config = {
			extra = {
				rank_conv = "thac_jester"
			},
			max_highlighted = 3,
		},
		pos = { x = 4, y = 1 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return rank_conv_loc_vars(_c, info_queue, card) end,
		use = rank_conv_use,
		can_use = function(_, self) return #G.hand.highlighted > 0 end,
	},
	'heir', heir = {
		config = {
			extra = {
				rank_conv = "thac_vessel"
			},
			max_highlighted = 2,
		},
		pos = { x = 5, y = 1 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return rank_conv_loc_vars(_c, info_queue, card) end,
		use = rank_conv_use,
		can_use = function(_, self) return #G.hand.highlighted > 0 end,
	},
	'muse', muse = {
		config = {
			extra = {
			},
		},
		pos = { x = 6, y = 1 },
		loc_vars = function(_c, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		use = function(_, self, area, copier)
		end,
		can_use = function(_, self) return true end,
		in_pool = function() return false end,
		hidden = true,
		soul_rate = 0.0413,
		soul_set = "Tarot",
	},
}

SMODS.Atlas{
	key = "ClassOfCards",
	path = "ClassOfCards.png",
	px = 71,
	py = 95,
}

--classes
for _, k in ipairs(classes) do
	local v = classes[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Class", key = k, atlas = "ClassOfCards"})
end