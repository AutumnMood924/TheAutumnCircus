

local seals = {
	jimbo = {
		name = "Jimbo",
		text = {
			"{C:attention}Hee hee! Hoo hoo!{}","{C:attention}+1 hand size for you!{}",
		},
		full_name = "Jimbo's Stamp",
		pos = { x = 0, y = 0 },
		color = "FDA200",
		apply = function(card)
			if card.added_to_deck then
				G.hand:change_size(1)
			end
		end,
		unapply = function(card)
			if card.added_to_deck then
				G.hand:change_size(-1)
			end
		end,
		deck_add = function()
			G.hand:change_size(1)
		end,
		deck_remove = function()
			G.hand:change_size(-1)
		end,
	},
	todd = {
		name = "Todd",
		text = {
			"{C:blue}I give you{}","{C:blue}+1 Hand{}","{C:blue}my friend!{}",
		},
		full_name = "Todd's Stamp",
		pos = { x = 1, y = 0 },
		color = "009CFD",
		apply = function(card)
			if card.added_to_deck then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
				ease_hands_played(1)
			end
		end,
		unapply = function(card)
			if card.added_to_deck then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
				ease_hands_played(-1)
			end
		end,
		deck_add = function()
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
			ease_hands_played(1)
		end,
		deck_remove = function()
			G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
			ease_hands_played(-1)
		end,
	},
	steven = {
		name = "Steven",
		text = {
			"{C:red}+1 additional Discard{}","{C:red}at your disposal!{}",
		},
		full_name = "Steven's Stamp",
		pos = { x = 2, y = 0 },
		color = "FD5F55",
		apply = function(card)
			if card.added_to_deck then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
				ease_discard(1)
			end
		end,
		unapply = function(card)
			if card.added_to_deck then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
				ease_discard(-1)
			end
		end,
		deck_add = function()
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
			ease_discard(1)
		end,
		deck_remove = function()
			G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
			ease_discard(-1)
		end,
	},
	chaos = {
		name = "Chaos",
		text = {
			"{C:green}I'll give ya{}","{C:money}$4{C:green} every round!{}",
		},
		full_name = "Chaos' Stamp",
		pos = { x = 3, y = 0 },
		color = "55A383",
		-- no functions, Chaos' Stamp effect must be hardcoded atm
	},
	andy = {
		name = "Andy",
		text = {
			"{C:purple}Hey-hey-hey!{}","{C:purple}I'll make {C:attention}Blinds{}","{C:purple}15% easier!{}",
		},
		full_name = "Andy's Stamp",
		pos = { x = 4, y = 0 },
		color = "8F5AC1",
		-- no functions, Andy's Stamp effect must be hardcoded atm
	},
}

local seal_codex = {
	'jimbo',
	'todd',
	'steven',
	'chaos',
	'andy',
}


function ÞeAutumnCircus.INIT.JokerStamps()
	
	SMODS.Sprite:new("Þac_JokerStamps", ÞeAutumnCircus.mod.path, "JokerStamps.png", 71, 95, "asset_atli"):register();
	
	--seals
	for _, k in ipairs(seal_codex) do
		local v = seals[k]
		ÞeAutumnCircus.data.buffer_insert("Seals", v, {key = k, atlas = "Þac_JokerStamps"})
	end
end