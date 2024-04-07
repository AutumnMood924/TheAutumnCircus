--- STEAMODDED HEADER
--- MOD_NAME: MoreConsumables
--- MOD_ID: MoreConsumables
--- MOD_AUTHOR: [AutumnMood]
--- MOD_DESCRIPTION: More Consumables, Bad Art
--- BADGE_COLOUR: 898945
--- DISPLAY_NAME: MoreConsumables

----------------------------------------------
------------MOD CODE -------------------------

-- Art for basically everything done by Lyman

-- note this returns the string name of the hand, not the hand 'object'
-- effectively just 'skips over' locked hands
local function pseudorandom_unlocked_hand(ignore, seed)
	local chosen_hand
	ignore = ignore or {}
	seed = seed or 'comet_planet'
	if type(ignore) ~= 'table' then ignore = {ignore} end
	while true do
		chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
		if G.GAME.hands[chosen_hand].visible then
			local safe = true
			for _, v in pairs(ignore) do
				if v == chosen_hand then safe = false end
			end
			if safe then break end
		end
	end
	return chosen_hand
end

-- again, returns the string name of the hand
-- this handles ties the same way that Telescope does, which is to say it doesn't.
local function favorite_hand()
	local chosen_hand = 'High Card'
	local highest_played = 0
	for _, v in ipairs(G.handlist) do
		if G.GAME.hands[v].played > highest_played then
			chosen_hand = v
			highest_played = G.GAME.hands[v].played
		end
	end
	return chosen_hand
end

local function pseudorandom_enhancement()
	local ret = pseudorandom_element(G.P_CENTER_POOLS['Enhanced'], pseudoseed('universe_tarot'))
	return ret
end

-- Hook into this to roll editions for Joker (tarot)
local alias__create_card = create_card;
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local area = area or G.jokers
    local center = G.P_CENTERS.b_red
	
	local card = alias__create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	
	if _type == 'Tarot' and forced_key == 'c_joker_tarot' then
        local edition = poll_edition('edi'..(key_append or '')..G.GAME.round_resets.ante)
        card:set_edition(edition)
        check_for_unlock({type = 'have_edition'})
	end
	
	return card
end

