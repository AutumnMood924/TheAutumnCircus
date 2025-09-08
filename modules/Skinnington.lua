local displayers = {"Ace", "King", "Queen", "Jack", "2"}

if next(SMODS.find_mod("finity")) then
	table.insert(displayers, 1, "finity_V")
end
if next(SMODS.find_mod("entr")) then
	table.insert(displayers, "entr_nilrank")
end
if next(SMODS.find_mod("paperback")) then
	table.insert(displayers, 1, "paperback_Apostle")
end

local deckskins = {
	"yellow_eyes", yellow_eyes = {
		suit = "gb_Eyes",
		loc_txt = "Þe Autumn Circus",
		palettes = {
			{
				key = "lc",
				loc_txt = "Yellow Eyes",
				ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace", "finity_V", "entr_nilrank", "paperback_Apostle", "unstb_0", "unstb_0.5", "unstb_1", "unstb_r2", "unstb_e", "unstb_Pi", "unstb_11", "unstb_12", "unstb_13", "unstb_21", "unstb_25", "unstb_161", "unstb_???"},
				display_ranks = displayers,
				atlas = "thac_Skinnington",
				pos_style = 'ranks',
				akyrs_pure_suit = {
					pos = {x = 0, y = 0,},
					atlas_key = "thac_Skinnington_akyrs",
				},
			},
			{
				key = "lc_purple",
				loc_txt = "Purple Eyes",
				ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace", "finity_V", "entr_nilrank", "paperback_Apostle", "unstb_0", "unstb_0.5", "unstb_1", "unstb_r2", "unstb_e", "unstb_Pi", "unstb_11", "unstb_12", "unstb_13", "unstb_21", "unstb_25", "unstb_161", "unstb_???"},
				display_ranks = displayers,
				atlas = "thac_Skinberly",
				pos_style = 'ranks',
				akyrs_pure_suit = {
					pos = {x = 0, y = 0,},
					atlas_key = "thac_Skinberly_akyrs",
				},
			},
			{
				key = "lc_white",
				loc_txt = "White Eyes",
				ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace", "finity_V", "entr_nilrank", "paperback_Apostle", "unstb_0", "unstb_0.5", "unstb_1", "unstb_r2", "unstb_e", "unstb_Pi", "unstb_11", "unstb_12", "unstb_13", "unstb_21", "unstb_25", "unstb_161", "unstb_???"},
				display_ranks = displayers,
				atlas = "thac_Skinthree",
				pos_style = 'ranks',
				akyrs_pure_suit = {
					pos = {x = 0, y = 0,},
					atlas_key = "thac_Skinthree_akyrs",
				},
			}
		},
		load_check = function()
			return next(SMODS.find_mod("GrabBag"))
		end,
	},
}


SMODS.Atlas{
	key = "Skinnington",
	path = "Skinnington.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "Skinnington_akyrs",
	path = "Skinnington_akyrs.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "Skinberly",
	path = "Skinberly.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "Skinberly_akyrs",
	path = "Skinberly_akyrs.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "Skinthree",
	path = "Skinthree.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "Skinthree_akyrs",
	path = "Skinthree_akyrs.png",
	px = 71,
	py = 95,
}

--deckskins
for _, k in ipairs(deckskins) do
	local v = deckskins[k]
	TheAutumnCircus.data.buffer_insert("DeckSkins", v, {key = k})
end