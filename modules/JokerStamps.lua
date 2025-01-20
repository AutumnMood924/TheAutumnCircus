
local stamps = {
	"jimbo", jimbo = {
		name = "Jimbo",
		text = {
			"{C:attention}Hee hee! Hoo hoo!{}","{C:attention}+1 hand size for you!{}",
		},
		display_name = "Jimbo's Stamp",
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
	"todd", todd = {
		name = "Todd",
		text = {
			"{C:blue}I give you{}","{C:blue}+1 Hand{}","{C:blue}my friend!{}",
		},
		display_name = "Todd's Stamp",
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
	"steven", steven = {
		name = "Steven",
		text = {
			"{C:red}+1 additional Discard{}","{C:red}at your disposal!{}",
		},
		display_name = "Steven's Stamp",
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
	"chaos", chaos = {
		name = "Chaos",
		text = {
			"{C:green}I'll give ya{}","{C:money}$4{C:green} every round!{}",
		},
		display_name = "Chaos' Stamp",
		pos = { x = 3, y = 0 },
		color = "55A383",
		-- no functions, Chaos' Stamp effect must be hardcoded atm
	},
	"andy", andy = {
		name = "Andy",
		text = {
			"{C:purple}Hey-hey-hey!{}","{C:purple}I'll grant you{}","{C:attention}+1{C:purple} consumable slot!{}",
		},
		display_name = "Andy's Stamp",
		pos = { x = 4, y = 0 },
		color = "8F5AC1",
		apply = function(card)
			if card.added_to_deck then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
			end
		end,
		unapply = function(card)
			if card.added_to_deck then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
			end
		end,
		deck_add = function()
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
		end,
		deck_remove = function()
			G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
		end,
	},
	"mr_bones", mr_bones = {
		name = "Mr. Bones",
		text = {
			"Hey there chap,","I'll make {C:attention}Blinds{}","15% weaker",
		},
		display_name = "Mr. Bones' Stamp",
		pos = { x = 5, y = 0 },
		color = "B1A485",
		-- no functions, Mrbones's Stamp effect must be hardcoded atm
	},
	"vampire", vampire = {
		name = "Vampire",
		text = {
			"{C:inactive}Not Yet Implemented"
			-- "{C:attention}Played cards{} with {C:attention}seals{}",
			-- "permanently gain {X:mult,C:white} X0.25 {C:mult} Mult{},",
			-- "removes card {C:attention}seal{}",
		},
		display_name = "Vampire's Stamp",
		pos = { x = 6, y = 0 },
		color = "3C3C3C",
	},
	"sock_and_buskin", sock_and_buskin = {
		name = "Sock and Buskin",
		text = {
			"{C:inactive}We'll {C:attention}retrigger{}",
			"{C:inactive}this {C:attention}Joker{C:inactive}.{}", 
		},
		display_name = "Sock and Buskin's Stamp",
		pos = { x = 7, y = 0 },
		color = "4F4F4F",
	},
	"hiker", hiker = {
		name = "Hiker",
		text = {
			"{C:inactive}Not Yet Implemented"
			-- "Cards in the {C:attention}first drawn{}",
			-- "{C:attention}hand{} permanently gain {C:chips}+5 Chips{}"
		},
		display_name = "Hiker's Stamp",
		pos = { x = 8, y = 0 },
		color = "6AAB5F",
	},
	"gros_michel", gros_michel = {
		name = "Gros Michel",
		text = {
			"{C:inactive}Not Yet Implemented"
		},
		display_name = "Gros Michel's Stamp",
		pos = { x = 9, y = 0 },
		color = "B59A00",
	},
}


SMODS.Atlas{
	key = "JokerStamps",
	path = "JokerStamps.png",
	px = 71,
	py = 95,
}

--seals
for _, k in ipairs(stamps) do
	local v = stamps[k]
	TheAutumnCircus.data.buffer_insert("Stamps", v, {key = k, atlas = "JokerStamps"})
end