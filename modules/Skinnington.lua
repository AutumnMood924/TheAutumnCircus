local deckskins = {
	"yellow_eyes", yellow_eyes = {
		suit = "gb_Eyes",
		loc_txt = "Þe Autumn Circus",
		palettes = {
			{
				key = "lc",
				loc_txt = "Yellow Eyes",
				ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
				display_ranks = {"Ace", "King", "Queen", "Jack", "2"},
				atlas = "thac_Skinnington",
				pos_style = 'ranks'
			},
			{
				key = "lc_purple",
				loc_txt = "Purple Eyes",
				ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
				display_ranks = {"Ace", "King", "Queen", "Jack", "2"},
				atlas = "thac_Skinberly",
				pos_style = 'ranks'
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
	key = "Skinberly",
	path = "Skinberly.png",
	px = 71,
	py = 95,
}

--deckskins
for _, k in ipairs(deckskins) do
	local v = deckskins[k]
	TheAutumnCircus.data.buffer_insert("DeckSkins", v, {key = k})
end