-- generic function for dogs/cats
function get_animal(hand, high, low)
	local four_fingers = next(find_joker('Four Fingers'))
	if #hand < (four_fingers and 4 or 5) then return {} end
	local ret = {}
	local mess = {}
	local high_card = SMODS.Ranks[high]
	local highnom = high_card.nominal + (high_card.face_nominal or 0)
	local low_card = SMODS.Ranks[low]
	local lownom = low_card.nominal + (low_card.face_nominal or 0) --stupid
	
	for i = 1, #hand do
		local k = hand[i].base.value
		local v = SMODS.Ranks[k]
		local vnom = v.nominal + (v.face_nominal or 0)
		-- no pairs in animals
		if not mess[k] and not SMODS.has_no_rank(hand[i]) then
			-- ensure cards are within bounds
			if not (vnom > highnom or vnom < lownom) then
				mess[k] = true
				table.insert(ret, hand[i])
			end
		end
	end
	--[[for i=1,#ret do
		print(tostring(inspect(ret[i].base)))
	end--]]
	if mess[high] and mess[low] and #ret >= (four_fingers and 4 or 5) then
		return {ret}
	else
		return {}
	end
end

local hands = {
	"nice", nice = {
		name = "Nice",
		above_hand = "Pair",
		text = {"A 9 and a 6",},
		visible = true,
		chips = 15,
		mult = 2,
		l_chips = 9,
		l_mult = 6,
		example = {
			{"H_K",false},
			{"S_9",true},
			{"H_8",false},
			{"C_6",true},
			{"C_2",false},
		},
		evaluate = function(parts)
			return parts.thac_nice
		end,
	},
	"blaze", blaze = {
		name = "Blaze",
		above_hand = "Two Pair",
		text = {"5 face cards",},
		visible = true,
		chips = 25,
		mult = 2,
		l_chips = 20,
		l_mult = 2,
		example = {
			{"C_K",true},
			{"C_Q",true},
			{"D_Q",true},
			{"S_J",true},
			{"D_J",true}
		},
		evaluate = function(parts)
			return parts.thac_blaze
		end,
	},
	"twice_nice", twice_nice = {
		name = "Twice Nice",
		above_hand = "Three of a Kind",
		text = {"Two 9s and two 6s",},
		visible = true,
		chips = 31,
		mult = 3,
		l_chips = 6,
		l_mult = 9,
		example = {
			{"D_9",true},
			{"D_9",true},
			{"H_7",false},
			{"C_6",true},
			{"S_6",true}
		},
		evaluate = function(parts)
			return parts.thac_twice_nice
		end,
	},
	"skeet", skeet = {
		name = "Skeet",
		above_hand = "Three of a Kind",
		text = {"5 cards with ranks 2, 5, 9,","and two other ranks between 2 and 9"},
		visible = true,
		chips = 35,
		mult = 3,
		l_chips = 10,
		l_mult = 4,
		example = {
			{"S_9",true},
			{"H_7",true},
			{"D_5",true},
			{"S_4",true},
			{"D_2",true}
		},
		evaluate = function(parts)
			return parts.thac_skeet
		end,
	},
	"little_dog", little_dog = {
		name = "Little Dog",
		above_hand = "Straight",
		text = {"5 cards with 7-high and 2-low","with no pairs"},
		visible = true,
		chips = 31,
		mult = 4,
		l_chips = 55,
		l_mult = 1,
		example = {
			{"D_7",true},
			{"C_6",true},
			{"S_4",true},
			{"D_3",true},
			{"D_2",true}
		},
		evaluate = function(parts)
			return parts.thac_little_dog
		end,
	},
	"big_dog", big_dog = {
		name = "Big Dog",
		above_hand = "Straight",
		text = {"5 cards with Ace-high and 9-low","with no pairs"},
		visible = true,
		chips = 32,
		mult = 4,
		l_chips = 55,
		l_mult = 1,
		example = {
			{"S_A",true},
			{"H_Q",true},
			{"C_J",true},
			{"C_T",true},
			{"S_9",true}
		},
		evaluate = function(parts)
			return parts.thac_big_dog
		end,
	},
	"little_cat", little_cat = {
		name = "Little Cat",
		above_hand = "Straight",
		text = {"5 cards with 8-high and 3-low","with no pairs"},
		visible = true,
		chips = 33,
		mult = 4,
		l_chips = 55,
		l_mult = 1,
		example = {
			{"H_8",true},
			{"S_6",true},
			{"D_5",true},
			{"D_4",true},
			{"C_3",true}
		},
		evaluate = function(parts)
			return parts.thac_little_cat
		end,
	},
	"big_cat", big_cat = {
		name = "Big Cat",
		above_hand = "Straight",
		text = {"5 cards with King-high and 8-low","with no pairs"},
		visible = true,
		chips = 34,
		mult = 4,
		l_chips = 55,
		l_mult = 1,
		example = {
			{"D_K",true},
			{"C_Q",true},
			{"H_J",true},
			{"C_9",true},
			{"H_8",true}
		},
		evaluate = function(parts)
			return parts.thac_big_cat
		end,
	},
	"castle", castle = {
		name = "Castle",
		above_hand = "Flush",
		text = {"3 face cards","and 2 non-face cards","that make a Pair"},
		visible = true,
		chips = 38,
		mult = 4,
		l_chips = 44,
		l_mult = 4,
		example = {
			{"C_K",true},
			{"C_Q",true},
			{"D_Q",true},
			{"S_6",true},
			{"D_6",true}
		},
		evaluate = function(parts)
			return parts.thac_castle_base
		end,
	},
	"blaze_house", blaze_house = {
		name = "Blaze House",
		above_hand = "Full House",
		text = {
			'A Three of a Kind and a Pair,',
			'each consisting of face cards',
		},
		visible = true,
		chips = 50,
		mult = 5,
		l_chips = 25,
		l_mult = 3,
		example = {
			{"S_K",true},
			{"H_K",true},
			{"D_K",true},
			{"S_J",true},
			{"D_J",true}
		},
		evaluate = function(parts)
			if #parts._3 < 1 or #parts._2 < 2 or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts._all_pairs, parts.thac_blaze)}
		end
	},
	"flushblaze", flushblaze = {
		name = "Flushblaze",
		above_hand = "Four of a Kind",
		text = {
			'5 face cards that share the same suit'
		},
		visible = false,
		chips = 80,
		mult = 7,
		l_chips = 35,
		l_mult = 3,
		example = {
			{"S_K",true},
			{"S_K",true},
			{"S_Q",true},
			{"S_J",true},
			{"S_J",true}
		},
		evaluate = function(parts)
			if not next(parts._flush) or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts._flush, parts.thac_blaze)}
		end
	},
	"spectrumblaze", spectrumblaze = {
		name = "Spectrumblaze",
		above_hand = "Four of a Kind",
		text = {
			'5 face cards that each',
			'have different suits'
		},
		visible = false,
		chips = 90,
		mult = 8,
		l_chips = 40,
		l_mult = 3,
		example = {
			{"spectrum_fakewild_K",true},
			{"H_K",true},
			{"C_Q",true},
			{"D_J",true},
			{"S_J",true}
		},
		evaluate = function(parts)
			if not next(parts.spectrum_spectrum) or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts.spectrum_spectrum, parts.thac_blaze)}
		end,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	"castle_flush", castle_flush = {
		name = "Castle Flush",
		above_hand = "Straight Flush",
		text = {"3 face cards and 2","non-face cards that make a Pair,","that all share a suit"},
		visible = false,
		chips = 102,
		mult = 8,
		l_chips = 44,
		l_mult = 4,
		example = {
			{"D_Q",true},
			{"D_J",true},
			{"D_J",true},
			{"D_4",true},
			{"D_4",true}
		},
		evaluate = function(parts)
			if not next(parts._flush) or not next(parts.thac_castle_base) then return {} end
			return {SMODS.merge_lists (parts._flush, parts.thac_castle_base)}
		end
	},
	"castle_spectrum", castle_spectrum = {
		name = "Castle Spectrum",
		above_hand = "Straight Flush",
		text = {"3 face cards and 2","non-face cards that make a Pair,","that each have different suits"},
		visible = false,
		chips = 109,
		mult = 9,
		l_chips = 44,
		l_mult = 4,
		example = {
			{"H_K",true},
			{"spectrum_fakewild_K",true},
			{"D_Q",true},
			{"S_5",true},
			{"C_5",true}
		},
		evaluate = function(parts)
			if not next(parts.spectrum_spectrum) or not next(parts.thac_castle_base) then return {} end
			return {SMODS.merge_lists (parts.spectrum_spectrum, parts.thac_castle_base)}
		end,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	"skeet_flush", skeet_flush = {
		name = "Skeet Flush",
		above_hand = "Straight Flush",
		text = {"5 cards with ranks 2, 5, 9,","and two other ranks between 2 and 9","with all cards sharing the same suit"},
		visible = true,
		chips = 110,
		mult = 9,
		l_chips = 15,
		l_mult = 6,
		example = {
			{"C_9",true},
			{"C_6",true},
			{"C_5",true},
			{"C_3",true},
			{"C_2",true}
		},
		evaluate = function(parts)
			if not next(parts._flush) or not next(parts.thac_skeet) then return {} end
			return {SMODS.merge_lists (parts._flush, parts.thac_skeet)}
		end
	},
	"skeet_spectrum", skeet_spectrum = {
		name = "Skeet Spectrum",
		above_hand = "Straight Flush",
		text = {"5 cards with ranks 2, 5, 9,","and two other ranks between 2 and 9","with each card having a different suit"},
		visible = false,
		chips = 120,
		mult = 10,
		l_chips = 15,
		l_mult = 6,
		example = {
			{"C_9",true},
			{"H_6",true},
			{"S_5",true},
			{"D_3",true},
			{"spectrum_fakewild_2",true}
		},
		evaluate = function(parts)
			if not next(parts.spectrum_spectrum) or not next(parts.thac_skeet) then return {} end
			return {SMODS.merge_lists (parts.spectrum_spectrum, parts.thac_skeet)}
		end,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	"blaze_five", blaze_five = {
		name = "Blaze Five",
		above_hand = "Five of a Kind",
		text = {
			'5 face cards with the same rank'
		},
		visible = false,
		chips = 130,
		mult = 13,
		l_chips = 40,
		l_mult = 3,
		example = {
			{"S_J",true},
			{"S_J",true},
			{"C_J",true},
			{"D_J",true},
			{"D_J",true}
		},
		evaluate = function(parts)
			if not next(parts._5) or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts._5, parts.thac_blaze)}
		end
	},
	"flushblaze_house", flushblaze_house = {
		name = "Flushblaze House",
		above_hand = "Flush House",
		text = {
			'A Three of a Kind and a Pair,',
			'each consisting of face cards',
			'that share the same suit',
		},
		visible = false,
		chips = 150,
		mult = 15,
		l_chips = 40,
		l_mult = 3,
		example = {
			{"D_K",true},
			{"D_K",true},
			{"D_K",true},
			{"D_Q",true},
			{"D_Q",true}
		},
		evaluate = function(parts)
			if #parts._3 < 1 or #parts._2 < 2 or not next(parts._flush) or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts._flush, parts.thac_blaze, parts._all_pairs)}
		end
	},
	"spectrumblaze_house", spectrumblaze_house = {
		name = "Spectrumblaze House",
		above_hand = "Flush House",
		text = {
			'A Three of a Kind and a Pair,',
			'each consisting of face cards,',
			'each with a different suit',
		},
		visible = false,
		chips = 155,
		mult = 15,
		l_chips = 50,
		l_mult = 5,
		example = {
			{"D_K",true},
			{"C_K",true},
			{"H_K",true},
			{"S_Q",true},
			{"spectrum_fakewild_Q",true}
		},
		evaluate = function(parts)
			if #parts._3 < 1 or #parts._2 < 2 or not next(parts.spectrum_spectrum) or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts.spectrum_spectrum, parts.thac_blaze, parts._all_pairs)}
		end,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	"flushblaze_five", flushblaze_five = {
		name = "Flushblaze Five",
		above_hand = "Flush Five",
		text = {
			'5 face cards with the same rank and suit'
		},
		visible = false,
		chips = 170,
		mult = 17,
		l_chips = 40,
		l_mult = 4,
		example = {
			{"H_K",true},
			{"H_K",true},
			{"H_K",true},
			{"H_K",true},
			{"H_K",true},
		},
		evaluate = function(parts)
			if not next(parts._5) or not next(parts._flush) or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts._5, parts._flush, parts.thac_blaze)}
		end
	},
	"spectrumblaze_five", spectrumblaze_five = {
		name = "Spectrumblaze Five",
		above_hand = "Flush Five",
		text = {
			'5 face cards with the same rank,',
			'each with a different suit'
		},
		visible = false,
		chips = 190,
		mult = 19,
		l_chips = 65,
		l_mult = 5,
		example = {
			{"S_Q",true},
			{"spectrum_fakewild_Q",true},
			{"C_Q",true},
			{"H_Q",true},
			{"D_Q",true},
		},
		evaluate = function(parts)
			if not next(parts._5) or not next(parts.spectrum_spectrum) or not next(parts.thac_blaze) then return {} end
			return {SMODS.merge_lists (parts._5, parts.spectrum_spectrum, parts.thac_blaze)}
		end,
		load_check = function()
			if SMODS.Mods['SpectrumFramework'] then return true end return false
		end
	},
	"castle_stone", castle_stone = {
		name = "Stone Castle",
		above_hand = "Flush Five",
		text = {"3 face cards","and 2 Stone cards"},
		visible = false,
		chips = 500,
		mult = 4,
		l_chips = 44,
		l_mult = 4,
		example = {
			{"H_J",true},
			{"H_J",true},
			{"H_J",true},
			{"S_2",true,"m_stone"},
			{"S_2",true,"m_stone"}
		},
		evaluate = function(parts)
			return parts.thac_castle_stone
		end,
	},
	"castle_gold", castle_gold = {
		name = "Gold Castle",
		above_hand = "Flush Five",
		text = {"3 face cards","and 2 non-face Gold cards"},
		visible = false,
		chips = 250,
		mult = 25,
		l_chips = 44,
		l_mult = 4,
		example = {
			{"C_K",true},
			{"C_K",true},
			{"D_J",true},
			{"S_5",true,"m_gold"},
			{"D_2",true,"m_gold"}
		},
		evaluate = function(parts)
			return parts.thac_castle_gold
		end,
	},
	"castle_steel", castle_steel = {
		name = "Steel Castle",
		above_hand = "Flush Five",
		text = {"3 face cards","and 2 non-face Steel cards"},
		visible = false,
		chips = 200,
		mult = 30,
		l_chips = 44,
		l_mult = 4,
		example = {
			{"H_Q",true},
			{"D_J",true},
			{"H_J",true},
			{"C_7",true,"m_steel"},
			{"S_4",true,"m_steel"}
		},
		evaluate = function(parts)
			return parts.thac_castle_steel
		end,
	},
	"castle_glass", castle_glass = {
		name = "Glass Castle",
		above_hand = "Flush Five",
		text = {"3 face cards","and 2 non-face Glass cards"},
		visible = false,
		chips = 100,
		mult = 44,
		l_chips = 44,
		l_mult = 4,
		example = {
			{"C_K",true},
			{"H_Q",true},
			{"S_J",true},
			{"C_T",true,"m_glass"},
			{"H_6",true,"m_steel"}
		},
		evaluate = function(parts)
			return parts.thac_castle_glass
		end,
	},
}

