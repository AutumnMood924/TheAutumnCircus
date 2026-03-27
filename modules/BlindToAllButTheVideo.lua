
local blinds = {
	"fehu", fehu = {
		pos = { x = 0, y = 0 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('ead954'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented - "cattle, wealth"
	},
	"uruz", uruz = {
		pos = { x = 0, y = 1 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('f13938'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented - "aurochs", vigor, endurance
	},
	"Þurisaz", Þurisaz = {
		pos = { x = 0, y = 2 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('7aa4f2'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return "Þat's not... Þe ÞornRing, is it?"
		end,
		--unimplemented, Þat's not... Þe ÞornRing, is it?
	},
	"ansuz", ansuz = {
		pos = { x = 0, y = 3 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('378ec2'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "god"
	},
	"raido", raido = {
		pos = { x = 0, y = 4 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('83c4b4'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "ride"
	},
	"kaunan", kaunan = {
		pos = { x = 0, y = 5 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('f08e9a'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "ride"
	},
	"gyfu", gyfu = {
		pos = { x = 0, y = 6 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('f08e9a'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "gift"
	},
	"wynn", wynn = {
		pos = { x = 0, y = 7 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('fd6054'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "joy"
	},
	"hagalaz", hagalaz = {
		pos = { x = 0, y = 8 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('009cfe'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "hail, destruction"
	},
	"naudiz", naudiz = {
		pos = { x = 0, y = 9 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('d9c357'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "urgency"
	},
	"isaz", isaz = {
		pos = { x = 0, y = 10 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('81cefd'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return "THE FORBIDDEN PATH BEGAN WITH ICE MAGIC"
		end,
		--unimplemented, "ice"
	},
	"jera", jera = {
		pos = { x = 0, y = 11 },
		boss = {min = 1, max = 9000},
		boss_colour = HEX('FDA200'),
		debuff = {},
		dollars = 0,
		modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
			if self.disabled then return mult, hand_chips, false end
			for i=1,#cards do
				local card = cards[i]
				--print(inspect(card))
				if SMODS.pseudorandom_probability(card, 'jera', 1, 4) then
					self.triggered = true
					card:juice_up()

					G.E_MANAGER:add_event(Event({
						trigger = "immediate",
						func = function()
							G.playing_card = (G.playing_card and G.playing_card + 1) or 1
							local _card = copy_card(card, nil, nil, G.playing_card)
							_card:add_to_deck()
							G.deck.config.card_limit = G.deck.config.card_limit + 1
							table.insert(G.playing_cards, _card)
							G.hand:emplace(_card)
							_card.states.visible = nil
							_card:start_materialize()
							return true
						end
					})) 
				end
			end
			return mult, hand_chips, false
		end,
		get_loc_debuff_text = function(self)
			local this = {SMODS.get_probability_vars(nil, 1, 4)}
			return this[1].." in "..this[2].." chance to copy played cards"
		end,
	},
	"eiwaz", eiwaz = {
		pos = { x = 0, y = 12 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('cd6cd9'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "yew-tree" ???
	},
	"perthro", perthro = {
		pos = { x = 0, y = 13 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('6a95a0'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "luck"
	},
	"algiz", algiz = {
		pos = { x = 0, y = 14 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('b6cedf'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "protection, divinity"
	},
	"sowilo", sowilo = {
		pos = { x = 0, y = 15 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('faa201'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "sun"
	},
	"teiwaz", teiwaz = {
		pos = { x = 0, y = 16 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('5597a3'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "justice, honor"
	},
	"berkanan", berkanan = {
		pos = { x = 0, y = 17 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('e6eefa'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "birch"
	},
	"ehwaz", ehwaz = {
		pos = { x = 0, y = 18 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('c77a32'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "harmony, teamwork"
	},
	"mannaz", mannaz = {
		pos = { x = 0, y = 19 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('dab772'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "humanity"
	},
	"laguz", laguz = {
		pos = { x = 0, y = 20 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('829cf4'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "lake"
	},
	"ingwaz", ingwaz = {
		pos = { x = 0, y = 21 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('a7d6e0'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "internal growth"
	},
	"dagaz", dagaz = {
		pos = { x = 0, y = 22 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('ffd081'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "day"
	},
	"oÞala", oÞala = {
		pos = { x = 0, y = 23 },
		boss = {min = 8999, max = 9000},
		boss_colour = HEX('bfa281'),
		debuff = {},
		dollars = 5,
		get_loc_debuff_text = function(self)
			return ""
		end,
		--unimplemented, "heritage"
	},
	"angels_wrath", angels_wrath = {
		pos = { x = 0, y = 24 },
		boss = {min = 1, max = 9000},
		boss_colour = HEX('FFF200'),
		debuff = {},
		dollars = 5,
		mult = 3,
		--implemented elsewhere
		get_loc_debuff_text = function(self)
			return localize('k_angel')
		end,
	},
	"thac", thac = {
		pos = { x = 0, y = 0 },
		boss = {showdown = true},
		boss_colour = HEX('f7dc42'),
		pronouns = "it_she_they",
		dollars = 8,
		mult = 3,
		atlas = "ShowdownThrowdown",
		calculate = function(self, blind, context)
			if not blind.disabled then
				-- checking if a card has a base value is to verify it is a playing card
				if context.debuff_card and context.debuff_card.base and context.debuff_card.base.value then
					if AMM.api.graveyard.count_rank(context.debuff_card.base.value) > 0 then
						return { debuff = true }
					end
				end
			end
		end,
	},
}

SMODS.Atlas{
	key = "BlindToAllButTheVideo",
	path = "BlindToAllButTheVideo.png",
	px = 34, 
	py = 34,
	atlas_table = "ANIMATION_ATLAS",
	frames = 21
}
SMODS.Atlas{
	key = "ShowdownThrowdown",
	path = "ShowdownThrowdown.png",
	px = 34, 
	py = 34,
	atlas_table = "ANIMATION_ATLAS",
	frames = 21
}

--blinds
for _, k in ipairs(blinds) do
	local v = blinds[k]
	TheAutumnCircus.data.buffer_insert("Blinds", v, {key = k, atlas = "BlindToAllButTheVideo"})
end