
local danks = {
	'jester', jester = {
		card_key = "JESTER",
		shorthand = "Js",
		pos = {x = 0},
		suit_map = {Hearts = 0, Clubs = 1, Diamonds = 2, Spades = 3},
		next = { },
		strength_effect = {
			ignore = true,
		},
		nominal = 10,
		face_nominal = 0.17,
		face = true,

		in_pool = function(self, args)
			if args and args.initial_deck then return G.GAME.starting_params.thac_jesters end return true
		end
	},
	'wand', wand = {
		card_key = "WAND",
		shorthand = "Wa",
		pos = {x = 1},
		suit_map = {Hearts = 0, Clubs = 1, Diamonds = 2, Spades = 3},
		next = { },
		strength_effect = {
			ignore = true,
		},
		nominal = 1,
		face_nominal = 0.12,
		--face = true,

		in_pool = function(self, args)
			if args and args.initial_deck then return G.GAME.starting_params.thac_wands end return true
		end
	},
	'sword', sword = {
		card_key = "SWORD",
		shorthand = "Sw",
		pos = {x = 2},
		suit_map = {Hearts = 0, Clubs = 1, Diamonds = 2, Spades = 3},
		next = { },
		strength_effect = {
			ignore = true,
		},
		nominal = 1,
		face_nominal = 0.10,
		--face = true,

		in_pool = function(self, args)
			if args and args.initial_deck then return G.GAME.starting_params.thac_swords end return true
		end
	},
	'vessel', vessel = {
		card_key = "VESSEL",
		shorthand = "Vs",
		pos = {x = 3},
		suit_map = {Hearts = 0, Clubs = 1, Diamonds = 2, Spades = 3},
		next = { },
		strength_effect = {
			ignore = true,
		},
		nominal = 1,
		face_nominal = 0.11,
		--face = true,

		in_pool = function(self, args)
			if args and args.initial_deck then return G.GAME.starting_params.thac_vessels end return true
		end
	},
	'coin', coin = {
		card_key = "COIN",
		shorthand = "C$",
		pos = {x = 4},
		suit_map = {Hearts = 0, Clubs = 1, Diamonds = 2, Spades = 3},
		next = { },
		strength_effect = {
			ignore = true,
		},
		nominal = 1,
		face_nominal = 0.13,
		--face = true,

		in_pool = function(self, args)
			if args and args.initial_deck then return G.GAME.starting_params.thac_coins end return true
		end
	},
}

SMODS.Atlas{
	key = "DankRanks",
	path = "DankRanks.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "DankRanksToo",
	path = "DankRanksTwo.png",
	px = 71,
	py = 95,
}

--danks
for _, k in ipairs(danks) do
	local v = danks[k]
	TheAutumnCircus.data.buffer_insert("Ranks", v, {key = k, lc_atlas = "DankRanks", hc_atlas = "DankRanksToo"})
end