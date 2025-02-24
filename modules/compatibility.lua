--[[if SMODS.Mods['SixSuits'] and TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord then
	local function six_suits_center_override(self, _center, _front)
		local center = _center or self.config.center
		if center and center.set == "Default" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 0, y = 2}
		elseif center and center.set == "Enhanced" then
			if center.key == "m_bonus" then
				self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
				self.children.center:set_sprite_pos{x = 1, y = 2}
			elseif center.key == "m_mult" then
				self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
				self.children.center:set_sprite_pos{x = 2, y = 2}
			elseif center.key == "m_wild" then
				self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
				self.children.center:set_sprite_pos{x = 3, y = 2}
			elseif center.key == "m_lucky" then
				self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
				self.children.center:set_sprite_pos{x = 4, y = 2}
			elseif center.key == "m_glass" then
				self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
				self.children.center:set_sprite_pos{x = 5, y = 2}
			elseif center.key == "m_steel" then
				self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
				self.children.center:set_sprite_pos{x = 6, y = 2}
			elseif center.key == "m_gold" then
				self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
				self.children.center:set_sprite_pos{x = 7, y = 2}
			end
		end
	end
	SMODS.Suits['six_Moons'].center_override = six_suits_center_override
	SMODS.Suits['six_Stars'].center_override = six_suits_center_override
end--]]