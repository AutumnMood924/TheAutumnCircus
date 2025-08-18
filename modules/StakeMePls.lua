local stakes = {
	"culmination", culmination = {
		pos = { x = 0, y = 0 },
		applied_stakes = { "gold" },
		prefix_config = { applied_stakes = { mod = false } },
		sticker_pos = {x = 0, y = 0},
		modifiers = function()
			-- enables every gameplay mechanic locked behind a stake
			-- this skips things that are changes to a global number
			
			G.GAME.modifiers.enable_crv_vamp = true
			G.GAME.modifiers.enable_crv_haunted = true
			G.GAME.modifiers.enable_crv_radioactive = true
			G.GAME.modifiers.enable_crv_absolute = true
			G.GAME.modifiers.enable_crv_continuity = true
			G.GAME.modifiers.enable_crv_overtime = true
			
			G.GAME.modifiers.cry_enable_pinned_in_shop = true
			G.GAME.modifiers.enable_banana = true
			G.GAME.modifiers.inflation = true
			
			G.GAME.modifiers.entr_copper = true
			
			G.GAME.modifiers.akyrs_spawn_oxidising = true
		end,
		--shiny = true,
		colour = HEX("fff200"),
	},
}

SMODS.Atlas{
	key = "StakeMePls",
	path = "StakeMePls.png",
	px = 29,
	py = 29,
}
SMODS.Atlas{
	key = "StakeMyCardsPls",
	path = "StakeMyCardsPls.png",
	px = 71,
	py = 95,
}

--stakes
for _, k in ipairs(stakes) do
	local v = stakes[k]
	TheAutumnCircus.data.buffer_insert("Stakes", v, {key = k, atlas = "StakeMePls", sticker_atlas = "StakeMyCardsPls"})
end