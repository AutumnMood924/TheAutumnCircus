

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
	'joker', joker = {
		effect = 'NOTHING',
		config = {
			mult = 4
		},
		pos = { x = 0, y = 1 },
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
			if G.GAME.used_vouchers.v_observatory then
				info_queue[#info_queue+1] = {key = 'mc_obs_on_dysnomia', set = 'Other'}
			else
				info_queue[#info_queue+1] = {key = 'mc_obs_off_dysnomia', set = 'Other'}
			end
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