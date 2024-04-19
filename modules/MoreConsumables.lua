
local function stampcarduse(self, area, copier)
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

local function stampcardcanuse(self)
    if next(self.eligible_strength_jokers) then return true end
end

local function stampcardupdate(self, dt)
	self.eligible_strength_jokers = EMPTY(self.eligible_strength_jokers)
	for k, v in pairs(G.jokers.cards) do
		if v.ability.set == 'Joker' and (not v.seal) then
			table.insert(self.eligible_strength_jokers, v)
		end
	end
end

local tarots = {
	universe = {
		name = "The Universe",
		text = {
			'Randomly enhances {C:attention}#1#{}',
			'selected cards',
			--'{C:inactive}Having seen the World\'s vastness,{}',
			--'{C:inactive}the Fool saw endless possibility{}',
		},
		effect = 'Random Enhancement',
		config = {
			max_highlighted = 4,
		},
		pos = { x = 0, y = 0 },
		loc_def = function(_c) return { _c.config.max_highlighted } end,
		use = function(self, area, copier)
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
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(ÞeAutumnCircus.func.pseudorandom_enhancement());return true end }))
			end
			for i=1, #G.hand.highlighted do
				local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
			end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			delay(0.5)
		end,
	},
	void = {
		name = "Void",
		text = {
			'{C:attention}Removes{} each enhancement from',
			'up to {C:attention}#1#{} cards and gain {C:money}$#2#{} for',
			'each {C:attention}removed{} enhancement',
			--'{C:inactive}However, the Fool was unable to handle{}',
			--'{C:inactive}this freedom, and fell to aimless despair{}',
		},
		effect = 'Remove Enhancement',
		config = {
			max_highlighted = 5,
			extra = {
				dollars = 6,
			},
		},
		pos = { x = 1, y = 0 },
		loc_def = function(_c) return { _c.config.max_highlighted, _c.config.extra.dollars } end,
		use = function(self, area, copier)
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
	happy_squirrel = {
		name = "The Happy Squirrel",
		text = {
			"Create {C:attention}#2#{} copy of",
			"{C:attention}#1#{} selected card",
			"without an enhancement",
			"in your hand",
			--'{C:inactive}Seeking meaning once again, the Fool{}',
			--'{C:inactive}looked to nature\'s simplicity{}',
		},
		effect = 'Copy Unenhanced',
		config = {
			--max_highlighted = 1,
			extra = {
				copies = 1,
			}
		},
		pos = { x = 2, y = 0 },
		loc_def = function(_c) return { 1, _c.config.extra.copies } end,
		use = function(self, area, copier)
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
		can_use = function(self) return #G.hand.highlighted == 1 and G.hand.highlighted[1].ability.set == "Default" end
	},
	artist = {
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
		loc_def = function(_c) return { _c.config.max_highlighted, _c.config.extra.targets } end,
		use = function(self, area, copier)
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
	joker = {
		name = "The Joker",
		text = {
			'{C:red}+#1#{} Mult while in your',
			'{C:attention}consumable{} area',
			'{C:inactive}Hee hee, hoo hoo!{}',
			'{C:inactive}Looks like the joke\'s{}',
			'{C:dark_edition,E:2,s:1.75}ON YOU!{}',
		},
		effect = 'NOTHING',
		config = {
			mult = 4
		},
		pos = { x = 0, y = 1 },
		loc_def = function(_c) return { _c.config.mult } end,
		use = function(self, area, copier)
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
		can_use = function(self) return true end,
		calculate = function(self, context)
			if context.joker_main then
				card_eval_status_text(self, 'extra', nil, nil, nil, {message = 'Hee hee!', colour = G.C.PURPLE})
				card_eval_status_text(self, 'extra', nil, nil, nil, {message = 'Hoo hoo!', colour = G.C.ORANGE})
				return {
					message = localize{type = 'variable', key = 'a_mult', vars = {self.ability.consumeable.mult}},
					mult_mod = self.ability.consumeable.mult
				}
			end
		end,
	},
}

local tarot_codex = {
	'universe',
	'void',
	'happy_squirrel',
	'artist',
	
	'joker',
}

local planets = {
	comet = {
		name = "Comet",
		text = {
			"Upgrades a {C:green}random{}",
			"poker hand by {C:attention}#1#{} levels",
		},
		effect = 'Random Hand Upgrade',
		config = {strength = 2},
		pos = { x = 0, y = 2 },
		loc_def = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_comet', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_comet', set = 'Other'}
			end
			return { _c.config.strength }
		end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			local chosen_hand = ÞeAutumnCircus.func.pseudorandom_unlocked_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(self) return true end,
		set_badges = function(self, badges)
			badges[1].nodes[1].nodes[2].config.object:remove()
			badges[1] = create_badge("Comet", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
		calculate = function(self, context)
			if G.GAME.used_vouchers.v_observatory and context.scoring_name == ÞeAutumnCircus.func.pseudorandom_unlocked_hand(nil, 'comet_observatory') then
				local value = G.P_CENTERS.v_observatory.config.extra * G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
			end
			if G.GAME.used_vouchers.v_observatory then return {
				message = localize('k_nope_ex'),
			} end
		end,
	},
	meteor = {
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
		loc_def = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_meteor', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_meteor', set = 'Other'}
			end
			return { _c.config.strength, _c.config.weakness }
		end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			-- upgrade
			local chosen_hand = ÞeAutumnCircus.func.pseudorandom_unlocked_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
			-- downgrade
			chosen_hand = ÞeAutumnCircus.func.pseudorandom_unlocked_hand(chosen_hand)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			if G.GAME.hands[chosen_hand].level <= 1 then delay(1.5) else
				level_up_hand(used_tarot, chosen_hand, nil, -1 * (used_tarot.ability.consumeable.weakness or 1))
			end
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(self) return true end,
		set_badges = function(self, badges)
			badges[1].nodes[1].nodes[2].config.object:remove()
			badges[1] = create_badge("Meteor", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
		calculate = function(self, context)
			local hand_1 = ÞeAutumnCircus.func.pseudorandom_unlocked_hand(nil, 'meteor_observatory')
			local hand_2 = ÞeAutumnCircus.func.pseudorandom_unlocked_hand(nil, 'meteor_observatory')
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
		end,
	},
	satellite = {
		name = "Satellite",
		text = {
            "Creates up to {C:attention}2",
            "random {C:planet}Planet{} cards",
            "{C:inactive}(Must have room)"
        },
		effect = 'Round Bonus',
		config = {planets = 2},
		pos = { x = 2, y = 2 },
		loc_def = function(_c) return { _c.config.planets } end,
		use = function(self, area, copier)
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
		can_use = function(self) if #G.consumeables.cards < G.consumeables.config.card_limit or self.area == G.consumeables then return true end end,
		set_badges = function(self, badges)
			badges[1].nodes[1].nodes[2].config.object:remove()
			badges[1] = create_badge("Space Junk", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
	},
	moon = {
		name = "Moon",
		text = {
            "Creates #1# random",
            "{C:tarot}Tarot{}, {C:planet}Planet{}, or",
			"{C:spectral}Spectral{} card",
            "{C:inactive}(Must have room)"
        },
		effect = 'Random Round Bonus',
		config = {cards = 1},
		pos = { x = 3, y = 2 },
		loc_def = function(_c) return { _c.config.cards } end,
		use = function(self, area, copier)
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
		can_use = function(self) if #G.consumeables.cards < G.consumeables.config.card_limit or self.area == G.consumeables then return true end end,
		set_badges = function(self, badges)
			badges[1].nodes[1].nodes[2].config.object:remove()
			badges[1] = create_badge("Moon", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
		load_check = function()
			--if SMODS.INIT.SixSuit then return true end
			return true
		end
	},
	station = {
		name = "Space Station",
		text = {
			"Upgrades your most played",
			"poker hand by {C:attention}#1#{} level",
			"{C:inactive}Currently: {C:attention}#2#{}",
		},
		effect = 'Favorite Hand Upgrade',
		config = {strength = 1},
		pos = { x = 4, y = 2 },
		loc_def = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_station', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_station', set = 'Other'}
			end
			return { _c.config.strength, ÞeAutumnCircus.func.favorite_hand() }
		end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			local chosen_hand = ÞeAutumnCircus.func.favorite_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(self) return true end,
		set_badges = function(self, badges)
			badges[1].nodes[1].nodes[2].config.object:remove()
			badges[1] = create_badge("Space Junk", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
		calculate = function(self, context)
			if G.GAME.used_vouchers.v_observatory and context.scoring_name == ÞeAutumnCircus.func.favorite_hand() then
				local value = G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
			end
		end,
	},
	dysnomia = {
		name = "Dysnomia",
		text = {
			"{C:green}Shuffle{} your poker hands' levels",
			"{C:green}#1# in #2#{} chance to {C:green}randomly{}",
			"{C:attention}upgrade{} or {C:attention}downgrade{}",
			"each shuffled hand",
		},
		effect = 'The D8',
		config = { extra = 2 },
		pos = { x = 5, y = 2 },
		loc_def = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_dysnomia', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_dysnomia', set = 'Other'}
			end
			return { G.GAME.probabilities.normal, _c.config.extra }
		end,
		use = function(self, area, copier)
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
				if pseudorandom('dysnomia_check1') > G.GAME.probabilities.normal/self.ability.extra then
					if pseudorandom('dysnomia_check2') > 1/2 then
						G.GAME.hands[temp_hands[3][i]].level = math.max(1,G.GAME.hands[temp_hands[3][i]].level - 1)
					else
						G.GAME.hands[temp_hands[3][i]].level = G.GAME.hands[temp_hands[3][i]].level + 1
					end
				end
				level_up_hand(nil, temp_hands[3][i], true, 0)
			end
			
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                attention_text({
                    text = localize('k_mc_shuffle'),
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
		can_use = function(self) return true end,
		set_badges = function(self, badges)
			badges[1].nodes[1].nodes[2].config.object:remove()
			badges[1] = create_badge("wow this is useless", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			print("attempting badge surgery")
			badges[1].nodes[1].nodes[2].config.object:remove()
			badges[1].nodes[1].nodes = {
			{n=G.UIT.R, config={align = "cm"},
				nodes = {
					{n=G.UIT.R, config={align = "cm"},nodes={{n=G.UIT.O, config={object = DynaText({string = 'Moon', colours = {G.C.WHITE},float = true, shadow = true, offset_y = -0.05, silent = true, spacing = 1, scale = 0.33*1.2})}}}},
					{n=G.UIT.R, config={align = "cm"},nodes={{n=G.UIT.O, config={object = DynaText({string = 'of a dwarf planet', colours = {G.C.WHITE},float = true, shadow = true, offset_y = -0.05, silent = true, spacing = 1, scale = 0.33*0.7})}}}},
				}
			},
			}
			print("badge surgery successful")
			return badges
		end,
		calculate = function(self, context)
			if G.GAME.used_vouchers.v_observatory then
				local value = G.P_CENTERS.v_observatory.config.extra
                --[[return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }]]
			end
		end,
		load_check = function()
			-- Editioned planet code makes þis card screw up
			if SMODS.INIT.JeffDeluxeConsumablesPack then
				return false
			else
				return true
			end
		end,
	},
}

local planet_codex = {
	'comet',
	'meteor',
	'satellite',
	'moon',
	'station',
	'dysnomia',
}

local spectrals = {
	chance = {
		name = "Chance",
		text = {
			'{C:attention}COMPLETELY{} {C:green}randomizes{} each card',
			'in your hand, giving each of them a new',
			'{C:red}suit{}, {C:blue}rank{}, {C:attention}enhancement{}, {C:dark_edition}edition{}, and {C:purple}seal{}',
		},
		config = {
		},
		pos = { x = 0, y = 4 },
		loc_def = function(_c) return {  } end,
		use = function(self, area, copier)
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
			for i=1, #G.hand.cards do
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()	
					local card = G.hand.cards[i]
					
					-- Suit and Rank randomized
					card:set_base(pseudorandom_element(G.P_CARDS))
					
					-- Enhancement (~ 80% chance)
					if pseudorandom(pseudoseed('chancetime')) > 0.2 then
						card:set_ability(ÞeAutumnCircus.func.pseudorandom_enhancement())
					else
						card:set_ability(G.P_CENTERS['c_base'])
					end
					
					-- Edition (boosted rate dont ask me for numbers)
                    local edition_rate = 2
					card:set_edition(poll_edition('standard_edition'..G.GAME.round_resets.ante, edition_rate, true))
					
					-- Seal (~ 20% chance)
					local seal_rate = 10
					local seal_poll = pseudorandom(pseudoseed('stdseal'..G.GAME.round_resets.ante))
					if seal_poll > 1 - 0.02*seal_rate then
						local seal_type = pseudorandom(pseudoseed('stdsealtype'..G.GAME.round_resets.ante))
						
						local seal_list = {}
						for k, _ in pairs(G.P_SEALS) do
							local safe = true
							for __, v in ipairs(ÞeAutumnCircus.data.joker_stamps) do
								if k == v then safe = false end
							end
							if safe then
								table.insert(seal_list, k)
							end
						end
						
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
		can_use = function(self) if #G.hand.cards > 1 then return true end end,
	},
	offering = {
		name = "Offering",
		text = {
			"Destroys half of your",
			"{C:attention}full deck{} at random,",
			"gain {C:dark_edition}+#2#{} Joker Slot",
		},
		config = { remove_card = true, extra = {destroy = 2, slots = 1} },
		pos = { x = 1, y = 4 },
		loc_def = function(_c) return { _c.config.extra.destroy, _c.config.extra.slots } end,
		use = function(self, area, copier)
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
            delay(0.5)
			G.E_MANAGER:add_event(Event({func = function()
				if G.jokers then 
					G.jokers.config.card_limit = G.jokers.config.card_limit + self.ability.extra.slots
				end
				return true end }))
		end,
		can_use = function(self) if #G.playing_cards > 1 then return true end end,
	},
	scry = {
		name = "Scry",
		text = {
            "Creates up to {C:attention}2",
            "random {C:spectral}Spectral{} cards",
            "{C:inactive}(Must have room)"
		},
		config = { extra = {spectrals = 2} },
		pos = { x = 2, y = 4 },
		loc_def = function(_c) return { _c.config.extra.destroy, _c.config.extra.slots } end,
		use = function(self, area, copier)
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
		can_use = function(self) if #G.consumeables.cards < G.consumeables.config.card_limit or self.area == G.consumeables then return true end end,
	},
	phantom = {
		name = "Phantom",
		text = {
			"Creates a random {C:dark_edition}Negative{}",
			"and {C:attention}Perishable{} {C:attention}Joker{},",
			"then sets the {C:attention}sell value{}",
			"of {C:attention}all Jokers{} to {C:money}$0{}",
		},
		config = {extra = {jokers = 1}},
		pos = {x = 3, y = 4},
		loc_def = function(_c) return {} end,
		use = function(self, area, copier)
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
				G.jokers.cards[i].extra_cost = 0
				G.jokers.cards[i].cost = 0
				G.jokers.cards[i].sell_cost = 0
				G.jokers.cards[i].sell_cost_label = G.jokers.cards[i].facing == 'back' and '?' or G.jokers.cards[i].sell_cost
			end
		end,
		can_use = function(self) return true end,
		load_check = function()
			return G.VERSION ~= '1.0.0n-FULL'
		end,
	},
	mischief = {
		name = "Mischief",
		text = {
			"{C:attention}Destroys{} a random {C:attention}Joker{},",
			"then add a {C:green}random{} {C:purple}stamp{}",
			"to each other {C:attention}Joker{}"
		},
		config = { },
		pos = {x = 4, y = 4},
		loc_def = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = 'jimbo_seal', set = 'Other'}
			info_queue[#info_queue+1] = {key = 'todd_seal', set = 'Other'}
			info_queue[#info_queue+1] = {key = 'steven_seal', set = 'Other'}
			info_queue[#info_queue+1] = {key = 'chaos_seal', set = 'Other'}
			info_queue[#info_queue+1] = {key = 'andy_seal', set = 'Other'}
			return {}
		end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			-- destroy a random joker
			local deletable_jokers = {}
			for k, v in pairs(G.jokers.cards) do
				if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
			end
			local chosen_joker = nil
			if #deletable_jokers > 0 then
				chosen_joker = pseudorandom_element(deletable_jokers, pseudoseed('mischief_and_mayhem'))
				G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.75, func = function() chosen_joker:start_dissolve(nil); return true end }))
			end
			delay(0.6)
			-- add stamps to the rest
			for k, v in ipairs(G.jokers.cards) do
				if not chosen_joker or v ~= chosen_joker then
					G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function() v:set_seal(pseudorandom_element(ÞeAutumnCircus.data.joker_stamps, pseudoseed("mischiefs_reward")), false, true); return true end }))
				end
			end
			delay(0.5)
		end,
		can_use = function(self) 
			return #G.jokers.cards > 1
		end,
		load_check = function()
			return ÞeAutumnCircus.config.enabled_modules.jokerstamps
		end,
	},
	comedy = {
		name = "Comedy",
		text = {
			"Add {C:blue}Todd's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "Todd" },
		pos = {x = 5, y = 4},
		loc_def = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = 'todd_seal', set = 'Other'}
			return {}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return ÞeAutumnCircus.config.enabled_modules.jokerstamps and ÞeAutumnCircus.config.enabled_seals.todd
		end,
	},
	tragedy = {
		name = "Tragedy",
		text = {
			"Add {C:red}Steven's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "Steven" },
		pos = {x = 6, y = 4},
		loc_def = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = 'steven_seal', set = 'Other'}
			return {}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return ÞeAutumnCircus.config.enabled_modules.jokerstamps and ÞeAutumnCircus.config.enabled_seals.steven
		end,
	},
	whimsy = {
		name = "Whimsy",
		text = {
			"Add {C:attention}Jimbo's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "Jimbo" },
		pos = {x = 7, y = 4},
		loc_def = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = 'jimbo_seal', set = 'Other'}
			return {}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return ÞeAutumnCircus.config.enabled_modules.jokerstamps and ÞeAutumnCircus.config.enabled_seals.jimbo
		end,
	},
	entropy = {
		name = "Entropy",
		text = {
			"Add {C:green}Chaos' Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "Chaos" },
		pos = {x = 8, y = 4},
		loc_def = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = 'chaos_seal', set = 'Other'}
			return {}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return ÞeAutumnCircus.config.enabled_modules.jokerstamps and ÞeAutumnCircus.config.enabled_seals.chaos
		end,
	},
	wonder = {
		name = "Wonder",
		text = {
			"Add {C:purple}Andy's Stamp{}",
			"to a random {C:attention}Joker{}"
		},
		config = { extra = "Andy" },
		pos = {x = 9, y = 4},
		loc_def = function(_c, info_queue)
			info_queue[#info_queue+1] = {key = 'andy_seal', set = 'Other'}
			return {}
		end,
		use = stampcarduse,
		can_use = stampcardcanuse,
		update = stampcardupdate,
		load_check = function()
			return ÞeAutumnCircus.config.enabled_modules.jokerstamps and ÞeAutumnCircus.config.enabled_seals.andy
		end,
	},
}

local spectral_codex = {
	'chance',
	'offering',
	'scry',
	'phantom',
	'mischief',
	'whimsy',
	'comedy',
	'tragedy',
	'entropy',
	'wonder',
}

local function setup_localization()
	G.localization.descriptions.Other["mc_obs_off_comet"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Chooses a hand at random,",
			"{C:inactive,s:0.8}then gives {X:mult,C:white,s:0.8} X2.25 {C:inactive,s:0.8} Mult if the",
			"{C:inactive,s:0.8}played hand is that hand"
        }
    }
	G.localization.descriptions.Other["mc_obs_on_comet"] = {
        name = "Observatory Effect",
        text = {
            "Chooses a hand at random,",
			"then gives {X:mult,C:white} X2.25 {} Mult if the",
			"played hand is that hand"
        }
    }
	
	G.localization.descriptions.Other["mc_obs_off_meteor"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Chooses two hands at random,",
			"{C:inactive,s:0.8}then gives {X:mult,C:white,s:0.8} X3.375 {C:inactive,s:0.8} Mult if the",
			"{C:inactive,s:0.8}played hand is the first hand,",
			"{C:inactive,s:0.8}or gives {X:mult,C:white,s:0.8} X0.66 {C:inactive,s:0.8} Mult if the",
			"{C:inactive,s:0.8}played hand is the second hand"
        }
    }
	G.localization.descriptions.Other["mc_obs_on_meteor"] = {
        name = "Observatory Effect",
        text = {
            "Chooses two hands at random,",
			"then gives {X:mult,C:white} X3.375 {} Mult if the",
			"played hand is the first hand,",
			"or gives {X:mult,C:white} X0.66 {} Mult if the",
			"played hand is the second hand"
        }
    }
	
	G.localization.descriptions.Other["mc_obs_off_station"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Gives {X:mult,C:white,s:0.8} X1.5 {C:inactive,s:0.8} Mult if the played",
			"{C:inactive,s:0.8}hand is most played hand",
        }
    }
	G.localization.descriptions.Other["mc_obs_on_station"] = {
        name = "Observatory Effect",
        text = {
            "Gives {X:mult,C:white} X1.5 {} Mult if the played",
			"hand is most played hand",
        }
    }
	
	G.localization.descriptions.Other["mc_obs_off_dysnomia"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Nothing actually...",
        }
    }
	G.localization.descriptions.Other["mc_obs_on_dysnomia"] = {
        name = "Observatory Effect",
        text = {
            "Nothing actually...",
        }
    }
	
	G.localization.misc.dictionary["k_mc_shuffle"] = "Shuffled!"
end

function ÞeAutumnCircus.INIT.MoreConsumables()
	
	setup_localization()
	
	SMODS.Sprite:new("Þac_MoreConsumables", ÞeAutumnCircus.mod.path, "MoreConsumables.png", 71, 95, "asset_atli"):register();
	
	--tarots
	for _, k in ipairs(tarot_codex) do
		local v = tarots[k]
		ÞeAutumnCircus.data.buffer_insert("Tarots", v, {key = k, atlas = "Þac_MoreConsumables"})
	end
	
	--planets
	for _, k in ipairs(planet_codex) do
		local v = planets[k]
		ÞeAutumnCircus.data.buffer_insert("Planets", v, {key = k, atlas = "Þac_MoreConsumables"})
	end
	
	--spectrals
	for _, k in ipairs(spectral_codex) do
		local v = spectrals[k]
		ÞeAutumnCircus.data.buffer_insert("Spectrals", v, {key = k, atlas = "Þac_MoreConsumables"})
	end

end
