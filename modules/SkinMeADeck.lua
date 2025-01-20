local deckskins = {
	"diamond_pickaxe", diamond_pickaxe = {
		suit = "thac_Pickaxes",
		ranks = { "Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King" },
		name = "Diamond Pickaxes",
		lc_atlas = "DiamondPickaxe",
		hc_atlas = "DiamondPickaxe2",
	},
}

SMODS.Atlas{
	key = "DiamondPickaxe",
	path = "DeckSkins/DiamondPickaxe.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "DiamondPickaxe2",
	path = "DeckSkins/DiamondPickaxe2.png",
	px = 71,
	py = 95,
}

--deckskins
for _, k in ipairs(deckskins) do
	local v = deckskins[k]
	TheAutumnCircus.data.buffer_insert("DeckSkins", v, {key = k})
end