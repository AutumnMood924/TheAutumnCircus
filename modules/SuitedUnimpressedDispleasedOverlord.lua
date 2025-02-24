local suits = {
	"cups", cups = {
		name = "Cups",
		row = 0,
		card_key = "Cu",
		ui_pos = {x = 0, y = 0},
		color = "009cfd",
		flush_function = function(hand)
			ease_hands_played(1)
			return { message = "+1 Hand" }
		end,
		--center_override = minor_arcana_center_override,
	},
	"wands", wands = {
		name = "Wands",
		row = 1,
		card_key = "Wa",
		ui_pos = {x = 1, y = 0},
		color = "56a786",
		flush_function = function(hand)
			for i=1,#hand do
				hand[i].ability.perma_bonus = hand[i].ability.perma_bonus or 0
				hand[i].ability.perma_bonus = hand[i].ability.perma_bonus + 10
			end
			return { message = "Upgrade!" }
		end,
		--center_override = minor_arcana_center_override,
	},
	"coins", coins = {
		name = "Coins",
		row = 2,
		card_key = "Co",
		ui_pos = {x = 2, y = 0},
		color = "fda200",
		flush_function = function(hand)
			ease_dollars(5)
			return { message = "+5 Dollars" }
		end,
		--center_override = minor_arcana_center_override,
	},
	"swords", swords = {
		name = "Swords",
		row = 3,
		card_key = "Sw",
		ui_pos = {x = 3, y = 0},
		color = "fe5f55",
		flush_function = function(hand)
			mult = mod_mult(mult*2)
			update_hand_text({delay = 0}, {mult = mult})
			return { message = "X2 Mult" }
		end,
		--center_override = minor_arcana_center_override,
	},
	"pickaxes", pickaxes = {
		name = "Pickaxes",
		row = 4,
		card_key = "PA",
		ui_pos = {x = 0, y = 1},
		color = "808080",
		flush_function = function(hand)
			return { message = "Mined!", func = function(hand)
				for i=1,#G.hand.cards do
					if G.hand.cards[i].ability.effect == "Stone Card" then
						G.hand.cards[i]:set_ability(G.P_CENTERS['m_steel'])
					end
				end
			end}
		end,
		--center_override = stone_center_override
	},
}
--[[
SMODS.Atlas{
	key = "suitoverride",
	path = "suit.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "aspectsuit",
	path = "aspectsuit.png",
	px = 71,
	py = 95,
}--]]
SMODS.Atlas{
	key = "SuitedUnimpressedDispleasedOverlord",
	path = "SuitedUnimpressedDispleasedOverlord.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "SuitedUnimpressedDispleasedOverlord2",
	path = "SuitedUnimpressedDispleasedOverlord2.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "SuitedUnimpressedDispleasedOverlord_ui",
	path = "SuitedUnimpressedDispleasedOverlord_ui.png",
	px = 18,
	py = 18,
}

--suits
for _, k in ipairs(suits) do
	local v = suits[k]
	TheAutumnCircus.data.buffer_insert("Suits", v, {key = v.name, lc_atlas = "SuitedUnimpressedDispleasedOverlord", hc_atlas = "SuitedUnimpressedDispleasedOverlord2", ui_atlas = "SuitedUnimpressedDispleasedOverlord_ui"})
end