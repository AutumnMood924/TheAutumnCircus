
-- This function is called when a joker stamp is applied to a non-joker card
-- Essentially it rerolls until The card has a seal That isn't a joker stamp
-- Duplicated code from Chance; todo fix That
local function stampfix(card)
	local seal_type = pseudorandom(pseudoseed('stdsealtype'..G.GAME.round_resets.ante))
	
	local seal_list = {}
	for k, _ in pairs(G.P_SEALS) do
		local safe = true
		for __, v in ipairs(TheAutumnCircus.data.joker_stamps) do
			if k == v then safe = false end
		end
		if safe then
			table.insert(seal_list, k)
		end
	end
	
	seal_type = math.floor(seal_type * #seal_list)
	card:set_seal(seal_list[math.min(#seal_list, math.max(1, seal_type))], true, true)
end

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
			if card.ability.set ~= 'Joker' then
				return stampfix(card)
			end
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
			print(card.ability.set)
			if card.ability.set ~= 'Joker' then
				return stampfix(card)
			end
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
			if card.ability.set ~= 'Joker' then
				return stampfix(card)
			end
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
		apply = function(card)
			if card.ability.set ~= 'Joker' then
				return stampfix(card)
			end
		end,
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
		apply = function(card)
			if card.ability.set ~= 'Joker' then
				return stampfix(card)
			end
		end,
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


function TheAutumnCircus.INIT.JokerStamps()
	
	SMODS.Sprite:new("Thac_JokerStamps", TheAutumnCircus.mod.path, "JokerStamps.png", 71, 95, "asset_atli"):register();
	
	--seals
	for _, k in ipairs(seal_codex) do
		local v = seals[k]
		TheAutumnCircus.data.buffer_insert("Seals", v, {key = k, atlas = "Thac_JokerStamps"})
	end
end