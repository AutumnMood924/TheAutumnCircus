
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
	'alpha_deck', alpha_deck = {
		name = "Alpha Deck",
		text = {
			"Each face card starts with",
			"a suit-dependant {C:red}Aspect{}:",
			"{C:spades}Spades{}: Life, {C:hearts}Hearts{}: Heart",
			"{C:clubs}Clubs{}: Hope, {C:diamonds}Diamonds{}: Void",
			"{C:red}-1 consumable slot",
		},
		config = {
			consumable_slot = -1,
		},
		pos = { x = 3, y = 0 },
		apply = function(self)
			G.GAME.modifiers.thac_alpha_deck = true
		end,
	},
	'beta_deck', beta_deck = {
		name = "Beta Deck",
		text = {
			"Each face card starts with",
			"a suit-dependant {C:red}Aspect{}:",
			"{C:spades}Spades{}: Space, {C:hearts}Hearts{}: Time",
			"{C:clubs}Clubs{}: Breath, {C:diamonds}Diamonds{}: Light",
			"{C:red}-1 Hand",
		},
		config = {
			hands = -1,
		},
		pos = { x = 2, y = 0 },
		apply = function(self)
			G.GAME.modifiers.thac_beta_deck = true
		end,
	},
	'omega_deck', omega_deck = {
		name = "Omega Deck",
		text = {
			"Each face card starts with",
			"a suit-dependant {C:red}Aspect{}:",
			"{C:spades}Spades{}: Rage, {C:hearts}Hearts{}: Blood",
			"{C:clubs}Clubs{}: Mind, {C:diamonds}Diamonds{}: Doom",
			"{C:red}-1 Joker slot",
		},
		config = {
			joker_slot = -1,
		},
		pos = { x = 4, y = 0 },
		apply = function(self)
			G.GAME.modifiers.thac_omega_deck = true
		end,
	},
	'progenitor_deck', progenitor_deck = {
		name = "Progenitor Deck",
		text = {
			"Each face card starts",
			"with an {C:red}Aspect",
			"{C:red}-1 Discard",
		},
		config = {
			discards = -1,
		},
		pos = { x = 5, y = 0 },
		apply = function(self)
			G.GAME.modifiers.thac_progenitor_deck = true
		end,
	},
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
	},--]]
	"violet", violet = {
		pos = {x = 3, y = 2},
		config = {
		},
		apply = function(self)
			G.GAME.modifiers.thac_violet_deck = true
		end,
	},
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
	},--]]
	"lavender", lavender = {
		pos = {x = 6, y = 2},
		config = {
			extra = {
				mult = 2,
			},
		},
		apply = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					for _, playing_card in ipairs(G.playing_cards) do
						playing_card.ability.akyrs_special_card_type = pseudorandom(pseudoseed("lavender_deck")) < 0.5 and "suit" or "rank"
						playing_card:set_sprites(playing_card.config.center,playing_card.config.card)
						if playing_card.ability.akyrs_special_card_type == "suit" then
							playing_card.ability.perma_mult = playing_card.ability.perma_mult + self.config.extra.mult
						end
					end
					return true
				end
			}))
		end,
		load_check = function()
			return next(SMODS.find_mod("aikoyorisshenanigans"))
		end,
	},
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