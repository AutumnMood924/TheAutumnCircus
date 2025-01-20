local function minor_arcana_center_override(self, _center, _front)
	local center = _center or self.config.center
	if center and center.set == "Default" then
		self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
		self.children.center:set_sprite_pos{x = 0, y = 0}
	elseif center and center.set == "Enhanced" then
		if center.key == "m_bonus" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 1, y = 0}
		elseif center.key == "m_mult" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 2, y = 0}
		elseif center.key == "m_wild" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 3, y = 0}
		end
	end
end

local function balatrostruck_center_override(self, _center, _front, row)
	local center = _center or self.config.center
	local front = _front or self.config.front
	if center and center.set == "Default" then
		self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
		self.children.center:set_sprite_pos{x = 0, y = row}
	elseif center and center.set == "Enhanced" then
		if center.key == "m_bonus" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
			self.children.center:set_sprite_pos{x = 1, y = row}
		elseif center.key == "m_mult" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
			self.children.center:set_sprite_pos{x = 2, y = row}
		elseif center.key == "m_wild" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
			self.children.center:set_sprite_pos{x = 3, y = row}
		elseif center.key == "m_lucky" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
			self.children.center:set_sprite_pos{x = 4, y = row}
		elseif center.key == "m_glass" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
			self.children.center:set_sprite_pos{x = 5, y = row}
		elseif center.key == "m_steel" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
			self.children.center:set_sprite_pos{x = 6, y = row}
		elseif center.key == "m_gold" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_aspectsuit"]
			self.children.center:set_sprite_pos{x = 7, y = row}
		end
	end
end

local function stone_center_override(self, _center, _front)
	local center = _center or self.config.center
	if center and center.set == "Default" then
		self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
		self.children.center:set_sprite_pos{x = 0, y = 7}
	elseif center and center.set == "Enhanced" then
		if center.key == "m_bonus" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 1, y = 7}
		elseif center.key == "m_mult" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 2, y = 7}
		elseif center.key == "m_wild" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 3, y = 7}
		elseif center.key == "m_lucky" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 4, y = 7}
		elseif center.key == "m_glass" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 5, y = 7}
		elseif center.key == "m_steel" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 6, y = 7}
		elseif center.key == "m_gold" then
			self.children.center.atlas = G.ASSET_ATLAS["thac_suitoverride"]
			self.children.center:set_sprite_pos{x = 7, y = 7}
		end
	end
end


local Balatrostuck = true
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
		center_override = minor_arcana_center_override,
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
		center_override = minor_arcana_center_override,
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
		center_override = minor_arcana_center_override,
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
		center_override = minor_arcana_center_override,
	},
	"light", light = {
		name = "Light",
		row = 4,
		card_key = "Li",
		ui_pos = {x = 0, y = 1},
		color = "FFFE6E",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 0)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"mind", mind = {
		name = "Mind",
		row = 5,
		card_key = "Mi",
		ui_pos = {x = 1, y = 1},
		color = "1AF096",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 1)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"rage", rage = {
		name = "Rage",
		row = 6,
		card_key = "Ra",
		ui_pos = {x = 2, y = 1},
		color = "FA00FF",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 2)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"time", time = {
		name = "Time",
		row = 7,
		card_key = "Ti",
		ui_pos = {x = 3, y = 1},
		color = "FF0000",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 3)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"breath", breath = {
		name = "Breath",
		row = 8,
		card_key = "Br",
		ui_pos = {x = 0, y = 2},
		color = "3FA1FF",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 4)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"life", life = {
		name = "Life",
		row = 9,
		card_key = "Lf",
		ui_pos = {x = 1, y = 2},
		color = "45FF0B",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 5)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"void", void = {
		name = "Void",
		row = 10,
		card_key = "Vo",
		ui_pos = {x = 2, y = 2},
		color = "194682",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 6)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"heart", heart = {
		name = "Heart",
		row = 11,
		card_key = "He",
		ui_pos = {x = 3, y = 2},
		color = "FF0097",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 7)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"hope", hope = {
		name = "Hope",
		row = 12,
		card_key = "Ho",
		ui_pos = {x = 0, y = 3},
		color = "F2DBA5",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 8)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"space", space = {
		name = "Space",
		row = 13,
		card_key = "Sp",
		ui_pos = {x = 1, y = 3},
		color = "C4F06E",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 9)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"blood", blood = {
		name = "Blood",
		row = 14,
		card_key = "Bl",
		ui_pos = {x = 2, y = 3},
		color = "FF0000",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 10)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"doom", doom = {
		name = "Doom",
		row = 15,
		card_key = "Do",
		ui_pos = {x = 3, y = 3},
		color = "2F7820",
		center_override = function(self, _center, _front)
			balatrostruck_center_override(self, _center, _front, 11)
		end,
		load_check = function()
			return Balatrostuck ~= nil
		end
	},
	"pickaxes", pickaxes = {
		name = "Pickaxes",
		row = 16,
		card_key = "PA",
		ui_pos = {x = 0, y = 4},
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
		center_override = stone_center_override
	},
}
	
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
}
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