--[[ overriden for testing
local alias__Game_start_run = Game.start_run;
function Game:start_run(args)
	local ret = alias__Game_start_run(self, args)
	if not args.savetext then
		local testing_cards = {
			{'Spectral', 'c_mc_chance'},
			{'Spectral', 'c_mc_chance'},
			{'Tarot', 'c_mc_artist'},
		}
		for i=1, #testing_cards do
			local targetarea = G.consumeables
			
			local card = create_card(testing_cards[i][1], targetarea, nil, nil, nil, nil, testing_cards[i][2], 'deck')
			card:add_to_deck()
			targetarea:emplace(card)
		end
		
		G.GAME.used_vouchers['v_observatory'] = true
	end
	return ret
end]]

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
		pos = { x = 0, y = 1 },
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
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(pseudorandom_enhancement());return true end }))
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
		pos = { x = 1, y = 1 },
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
		pos = { x = 2, y = 1 },
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
		end,
		can_use = function(self) return #G.hand.highlighted == 1 and G.hand.highlighted[1].ability.set == "Default" end
	},
	artist = {
		name = "The Artist",
		text = {
			'Select {C:attention}#1#{} card,',
			'apply its {C:attention}enhancement{}, {C:edition}edition{},',
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
		pos = { x = 3, y = 1 },
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
		pos = { x = 0, y = 2 },
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
		pos = { x = 0, y = 3 },
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
			local chosen_hand = pseudorandom_unlocked_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(self) return true end,
		set_badges = function(self, badges)
			badges[1] = create_badge("Comet", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
		calculate = function(self, context)
			if G.GAME.used_vouchers.v_observatory and context.scoring_name == pseudorandom_unlocked_hand(nil, 'comet_observatory') then
				local value = G.P_CENTERS.v_observatory.config.extra * G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
			end
			return {
				message = localize('k_nope_ex'),
			}
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
		pos = { x = 1, y = 3 },
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
		local chosen_hand = pseudorandom_unlocked_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
			-- downgrade
			chosen_hand = pseudorandom_unlocked_hand(chosen_hand)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			if G.GAME.hands[chosen_hand].level <= 1 then delay(1.5) else
				level_up_hand(used_tarot, chosen_hand, nil, -1 * (used_tarot.ability.consumeable.weakness or 1))
			end
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(self) return true end,
		set_badges = function(self, badges)
			badges[1] = create_badge("Meteor", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
		calculate = function(self, context)
			local hand_1 = pseudorandom_unlocked_hand(nil, 'meteor_observatory')
			local hand_2 = pseudorandom_unlocked_hand(nil, 'meteor_observatory')
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
			return {
				message = localize('k_nope_ex'),
			}
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
		pos = { x = 2, y = 3 },
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
		pos = { x = 3, y = 3 },
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
			badges[1] = create_badge("Moon", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
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
		pos = { x = 4, y = 3 },
		loc_def = function(_c, info_queue)
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_station', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_station', set = 'Other'}
			end
			return { _c.config.strength, favorite_hand() }
		end,
		use = function(self, area, copier)
			local used_tarot = copier or self
			local chosen_hand = favorite_hand()
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
			level_up_hand(used_tarot, chosen_hand, nil, used_tarot.ability.consumeable.strength)
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
		end,
		can_use = function(self) return true end,
		set_badges = function(self, badges)
			badges[1] = create_badge("Space Junk", get_type_colour(self.config.center or self.config, self), nil, 1.2)
			return badges
		end,
		calculate = function(self, context)
			if G.GAME.used_vouchers.v_observatory and context.scoring_name == favorite_hand() then
				local value = G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
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
}

local spectrals = {
	chance = {
		name = "Chance",
		text = {
			'{C:attention}COMPLETELY{} {C:green}randomizes{} each card',
			'in your hand, giving each of them a new',
			'{C:red}suit{}, {C:blue}rank{}, {C:attention}enhancement{}, {C:edition}edition{}, and {C:purple}seal{}',
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
						card:set_ability(pseudorandom_enhancement())
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
							table.insert(seal_list, k)
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
}

local spectral_codex = {
	'chance',
	'offering',
	'scry',
}

local function setup_localization()
	G.localization.descriptions.Other["mc_obs_off_comet"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
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
	
	init_localization()
end

function SMODS.INIT.MoreConsumables()
	local mod_id = 'MoreConsumables'
	local this_mod = SMODS.findModByID(mod_id)
	local mod_prefix = 'mc_'
	
	setup_localization()
	
	SMODS.Sprite:new("MoreConsumables", this_mod.path, "MoreConsumables.png", 71, 95, "asset_atli"):register();
	
	--tarots
	for _, k in ipairs(tarot_codex) do
		local v = tarots[k]
		local card = SMODS.Tarot:new(v.name, mod_prefix..k, v.config, v.pos, { name = v.name, text = v.text }, 3, 1.0, v.effect, true, true, "MoreConsumables")
		card:register()
		if v.loc_def then SMODS.Tarots["c_"..mod_prefix..k].loc_def = v.loc_def end
		if v.use then SMODS.Tarots["c_"..mod_prefix..k].use = v.use end
		if v.can_use then SMODS.Tarots["c_"..mod_prefix..k].can_use = v.can_use end
		if v.set_badges then SMODS.Tarots["c_"..mod_prefix..k].set_badges = v.set_badges end
		if v.calculate then SMODS.Tarots["c_"..mod_prefix..k].calculate = v.calculate end
	end
	
	--planets
	for _, k in ipairs(planet_codex) do
		local v = planets[k]
		local card = SMODS.Planet:new(v.name, mod_prefix..k, v.config, v.pos, { name = v.name, text = v.text }, 3, 1.0, v.effect, 1, true, true, "MoreConsumables")
		card:register()
		if v.loc_def then SMODS.Planets["c_"..mod_prefix..k].loc_def = v.loc_def end
		if v.use then SMODS.Planets["c_"..mod_prefix..k].use = v.use end
		if v.can_use then SMODS.Planets["c_"..mod_prefix..k].can_use = v.can_use end
		if v.set_badges then SMODS.Planets["c_"..mod_prefix..k].set_badges = v.set_badges end
		if v.calculate then SMODS.Planets["c_"..mod_prefix..k].calculate = v.calculate end
	end
	
	--spectrals
	for _, k in ipairs(spectral_codex) do
		local v = spectrals[k]
		local card = SMODS.Spectral:new(v.name, mod_prefix..k, v.config, v.pos, { name = v.name, text = v.text }, 4, true, true, "MoreConsumables")
		card:register()
		if v.loc_def then SMODS.Spectrals["c_"..mod_prefix..k].loc_def = v.loc_def end
		if v.use then SMODS.Spectrals["c_"..mod_prefix..k].use = v.use end
		if v.can_use then SMODS.Spectrals["c_"..mod_prefix..k].can_use = v.can_use end
		if v.set_badges then SMODS.Spectrals["c_"..mod_prefix..k].set_badges = v.set_badges end
		if v.calculate then SMODS.Spectrals["c_"..mod_prefix..k].calculate = v.calculate end
	end
	
	init_localization()
end

----------------------------------------------
------------MOD CODE END----------------------