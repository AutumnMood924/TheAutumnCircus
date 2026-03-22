

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
	'shooting_star', shooting_star = {
		effect = 'Suit Level Upgrade',
		config = {level_suit = "six_Stars"},
		pos = { x = 4, y = 3 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
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
				badges[1] = create_badge("Star?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		load_check = function()
			return next(SMODS.find_mod('SixSuits'))
		end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.level_suit, true) then return true end
            end
        end,
	},
	'chill_moon', chill_moon = {
		effect = 'Suit Level Upgrade',
		config = {level_suit = "six_Moons"},
		pos = { x = 5, y = 3 },
		loc_vars = function(_c,info_queue,card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
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
				badges[1] = create_badge("Moon?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
		load_check = function()
			return next(SMODS.find_mod('SixSuits'))
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

local colours = {
	"placeholder_grey", placeholder_grey = {
		config = {
			extra = {
			},
			val = 0,
			partial_rounds = 0,
			upgrade_rounds = 3,
		},
		cost = 4,
		pos = { x = 1, y = 6 },
		loc_vars = function(self, info_queue, card)
			local val, max = progressbar(card.ability.partial_rounds, card.ability.upgrade_rounds)
			info_queue[#info_queue+1] = G.P_CENTERS.j_thac_placeholder_joker
			return { vars = {card.ability.val, val, max, card.ability.upgrade_rounds} }
		end,
		use = function(self, card, area, copier)
			for i = 1, card.ability.val do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local _card = SMODS.create_card{
						set = "Joker",
						key = "j_thac_placeholder_joker",
						edition = {negative = true},
					}
					_card:add_to_deck()
					G.jokers:emplace(_card)
					card:juice_up(0.3, 0.5)
				return true end }))
			end
			delay(0.4)
		end,
		can_use = function(self, card)
			return true
		end,
		dependencies = { "MoreFluff" },
	},
}

local mftarots = {
	"rot_joker", rot_joker = {
		config = {
			extra = {
			},
		},
		pos = {x = 0, y = 1},
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.c_thac_joker
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = SMODS.create_card{
							key = "c_thac_joker",
							area = G.consumeables,
						}
						card:add_to_deck()
						G.consumeables:emplace(card)
						used_tarot:juice_up(0.3, 0.5)
					end
					return true end }))
			end
			delay(0.6)
		end,
		can_use = function(self, card)
			return #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables
		end,
		dependencies = { "MoreFluff" },
	},
	"rotflip_star", rotflip_star = {
		config = {
			extra = {
				targets = 3
			},
		},
		pos = {x = 0, y = 2},
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.extra.targets} }
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local target_area = G.hand
			if G.STATE == G.STATES.BLIND_SELECT or G.STATE == G.STATES.SHOP or G.STATE == G.STATES.ROUND_EVAL then
			  target_area = G.deck
			end
			G.E_MANAGER:add_event(Event({
			  trigger = 'after',
			  delay = 0.7,
			  func = function() 
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				local cards = {}
				for i=1, card.ability.extra.targets do
				  cards[i] = true
				  local _rank = pseudorandom_element({'A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K'}, pseudoseed('suitarot'))
				  local cen_pool = {}
				  for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
					if v.key ~= 'm_stone' and not v.overrides_base_rank then 
					  cen_pool[#cen_pool+1] = v
					end
				  end
				  create_playing_card({front = G.P_CARDS['six_STAR_'.._rank], center = pseudorandom_element(cen_pool, pseudoseed('suitarot'))}, target_area, nil, i ~= 1, {G.C.SECONDARY_SET.Rotarot})
				end
				playing_card_joker_effects(cards)
				return true end }))
		end,
		can_use = function(self, card)
			return G.hand and #G.hand.cards > 0
		end,
		dependencies = { "MoreFluff", "SixSuits" },
	},
	"rotflip_moon", rotflip_moon = {
		config = {
			extra = {
				targets = 3
			},
		},
		pos = {x = 1, y = 2},
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.extra.targets} }
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			local target_area = G.hand
			if G.STATE == G.STATES.BLIND_SELECT or G.STATE == G.STATES.SHOP or G.STATE == G.STATES.ROUND_EVAL then
			  target_area = G.deck
			end
			G.E_MANAGER:add_event(Event({
			  trigger = 'after',
			  delay = 0.7,
			  func = function() 
				play_sound('tarot1')
				used_tarot:juice_up(0.3, 0.5)
				local cards = {}
				for i=1, card.ability.extra.targets do
				  cards[i] = true
				  local _rank = pseudorandom_element({'A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K'}, pseudoseed('suitarot'))
				  local cen_pool = {}
				  for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
					if v.key ~= 'm_stone' and not v.overrides_base_rank then 
					  cen_pool[#cen_pool+1] = v
					end
				  end
				  create_playing_card({front = G.P_CARDS['six_MOON_'.._rank], center = pseudorandom_element(cen_pool, pseudoseed('suitarot'))}, target_area, nil, i ~= 1, {G.C.SECONDARY_SET.Rotarot})
				end
				playing_card_joker_effects(cards)
				return true end }))
		end,
		can_use = function(self, card)
			return G.hand and #G.hand.cards > 0
		end,
		dependencies = { "MoreFluff", "SixSuits" },
	},
}

