
local zodiaccards = {
	'cancer_two', cancer_two = {
		name = "Cancer II",
        pos = { x = 0, y = 0 },
		config = {
			extra = {
                zodiac = "zodiac_thac_cancer_two",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.nice == false
		end,
	},
	'jacks_belt', jacks_belt = {
		name = "Jack's Belt",
        pos = { x = 1, y = 0 },
		config = {
			extra = {
                zodiac = "zodiac_thac_jacks_belt",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.blaze == false
		end,
	},
	'double_cancer_two', double_cancer_two = {
		name = "Double Cancer II",
        pos = { x = 2, y = 0 },
		config = {
			extra = {
                zodiac = "zodiac_thac_double_cancer_two",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.twice_nice == false
		end,
	},
	'bowling_pin', bowling_pin = {
		name = "Bowling Pin?",
        pos = { x = 3, y = 0 },
		config = {
			extra = {
                zodiac = "zodiac_thac_bowling_pin",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.skeet == false
		end,
	},
	'pupper', pupper = {
		name = "Pupper!",
        pos = { x = 4, y = 0 },
		config = {
			extra = {
                zodiac = "zodiac_thac_pupper",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.little_dog == false
		end,
	},
	'doggo', doggo = {
		name = "Doggo!",
        pos = { x = 5, y = 0 },
		config = {
			extra = {
                zodiac = "zodiac_thac_doggo",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.big_dog == false
		end,
	},
	'kitteh', kitteh = {
		name = "Kitteh!",
        pos = { x = 0, y = 1 },
		config = {
			extra = {
                zodiac = "zodiac_thac_kitteh",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.little_cat == false
		end,
	},
	'catto', catto = {
		name = "Catto!",
        pos = { x = 1, y = 1 },
		config = {
			extra = {
                zodiac = "zodiac_thac_catto",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.big_cat == false
		end,
	},
	'castle_zodiac', castle_zodiac = {
		name = "Castle Zodiac",
        pos = { x = 2, y = 1 },
		config = {
			extra = {
                zodiac = "zodiac_thac_castle_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.castle == false
		end,
	},
	'blaze_house_zodiac', blaze_house_zodiac = {
		name = "Blaze House Zodiac",
        pos = { x = 3, y = 1 },
		config = {
			extra = {
                zodiac = "zodiac_thac_blaze_house_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.blaze_house == false
		end,
	},
	'flushblaze_zodiac', flushblaze_zodiac = {
		name = "Flushblaze Zodiac",
        pos = { x = 4, y = 1 },
		config = {
			extra = {
                zodiac = "zodiac_thac_flushblaze_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.flushblaze == false
		end,
	},
	'spectrumblaze_zodiac', spectrumblaze_zodiac = {
		name = "Spectrumblaze Zodiac",
        pos = { x = 5, y = 1 },
		config = {
			extra = {
                zodiac = "zodiac_thac_spectrumblaze_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.spectrumblaze == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
	},
	'castle_flush_zodiac', castle_flush_zodiac = {
		name = "Castle Flush Zodiac",
        pos = { x = 0, y = 2 },
		config = {
			extra = {
                zodiac = "zodiac_thac_castle_flush_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.castle_flush == false
		end,
	},
	'castle_spectrum_zodiac', castle_spectrum_zodiac = {
		name = "Castle Spectrum Zodiac",
        pos = { x = 1, y = 2 },
		config = {
			extra = {
                zodiac = "zodiac_thac_castle_spectrum_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.castle_spectrum == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
	},
	'skeet_flush_zodiac', skeet_flush_zodiac = {
		name = "Skeet Flush Zodiac",
        pos = { x = 2, y = 2 },
		config = {
			extra = {
                zodiac = "zodiac_thac_skeet_flush_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.skeet_flush == false
		end,
	},
	'skeet_spectrum_zodiac', skeet_spectrum_zodiac = {
		name = "Skeet Spectrum Zodiac",
        pos = { x = 3, y = 2 },
		config = {
			extra = {
                zodiac = "zodiac_thac_skeet_spectrum_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.skeet_spectrum == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
	},
	'blaze_five_zodiac', blaze_five_zodiac = {
		name = "Blaze Five Zodiac",
        pos = { x = 4, y = 2 },
		config = {
			extra = {
                zodiac = "zodiac_thac_blaze_five_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.blaze_five == false
		end,
	},
	'flushblaze_house_zodiac', flushblaze_house_zodiac = {
		name = "Flushblaze House Zodiac",
        pos = { x = 5, y = 2 },
		config = {
			extra = {
                zodiac = "zodiac_thac_flushblaze_house_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.flushblaze_house == false
		end,
	},
	'spectrumblaze_house_zodiac', spectrumblaze_house_zodiac = {
		name = "Spectrumblaze House Zodiac",
        pos = { x = 0, y = 3 },
		config = {
			extra = {
                zodiac = "zodiac_thac_spectrumblaze_house_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.spectrumblaze_house == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
	},
	'flushblaze_five_zodiac', flushblaze_five_zodiac = {
		name = "Flushblaze Five Zodiac",
        pos = { x = 2, y = 3 },
		config = {
			extra = {
                zodiac = "zodiac_thac_flushblaze_five_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.flushblaze_five == false
		end,
	},
	'spectrumblaze_five_zodiac', spectrumblaze_five_zodiac = {
		name = "Spectrumblaze Five Zodiac",
        pos = { x = 3, y = 3 },
		config = {
			extra = {
                zodiac = "zodiac_thac_spectrumblaze_five_zodiac",
            }
		},
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.spectrumblaze_five == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
	},
}

local zodiacs = {
    'cancer_two', cancer_two = {
        name = "Cancer II",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create {C:attention}#3#{C:Zodiac} Zodiac{} cards",
            "{C:inactive}(Must have room){}",
        },
        pos = { x = 0, y = 0 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_nice',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i = 1, math.min(zodiac.config.extra.amount, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        local card = create_card("Zodiac", G.consumeables, nil, nil, nil, nil, nil, 'cancer_two')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        card:juice_up(0.3, 0.5)
                    end
                    return true end }))
            end
            delay(0.6)
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.nice == false
		end,
    },
    'jacks_belt', jacks_belt = {
        name = "Jack's Belt",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Turn all cards in hand",
            "into a {C:green}random{} rank",
            "among scored cards",
        },
        pos = { x = 1, y = 0 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_blaze',
            },
        },
        colour = HEX('999999'),
        pre_trigger = function(self, zodiac, context)
            local RANKS = {}
            for e,i in ipairs(context.scoring_hand) do
                if not SMODS.has_no_rank(i) then RANKS[#RANKS+1] = i.base.value end
            end
            local rank = pseudorandom_element(RANKS, pseudoseed("jacks_belt"))
            for k,v in ipairs(G.hand.cards) do
                assert(SMODS.change_base(v, nil, rank))
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.blaze == false
		end,
    },
    'double_cancer_two', double_cancer_two = {
        name = "Double Cancer II",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            'Turn {C:attention}all{} unscored cards',
            'into {C:attention}Jewel Cards'
        },
        pos = { x = 2, y = 0 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_twice_nice',
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_jewel'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for _, card in pairs(context.full_hand) do
                if table.contains(context.scoring_hand, card)then
                    -- do nothing
                else
                    card.add_to_scoring = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                zodiac:juice_up()
                                card:juice_up()
                                card.config.center.replace_base_card = true                
                                card.becoming_no_rank = nil
                                return true
                            end
                        }))
                        card:set_ability(G.P_CENTERS["m_thac_jewel"], nil, true)
                        card.becoming_no_rank = true
                        card.config.center.replace_base_card = nil
                    end
                end
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.twice_nice == false
		end,
    },
    'bowling_pin', bowling_pin = {
        name = "Bowling Pin?",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            'Turn #3# {C:attention}left-most{} cards in',
            'hand into {C:attention}Star cards'
        },
        pos = { x = 3, y = 0 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_skeet',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_star'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
                if G.hand.cards[i] then
                    G.hand.cards[i]:set_ability(G.P_CENTERS['m_thac_star'], nil, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before', delay = 0.2, func = function()
                            zodiac:juice_up()
                            G.hand.cards[i]:juice_up()
                            return true
                        end}))
                end
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.skeet == false
		end,
    },
    'pupper', pupper = {
        name = "Pupper!",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            'Turn #3# {C:attention}left-most{} cards in',
            'hand into {C:attention}Bone cards'
        },
        pos = { x = 4, y = 0 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_little_dog',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_bone'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
                if G.hand.cards[i] then
                    G.hand.cards[i]:set_ability(G.P_CENTERS['m_thac_bone'], nil, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before', delay = 0.2, func = function()
                            zodiac:juice_up()
                            G.hand.cards[i]:juice_up()
                            return true
                        end}))
                end
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.little_dog == false
		end,
    },
    'doggo', doggo = {
        name = "Doggo!",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
			"Creates {C:attention}#3# Bone Cards{} and puts",
            "them in your {C:attention}graveyard{}"
        },
        pos = { x = 5, y = 0 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_big_dog',
                amount = 3,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_bone'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_thac_bone}, G.deck)
				cardmak:move_to_graveyard()
			end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.big_dog == false
		end,
    },
    'kitteh', kitteh = {
        name = "Kitteh!",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            'Turn #3# {C:attention}left-most{} cards in',
            'hand into {C:attention}Soulbound cards'
        },
        pos = { x = 0, y = 1 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_little_cat',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_soulbound'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
                if G.hand.cards[i] then
                    G.hand.cards[i]:set_ability(G.P_CENTERS['m_thac_soulbound'], nil, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before', delay = 0.2, func = function()
                            zodiac:juice_up()
                            G.hand.cards[i]:juice_up()
                            return true
                        end}))
                end
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.little_cat == false
		end,
    },
    'catto', catto = {
        name = "Catto!",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
			"Creates {C:attention}#3# Soulbound Cards{} and puts",
            "them in your {C:attention}graveyard{}"
        },
        pos = { x = 1, y = 1 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_big_cat',
                amount = 3,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_soulbound'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
				local cardmak = create_playing_card({center = G.P_CENTERS.m_thac_soulbound}, G.deck)
				cardmak:move_to_graveyard()
			end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.big_cat == false
		end,
    },
    'castle_zodiac', castle_zodiac = {
        name = "Castle Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create {C:attention}#3# {C:tarot}Tarot{} cards",
            "{C:inactive}(Must have room){}",
        },
        pos = { x = 2, y = 1 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_castle',
                amount = 2
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i = 1, math.min(zodiac.config.extra.amount, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, nil, 'castle_flush_zodiac')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        card:juice_up(0.3, 0.5)
                    end
                    return true end }))
            end
            delay(0.6)
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.castle == false
		end,
    },
    'blaze_house_zodiac', blaze_house_zodiac = {
        name = "Blaze House Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create {C:attention}#3#{} copies of",
            "{C:attention}second{} scoring card and",
            "put them in your {C:attention}graveyard{}",
        },
        pos = { x = 3, y = 1 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_blaze_house',
                amount = 3,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = {key = "graveyard", set = "Other"} end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
				local cardmak = copy_card(context.scoring_hand[2], nil, nil, context.scoring_hand[2].playing_card)
				cardmak:move_to_graveyard()
			end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.blaze_house == false
		end,
    },
    'flushblaze_zodiac', flushblaze_zodiac = {
        name = "Flushblaze Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Upgrade the {C:attention}level{} of the {C:attention}suit{}",
            "of {C:attention}left-most{} scoring card",
            "by {C:attention}#3#{} levels",
        },
        pos = { x = 4, y = 1 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_flushblaze',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            --if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_soulbound'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            AMM.level_up_suit(context.scoring_hand[1], context.scoring_hand[1].base.suit, nil, zodiac.config.extra.amount)
            update_hand_text({delay = 0}, {handname = localize(zodiac.config.extra.hand_type, "poker_hands"),chips = hand_chips, mult = mult, level = nil })
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.flushblaze == false
		end,
    },
    'spectrumblaze_zodiac', spectrumblaze_zodiac = {
        name = "Spectrumblaze Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Upgrade the {C:attention}level{} of the {C:attention}suit{}",
            "of a {C:green}random{} scoring card",
            "by {C:attention}#3#{} levels",
        },
        pos = { x = 5, y = 1 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_spectrumblaze',
                amount = 3,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            --if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_thac_soulbound'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            local leveller = pseudorandom_element(context.scoring_hand, pseudoseed("spectrumblaze_zodiac"))
            AMM.level_up_suit(leveller, leveller.base.suit, nil, zodiac.config.extra.amount)
            update_hand_text({delay = 0}, {handname = localize(zodiac.config.extra.hand_type, "poker_hands"),chips = hand_chips, mult = mult, level = nil })
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.spectrumblaze == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
    },
    'castle_flush_zodiac', castle_flush_zodiac = {
        name = "Castle Flush Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create {C:attention}#3# {C:planet}Planet{} cards",
            "{C:inactive}(Must have room){}",
        },
        pos = { x = 0, y = 2 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_castle_flush',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i = 1, math.min(zodiac.config.extra.amount, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        local card = create_card("Planet", G.consumeables, nil, nil, nil, nil, nil, 'castle_flush_zodiac')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        card:juice_up(0.3, 0.5)
                    end
                    return true end }))
            end
            delay(0.6)
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.castle_flush == false
		end,
    },
    'castle_spectrum_zodiac', castle_spectrum_zodiac = {
        name = "Castle Spectrum Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create {C:attention}#3# {C:oddity}Oddities{}",
            "{C:inactive}(Must have room){}",
        },
        pos = { x = 1, y = 2 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_castle_spectrum',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i = 1, math.min(zodiac.config.extra.amount, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        local card = create_card("Oddity", G.consumeables, nil, nil, nil, nil, nil, 'castle_spectrum_zodiac')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        card:juice_up(0.3, 0.5)
                    end
                    return true end }))
            end
            delay(0.6)
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.castle_spectrum == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
    },
    'skeet_flush_zodiac', skeet_flush_zodiac = {
        name = "Skeet Flush Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            'Turn #3# {C:attention}left-most{} cards in',
            'hand into {C:attention}Cosmic cards'
        },
        pos = { x = 2, y = 2 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_skeet_flush',
                amount = 3,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_ortalab_iou'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
                if G.hand.cards[i] then
                    G.hand.cards[i]:set_ability(G.P_CENTERS['m_ortalab_iou'], nil, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before', delay = 0.2, func = function()
                            zodiac:juice_up()
                            G.hand.cards[i]:juice_up()
                            return true
                        end}))
                end
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.skeet_flush == false
		end,
    },
    'skeet_spectrum_zodiac', skeet_spectrum_zodiac = {
        name = "Skeet Spectrum Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            'Turn #3# {C:attention}left-most{} cards in',
            'hand into {C:attention}Recycled cards'
        },
        pos = { x = 3, y = 2 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_skeet_spectrum',
                amount = 3,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = G.P_CENTERS['m_ortalab_recycled'] end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
                if G.hand.cards[i] then
                    G.hand.cards[i]:set_ability(G.P_CENTERS['m_ortalab_recycled'], nil, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before', delay = 0.2, func = function()
                            zodiac:juice_up()
                            G.hand.cards[i]:juice_up()
                            return true
                        end}))
                end
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.skeet_spectrum == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
    },
    'blaze_five_zodiac', blaze_five_zodiac = {
        name = "Blaze Five Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Turn {C:attention}all{} cards in hand into",
            "the {C:attention}rank{} of the {C:attention}#2#{}",
            "and give them a {C:green}random {C:blue}Seal",
        },
        pos = { x = 4, y = 2 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_blaze_five',
            },
        },
        colour = HEX('999999'),
        pre_trigger = function(self, zodiac, context)
            for k,v in ipairs(G.hand.cards) do
                SMODS.change_base(v, nil, context.scoring_hand[2].base.value)
                if not v.seal then v:set_seal(SMODS.poll_seal{key = "blaze_five_zodiac", guaranteed = true}) end
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.blaze_five == false
		end,
    },
    'flushblaze_house_zodiac', flushblaze_house_zodiac = {
        name = "Flushblaze House Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create a copy of {C:attention}each{}",
            "scoring card and put them",
            "in your {C:attention}graveyard{}",
        },
        pos = { x = 5, y = 2 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_flushblaze_house',
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = {key = "graveyard", set = "Other"} end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands')}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, #context.scoring_hand do
				local cardmak = copy_card(context.scoring_hand[i], nil, nil, context.scoring_hand[i].playing_card)
				cardmak:move_to_graveyard()
			end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.flushblaze_house == false
		end,
    },
    'spectrumblaze_house_zodiac', spectrumblaze_house_zodiac = {
        name = "Spectrumblaze House Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create {C:attention}#3#{} copies of",
            "{C:attention}each{} card in hand and",
            "put them in your {C:attention}graveyard{}",
        },
        pos = { x = 0, y = 3 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_spectrumblaze_house',
                amount = 2,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = {key = "graveyard", set = "Other"} end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for i=1, zodiac.config.extra.amount do
                for ii=1, #G.hand.cards do
                    local cardmak = copy_card(G.hand.cards[ii], nil, nil, G.hand.cards[ii].playing_card)
                    cardmak:move_to_graveyard()
                end
			end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.spectrumblaze_house == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
    },
    'flushblaze_five_zodiac', flushblaze_five_zodiac = {
        name = "Flushblaze Five Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Each scoring card gains {C:mult}+#3#{} Mult",
            "permanently and each card in",
            "hand gains {C:chips}+#3#{} Chips permanently",
        },
        pos = { x = 2, y = 3 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_flushblaze_five',
                amount = 5,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            --if not card then info_queue[#info_queue + 1] = {key = "graveyard", set = "Other"} end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount}}
        end,
        pre_trigger = function(self, zodiac, context)
            for k,v in ipairs(context.scoring_hand) do
                v.ability.perma_mult = v.ability.perma_mult + zodiac.config.extra.amount
                G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.2,func = function()
                    card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT, instant = true})
                return true end}))
            end
            delay(0.3)
            for kv,vk in ipairs(G.hand.cards) do
                v.ability.perma_bonus = v.ability.perma_bonus + zodiac.config.extra.amount
                G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.2,func = function()
                    card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS, instant = true})
                return true end}))
            end
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.flushblaze_five == false
		end,
    },
    'spectrumblaze_five_zodiac', spectrumblaze_five_zodiac = {
        name = "Spectrumblaze Five Zodiac",
        text = {
            "{C:attention}+#1#{} levels to next {C:attention}#2#",
            "Create a copy of {C:attention}first{} scored card",
            "and put it into your hand",
            "Create {C:attention}#3#{} copies of {C:attention}second{} scored card",
            "and put them into your graveyard",
            "Put a random {C:blue}Seal{} on {C:attention}third{} scored card",
            "Upgrade the {C:attention}level{} of the {C:attention}suit{}",
            "of the {C:attention}fourth{} scored card",
            "The {C:attention}fifth{} scored card gains",
            "{C:mult}+#4#{} Mult permanently when scored",
        },
        pos = { x = 3, y = 3 },
        config = {
            extra = {
                temp_level = 4,
                hand_type = 'thac_spectrumblaze_five',
                amount = 2,
                mult = 5,
            },
        },
        colour = HEX('999999'),
        loc_vars = function(self, info_queue, card)
            local zodiac = card or self
            if not card then info_queue[#info_queue + 1] = {key = "graveyard", set = "Other"} end
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands'), zodiac.config.extra.amount, zodiac.config.extra.mult}}
        end,
        pre_trigger = function(self, zodiac, context)
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local card2 = copy_card(context.scoring_hand[1], nil, nil, G.playing_card)
            card2:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, card2)
            G.hand:emplace(card2)
            card2.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    card2:start_materialize()
                    return true
                end
            })) 
            for i=1, zodiac.config.extra.amount do
                local cardmak = copy_card(context.scoring_hand[2], nil, nil, context.scoring_hand[2].playing_card)
                cardmak:move_to_graveyard()
			end
            context.scoring_hand[3]:set_seal(SMODS.poll_seal{key = "spectrumblaze_five_zodiac", guaranteed = true})
            AMM.level_up_suit(context.scoring_hand[4], context.scoring_hand[4].base.suit)
            update_hand_text({delay = 0}, {handname = localize(zodiac.config.extra.hand_type, "poker_hands"),chips = hand_chips, mult = mult, level = nil })
            context.scoring_hand[5].ability.perma_mult = context.scoring_hand[5].ability.perma_mult + zodiac.config.extra.mult
			G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.2,func = function()
				card_eval_status_text(context.scoring_hand[5], 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT, instant = true})
            return true end}))
            zodiac_reduce_level(zodiac)
    
            return context.mult, context.chips
        end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.retrievehands and not TheAutumnCircus.config.enabled_hands.spectrumblaze_five == false and next(SMODS.find_mod("SpectrumFramework"))
		end,
    },
}

