
local hands = {
	"manus_arcana", manus_arcana = {
		name = "Manus Arcana",
		above_hand = "Four of a Kind",
		text = {
			"4 or more cards with Coin, Wand,",
			"Vessel, and Sword ranks among them"
		},
		visible = false,
		chips = 80,
		mult = 7,
		l_chips = 13,
		l_mult = 4,
		example = {
			{"D_thac_COIN",true},
			{"C_thac_WAND",true},
			{"H_thac_VESSEL",true},
			{"S_thac_SWORD",true},
			{"D_Q",false},
		},
		evaluate = function(parts)
			return parts.thac_manus_arcana
		end,
	},
}

local handparts = {
	"manus_arcana", manus_arcana = {
		func = function(hand)
			if #hand < 4 then return {} end
			local ret = {}
			local mess = {}
			for i = 1, #hand do
				local v = hand[i].base.value
				if v and not SMODS.has_no_rank(hand[i]) then
					if not mess[v] then
						if (v == "thac_sword" or v == "thac_vessel" or v == "thac_coin" or v == "thac_wand") then
							mess[v] = true
							table.insert(ret, hand[i])
						end
					end
				end
			end
			if mess["thac_sword"] and mess["thac_vessel"] and mess["thac_coin"] and mess["thac_wand"] and #ret >= 4 then
				return {ret}
			else
				return {}
			end
		end
	},
}

--hand parts
for _, k in ipairs(handparts) do
	local v = handparts[k]
	TheAutumnCircus.data.buffer_insert("HandParts", v, {key = k})
end
--hands
for _, k in ipairs(hands) do
	local v = hands[k]
	TheAutumnCircus.data.buffer_insert("Hands", v, {key = k})
end