local colours = {
	"placeholder_grey", placeholder_grey = {
		config = {
			extra = {
			},
			val = 0,
			partial_rounds = 0,
			upgrade_rounds = 3,
		},
		cost = 4,
		pos = { x = 1, y = 6 },
		loc_vars = function(self, info_queue, card)
			local val, max = progressbar(card.ability.partial_rounds, card.ability.upgrade_rounds)
			info_queue[#info_queue+1] = G.P_CENTERS.j_thac_placeholder_joker
			return { vars = {card.ability.val, val, max, card.ability.upgrade_rounds} }
		end,
		use = function(self, card, area, copier)
			for i = 1, card.ability.val do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local _card = SMODS.create_card{
						set = "Joker",
						key = "j_thac_placeholder_joker",
						edition = {negative = true},
					}
					_card:add_to_deck()
					G.jokers:emplace(_card)
					card:juice_up(0.3, 0.5)
				return true end }))
			end
			delay(0.4)
		end,
		can_use = function(self, card)
			return true
		end,
		dependencies = { "MoreFluff" },
	},
}

local bakery = {
	"odd_bread", odd_bread = {
		config = {
			extra = {
				amount = 1,
				remaining = 3,
			},
		},
		cost = 4,
		pos = { x = 3, y = 6 },
		soul_pos = { x = 4, y = 6 },
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.p_amm_oddity_normal_1
			return SMODS.Bakery.loc_vars(self, info_queue, card)
		end,
		calculate = function(self, card, context)
			if context.starting_shop then
				for i = 1, card.ability.extra.amount do
					G.E_MANAGER:add_event(Event{
						func = function()
						local _booster = SMODS.add_booster_to_shop('p_amm_oddity_normal_'..(math.random(1,4)))
						_booster.cost = 0
						return true
					end})
					card_eval_status_text(card, 'extra', nil, nil, nil, {
						message = localize('k_plus_pack'),
						colour = G.C.SECONDARY_SET.Oddity,
					})
				end
				SDM_0s_Stuff_Funcs.decrease_remaining_food(card)
			end
		end,
		dependencies = { "sdm0sstuff" },
	},
}

