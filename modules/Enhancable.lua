local enhancements = {
	grass = {
		name = "grass",
		display_name = "Grass Card",
		text = {
			'grassy',
		},
		effect = 'grass',
		config = {
			extra = {
				chips = 3
			}
		},
		pos = { x = 1, y = 0 },
	},
}

local enhancement_codex = {
	'grass',
}

function TheAutumnCircus.INIT.Enhancable()
	
	--G.localization.misc.dictionary['b_jokers'] = "Jonklers"
	
	SMODS.Sprite:new("Thac_Enhancable", TheAutumnCircus.mod.path, "Enhancable.png", 71, 95, "asset_atli"):register();
	
	--oddities
	for _, k in ipairs(enhancement_codex) do
		local v = enhancements[k]
		TheAutumnCircus.data.buffer_insert("Enhancements", v, {key = k, atlas = "Thac_Enhancable"})
	end
end