
local decks = {
	'wheel_of_fortune_deck', wheel_of_fortune_deck = {
		config = {
			voucher = 'v_thac_wheel_of_wheel_of_fortune',
			consumables = {'c_wheel_of_fortune', 'c_wheel_of_fortune'}
		},
		pos = { x = 6, y = 0 },
		loc_vars = function(self, info_queue, center)
			--info_queue[#info_queue+1] = G.P_CENTERS[card.ability.voucher]
			--info_queue[#info_queue+1] = G.P_CENTERS[card.ability.consumables[1]]
			return { vars = { } }
		end,
	},
	'collectors_deck', collectors_deck = {
		config = {
			all_oddities = true,
			consumable_slot = 2,
		},
		pos = { x = 0, y = 0 },
		load_check = function()
			return OddityAPI ~= nil
		end,
		apply = function(self)
			G.GAME.modifiers.consumables_all_oddities = true
		end,
	},
	'undying_deck', undying_deck = {
		pos = { x = 0, y = 1 },
		apply = function(self)
			G.GAME.modifiers.thac_undying_deck = true
		end,
	},
	--[[
	'alpha_deck', alpha_deck = {
		name = "Alpha Deck",
		text = {
			"Start run with",
			"{C:thac_life}Life{}, {C:thac_hope}Hope{}, {C:thac_void}Void{},",
			"and {C:thac_heart}Heart{} in deck",
		},
		pos = { x = 3, y = 0 },
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord ~= false
		end,
		apply = function(self)
			G.GAME.modifiers.thac_alpha_deck = true
		end,
	},
	'beta_deck', beta_deck = {
		name = "Beta Deck",
		text = {
			"Start run with",
			"{C:thac_breath}Breath{}, {C:thac_space}Space{}, {C:thac_light}Light{},",
			"and {C:thac_time}Time{} in deck",
		},
		pos = { x = 2, y = 0 },
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord ~= false
		end,
		apply = function(self)
			G.GAME.modifiers.thac_beta_deck = true
		end,
	},
	'omega_deck', omega_deck = {
		name = "Omega Deck",
		text = {
			"Start run with",
			"{C:thac_blood}Blood{}, {C:thac_rage}Rage{}, {C:thac_doom}Doom{},",
			"and {C:thac_mind}Mind{} in deck",
		},
		pos = { x = 4, y = 0 },
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord ~= false
		end,
		apply = function(self)
			G.GAME.modifiers.thac_omega_deck = true
		end,
	},
	'progenitor_deck', progenitor_deck = {
		name = "Progenitor Deck",
		text = {
			"Start run with",
			"{C:thac_time}Time{}, {C:thac_breath}Breath{}, {C:thac_doom}Doom{}, {C:thac_blood}Blood{},",
			"{C:thac_heart}Heart{}, {C:thac_space}Space{}, {C:thac_mind}Mind{}, {C:thac_light}Light{},",
			"{C:thac_void}Void{}, {C:thac_rage}Rage{}, {C:thac_hope}Hope{},",
			"and {C:thac_life}Life{} in deck",
		},
		pos = { x = 5, y = 0 },
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord ~= false
		end,
		apply = function(self)
			G.GAME.modifiers.thac_progenitor_deck = true
		end,
	},
	---]]
	"duality", duality = {
		pos = {x = 1, y = 1},
		config = {
			hands = -1,
			discards = -1,
			consumable_slot = 1,
			joker_slot = 1,
		},
	},
	"gambling", gambling = {
		pos = {x = 2, y = 1},
		config = {
		},
		calculate = function(self, card, context)
			if context.mod_probability then
				return {
					numerator = context.numerator * 2,
				}
			end
		end,
	},
	"purple", purple = {
		pos = {x = 3, y = 1},
		config = {
		},
		apply = function(self)
            G.E_MANAGER:add_event(Event({
                func = function()
					SMODS.change_play_limit(1)
					SMODS.change_discard_limit(1)
                return true
                end
            }))
		end,
	},
	"teal", teal = {
		pos = {x = 4, y = 1},
		config = {
			hand_size = -1,
		},
		apply = function(self)
            G.E_MANAGER:add_event(Event({
                func = function()
					SMODS.change_play_limit(2)
					SMODS.change_discard_limit(2)
                return true
                end
            }))
		end,
	},
	"pink", pink = {
		pos = {x = 5, y = 1},
		config = {
			hand_size = 2,
		},
		apply = function(self)
            G.E_MANAGER:add_event(Event({
                func = function()
					SMODS.change_play_limit(-1)
					SMODS.change_discard_limit(-1)
                return true
                end
            }))
		end,
	},
	--[["cyan", cyan = {
		pos = {x = 6, y = 1},
		config = {
		},
		apply = function(self)
		end,
	},
	"fuchsia", fuchsia = {
		pos = {x = 0, y = 2},
		config = {
		},
		apply = function(self)
		end,
	},
	"orange", orange = {
		pos = {x = 1, y = 2},
		config = {
		},
		apply = function(self)
		end,
	},
	"lime", lime = {
		pos = {x = 2, y = 2},
		config = {
		},
		apply = function(self)
		end,
	},
	"violet", violet = {
		pos = {x = 3, y = 2},
		config = {
		},
		apply = function(self)
		end,
	},--]]
	"grey", grey = {
		pos = {x = 4, y = 2},
		config = {
		},
		apply = function(self)
		end,
	},--[[
	"pale", pale = {
		pos = {x = 5, y = 2},
		config = {
		},
		apply = function(self)
		end,
	},
	"lavender", lavender = {
		pos = {x = 6, y = 2},
		config = {
		},
		apply = function(self)
		end,
	},--]]
}



SMODS.Atlas{
	key = "DeckTheBalatro",
	path = "DeckTheBalatro.png",
	px = 71,
	py = 95,
}

--decks
for _, k in ipairs(decks) do
	local v = decks[k]
	TheAutumnCircus.data.buffer_insert("Decks", v, {key = k, atlas = "DeckTheBalatro"})
end