local umbrals = {
	"exosphere", exosphere = {
		config = {
			extra = {
				balance = 0.2,
			},
		},
		cost = 4,
		pos = { x = 5, y = 5 },
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.balance * 100
				}
			}
		end,
		use = function(self, card, area, copier)
			card:juice_up(0.3, 0.5)
			for k,v in ipairs(G.hand.cards) do
				if v:is_suit("six_Stars") then
					v.ability.perma_balance = v.ability.perma_balance or 0
					v.ability.perma_balance = v.ability.perma_balance + card.ability.extra.balance
					card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.PURPLE, instant = true})
				end
			end
		end,
		can_use = function(self, card)
			return true
		end,
		dependencies = { "aikoyorisshenanigans", "SixSuits", "pta_saka" },
	},
	"vacuum", vacuum = {
		config = {
			extra = {
				retriggers = 1,
				numer = 1,
				denom = 4,
			},
		},
		cost = 4,
		pos = { x = 6, y = 5 },
		loc_vars = function(self, info_queue, card)
			local probvars = {SMODS.get_probability_vars(card, card.ability.extra.numer, card.ability.extra.denom)}
			return {
				vars = {
					probvars[1],
					probvars[2],
					card.ability.extra.retriggers,
					card.ability.extra.retriggers == 1 and "" or "s",
				}
			}
		end,
		use = function(self, card, area, copier)
			card:juice_up(0.3, 0.5)
			if SMODS.pseudorandom_probability(card, "c_thac_vacuum", card.ability.extra.numer, card.ability.extra.denom) then
				for k,v in ipairs(G.hand.cards) do
					if v:is_suit("six_Moons") then
						v.ability.perma_repetitions = v.ability.perma_repetitions or 0
						v.ability.perma_repetitions = v.ability.perma_repetitions + card.ability.extra.retriggers
						card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), instant = true})
					end
				end
			else
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.PURPLE})
			end
		end,
		can_use = function(self, card)
			return true
		end,
		dependencies = { "aikoyorisshenanigans", "SixSuits" },
	},
	"friend", friend = {
		config = {
			extra = {
				xchips = 0.13
			},
		},
		cost = 4,
		pos = { x = 7, y = 5 },
		soul_pos = { x = 8, y = 5, draw=function (card, scale_mod, rotate_mod)
			if card.children.floating_sprite then
				--rotate_mod = -G.TIMERS.REAL * 0.333\
				local xm = (math.cos(G.TIMERS.REAL) / 15)
				local ym = (math.sin(G.TIMERS.REAL) / 25)
				scale_mod = math.min(math.max((math.tan(G.TIMERS.REAL) / 5), 0), 0.5)
				card.children.floating_sprite:draw_shader('dissolve', 0, nil,nil,card.children.center,scale_mod, rotate_mod,xm,ym+0.2,nil, 1)
				card.children.floating_sprite:draw_shader('dissolve', nil, nil,nil,card.children.center,scale_mod, rotate_mod,xm,ym,nil, 1)
			end
		end },
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
			return {
				vars = {
					card.ability.extra.xchips
				}
			}
		end,
		use = function(self, card, area, copier)
			for k,v in ipairs(G.graveyard) do
				v.ability.perma_x_chips = v.ability.perma_x_chips + card.ability.extra.xchips
			end
			card:juice_up(0.3, 0.5)
			card_eval_status_text(G.deck.cards[1] or card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS, instant = true})
		end,
		can_use = function(self, card)
			return true
		end,
		dependencies = { "aikoyorisshenanigans" },
		in_pool = function(self)
			return AMM.api.graveyard.count_cards() > 0
		end,
	},
}
SMODS.Atlas{
	key = "MoreConsumables",
	path = "MoreConsumables.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "Rotatema",
	path = "Rotatema.png",
	px = 107,
	py = 107,
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

local morefluff = SMODS.find_mod("MoreFluff")[1]
local sdms = SMODS.find_mod("sdm0sstuff")[1]
local aikoyori = SMODS.find_mod("aikoyorisshenanigans")[1]

--colours
if morefluff and morefluff.config["Colour Cards"] then
	for _, k in ipairs(colours) do
		local v = colours[k]
		TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Colour", key = k, atlas = "MoreConsumables", pixel_size = { w = 71, h = 87 }, display_size = { w = 71, h = 87 }})
	end
end
--45degreetarots
if morefluff and morefluff.config["45 Degree Rotated Tarot Cards"] then
	for _, k in ipairs(mftarots) do
		local v = mftarots[k]
		TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Rotarot", key = k, atlas = "Rotatema", display_size = { w = 106, h = 106 }})
	end
end

--bakery
if sdms and sdms.config["sdm_bakery"] then
	for _, k in ipairs(bakery) do
		local v = bakery[k]
		TheAutumnCircus.data.buffer_insert("Bakery", v, {key = k, atlas = "MoreConsumables"})
	end
end

--umbral
if aikoyori then
	for _, k in ipairs(umbrals) do
		local v = umbrals[k]
		TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Umbral", key = k, atlas = "MoreConsumables"})
	end
end