SMODS.Atlas{
	key = "TotallyRealZodiac",
	path = "TotallyRealZodiac.png",
	px = 71,
	py = 95,
}

SMODS.Atlas{
	key = "TotallyRealZodiac_ui",
	path = "TotallyRealZodiac_ui.png",
	px = 34,
	py = 34,
}

--zodiac (consumables)
for _, k in ipairs(zodiaccards) do
	local v = zodiaccards[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {
        key = k, set = "Zodiac", cost = 3, atlas = "TotallyRealZodiac", text = {
            "{C:Zodiac}Improve{} the next", 
            "{C:attention}#1#",
        },
        can_use = function(self,card) return true end,
        use = function(self,card,area,copier) use_zodiac(card) end,
        loc_vars = v.loc_vars or function(self,info_queue,card)
            if not card.fake_card and self.thacmeta_artist then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = self.thacmeta_artist} end
            info_queue[#info_queue + 1] = {generate_ui = zodiac_tooltip, key = self.config.extra.zodiac}
            return {vars = {
                localize(
                    G.ZODIACS[
                        self.config.extra.zodiac
                        ].config.extra.hand_type,
                        'poker_hands')}}
        end,
    })
end
--zodiac (object)
for _, k in ipairs(zodiacs) do
	local v = zodiacs[k]
	TheAutumnCircus.data.buffer_insert("Zodiacs", v, {
        key = k, atlas = "TotallyRealZodiac_ui",
        loc_vars = v.loc_vars or function(self, info_queue, card)
            local zodiac = card or self
            local temp_level = (not zodiac.voucher_check and G.GAME.ortalab.zodiacs.temp_level_mod or 1) * zodiac.config.extra.temp_level + (not zodiac.voucher_check and G.GAME.ortalab.vouchers.leap_year or 0)
            return {vars = {temp_level, localize(zodiac.config.extra.hand_type, 'poker_hands')}}
        end,
    })
end