local handparts = {
	"blaze", blaze = {
		func = function(hand)
			local four_fingers = next(find_joker('Four Fingers'))
			local num_face = 0
			local ret = {}
			for i = 1, #hand do
				if hand[i]:is_face(true) then
					num_face = num_face + 1
					table.insert(ret, hand[i])
				end
			end
			local target = four_fingers and 4 or 5
			return (num_face >= target) and {ret} or {}
		end
	},
	"skeet", skeet = {
		func = function(hand)
			if #hand < 5 then return {} end
			local ret = {}
			local mess = {}
			for i = 1, #hand do
				local v = tonumber(hand[i].base.value)
				-- Skip anything we can't interpret as a number
				if v and not SMODS.has_no_rank(hand[i]) then
					-- Skeets don't contain pairs by definition
					-- (skips any past the first qualifying cards)
					if not mess[v] then
						-- Skeets don't contain numbers greater than 9 or less than 2
						if not (v > 9 or v < 2) then
							mess[v] = true
							table.insert(ret, hand[i])
						end
					end
				end
			end
			if mess[2] and mess[5] and mess[9] and #ret >= 5 then
				return {ret}
			else
				return {}
			end
		end
	},
	"little_dog", little_dog = {
		func = function(hand)
			return get_animal(hand, "7", "2")
		end
	},
	"big_dog", big_dog = {
		func = function(hand)
			return get_animal(hand, "Ace", "9")
		end
	},
	"little_cat", little_cat = {
		func = function(hand)
			return get_animal(hand, "8", "3")
		end
	},
	"big_cat", big_cat = {
		func = function(hand)
			return get_animal(hand, "King", "8")
		end
	},
	"nice", nice = {
		func = function(hand)
			if #hand < 2 then return {} end
			local ret = {}
			local mess = {}
			for i = 1, #hand do
				local v = tonumber(hand[i].base.value)
				-- Skip anything we can't interpret as a number
				if v and not SMODS.has_no_rank(hand[i]) then
					-- Nices don't contain pairs by definition
					-- (skips any past the first qualifying cards)
					if not mess[v] then
						-- Nices contain a 9 and a 6
						if (v == 9 or v == 6) then
							mess[v] = true
							table.insert(ret, hand[i])
						end
					end
				end
			end
			if mess[6] and mess[9] and #ret >= 2 then
				return {ret}
			else
				return {}
			end
		end
	},
	"twice_nice", twice_nice = {
		func = function(hand)
			if #hand < 4 then return {} end
			local ret = {}
			local mess = {}
			for i = 1, #hand do
				local v = tonumber(hand[i].base.value)
				-- Skip anything we can't interpret as a number
				if v and not SMODS.has_no_rank(hand[i]) then
					-- Twice Nices contain pairs and two pairs by definition
					-- (skips any past the first qualifying cards)
					if not mess[v] or mess[v] < 2  then
						-- Nices contain a 9 and a 6
						if (v == 9 or v == 6) then
							mess[v] = mess[v] or 0
							mess[v] = mess[v] + 1
							table.insert(ret, hand[i])
						end
					end
				end
			end
			if mess[6] and mess[9] and mess[6] >= 2 and mess[9] >= 2 and #ret >= 2 then
				return {ret}
			else
				return {}
			end
		end
	},
	"castle_base", castle_base = {
		func = function(hand)
			if #hand < 5 then return {} end
			local ret = {}
			local mess = {}
			local messtarget = ""
			local faces = 0
			for i = 1, #hand do
				local v = hand[i].base.value
				-- Skip anything we can't interpret (for whatever reason)
				if v then
					-- The "Base" of a Castle is comprised of three face
					-- cards of any ranks
					if hand[i]:is_face(true) and faces < 3 then
						faces = faces + 1
						table.insert(ret, hand[i])
					elseif (not SMODS.has_no_rank(hand[i])) and messtarget == "" and not hand[i]:is_face() then
					-- The "Wall" of a Castle is comprised of any two
					-- non-face cards of any ranks, but they must
					-- make a pair
						mess[v] = mess[v] or {}
						mess[v][#mess[v]+1] = hand[i]
						if #mess[v] >= 2 then
							messtarget = v
							for ii = 1, #mess[v] do
								table.insert(ret, mess[v][ii])
							end
						end
					end
				end
			end
			if mess[messtarget] and #mess[messtarget] >= 2 and faces >= 3 and #ret >= 5 then
				return {ret}
			else
				return {}
			end
		end
	},
	"castle_steel", castle_steel = {
		func = function(hand)
			if #hand < 5 then return {} end
			local ret = {}
			local faces = 0
			for i = 1, #hand do
				local v = hand[i].base.value
				-- Skip anything we can't interpret (for whatever reason)
				if v then
					-- The "Base" of a Castle is comprised of three face
					-- cards of any ranks
					if hand[i]:is_face(true) and faces < 3 then
						faces = faces + 1
						table.insert(ret, hand[i])
					elseif (not SMODS.has_no_rank(hand[i])) and not hand[i]:is_face() then
					-- The "Wall" of a STEEL Castle is comprised of any two
					-- non-face STEEL cards of any ranks
						if hand[i].ability.name == "Steel Card" then
								table.insert(ret, hand[i])
						end
					end
				end
			end
			if faces >= 3 and #ret >= 5 then
				return {ret}
			else
				return {}
			end
		end
	},
	"castle_stone", castle_stone = {
		func = function(hand)
			if #hand < 5 then return {} end
			local ret = {}
			local faces = 0
			for i = 1, #hand do
				local v = hand[i].base.value
				-- Skip anything we can't interpret (for whatever reason)
				if v then
					-- The "Base" of a Castle is comprised of three face
					-- cards of any ranks
					if hand[i]:is_face(true) and faces < 3 then
						faces = faces + 1
						table.insert(ret, hand[i])
					else
					-- The "Wall" of a STONE Castle is comprised of any two
					-- non-face STONE cards of any ranks
						if hand[i].ability.name == "Stone Card" and not hand[i]:is_face() then
								table.insert(ret, hand[i])
						end
					end
				end
			end
			if faces >= 3 and #ret >= 5 then
				return {ret}
			else
				return {}
			end
		end
	},
	"castle_gold", castle_gold = {
		func = function(hand)
			if #hand < 5 then return {} end
			local ret = {}
			local faces = 0
			for i = 1, #hand do
				local v = hand[i].base.value
				-- Skip anything we can't interpret (for whatever reason)
				if v then
					-- The "Base" of a Castle is comprised of three face
					-- cards of any ranks
					if hand[i]:is_face(true) and faces < 3 then
						faces = faces + 1
						table.insert(ret, hand[i])
					elseif (not SMODS.has_no_rank(hand[i])) then
					-- The "Wall" of a GOLD Castle is comprised of any two
					-- non-face GOLD cards of any ranks
						if hand[i].ability.name == "Gold Card" and not hand[i]:is_face() then
								table.insert(ret, hand[i])
						end
					end
				end
			end
			if faces >= 3 and #ret >= 5 then
				return {ret}
			else
				return {}
			end
		end
	},
	"castle_glass", castle_glass = {
		func = function(hand)
			if #hand < 5 then return {} end
			local ret = {}
			local faces = 0
			for i = 1, #hand do
				local v = hand[i].base.value
				-- Skip anything we can't interpret (for whatever reason)
				if v then
					-- The "Base" of a Castle is comprised of three face
					-- cards of any ranks
					if hand[i]:is_face(true) and faces < 3 then
						faces = faces + 1
						table.insert(ret, hand[i])
					elseif (not SMODS.has_no_rank(hand[i])) then
					-- The "Wall" of a GLASS Castle is comprised of any two
					-- non-face GLASS cards of any ranks
						if hand[i].ability.name == "Glass Card" and not hand[i]:is_face() then
								table.insert(ret, hand[i])
						end
					end
				end
			end
			if faces >= 3 and #ret >= 5 then
				return {ret}
			else
				return {}
			end
		end
	},
}

function TheAutumnCircus.INIT.RetrieveHands()
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
end