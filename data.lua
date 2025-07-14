-- not much here yet
local data = {}

-- This one's used for random seal assignment
-- Chance checks this to avoid putting these seals on playing cards
data.joker_stamps = {
}

data.BUFFERS = {
	Jokers = {},
	Consumables = {},
	Seals = {},
	Stamps = {},
	Vouchers = {},
	Enhancements = {},
	Decks = {},
	Blinds = {},
	Shaders = {},
	Editions = {},
	Tags = {},
	Aspects = {},
	Zodiacs = {},
	Materials = {},
	Recipes = {},
}

data.buffer_register_funcs = {
	Jokers = function(v)
		if not (TheAutumnCircus.config.enabled_jokers[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = "j_"..TheAutumnCircus.mod_prefix.."_"..v.key
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					subtitle = v.subtitle,
					text = v.text,
					boxes = v.boxes
				}
				v.subtitle = nil
			end
			
			SMODS.Joker(v)
		end
	end,
	Consumables = function(v)
		if not (TheAutumnCircus.config.enabled_consumables[v.key] == false) and ((not v.load_check) or v.load_check()) then
			--if v.set == "Oddity" and AMM.api.oddity == nil then return end
			local a = "c_"..TheAutumnCircus.mod_prefix.."_"..v.key
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					subtitle = v.subtitle,
					text = v.text,
					boxes = v.boxes
				}
				v.subtitle = nil
			end
			
			SMODS.Consumable(v)
		end
	end,
	Seals = function(v)
		if not (TheAutumnCircus.config.enabled_seals[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = string.lower(v.name)..'_seal'
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					subtitle = v.subtitle,
					text = v.text,
					boxes = v.boxes
				}
				v.subtitle = nil
			end
			
			SMODS.Seal(v)
		end
	end,
	Stamps = function(v)
		if not (TheAutumnCircus.config.enabled_stamps[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = string.lower(v.name)..'_seal'
			
			if not v.loc_txt then
				v.loc_txt = {
					label = v.display_name or v.name,
					description = {
						name = v.display_name or v.name,
						text = v.text,
						boxes = v.boxes
					}
				}
			end
			
			v.full_name = v.full_name or v.display_name or v.name
			v.colour = v.colour or v.color
			if type(v.colour) == "string" then v.colour = HEX(v.colour) end
			
			SMODS.Stamp(v)
		end
	end,
	Vouchers = function(v)
		if not (TheAutumnCircus.config.enabled_vouchers[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = "v_"..TheAutumnCircus.mod_prefix.."_"..v.key
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					subtitle = v.subtitle,
					text = v.text,
					boxes = v.boxes
				}
				v.subtitle = nil
			end
			
			SMODS.Voucher(v)
		end
	end,
	Enhancements = function(v)
		if not (TheAutumnCircus.config.enabled_enhancements[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = "m_"..TheAutumnCircus.mod_prefix.."_"..v.key
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					subtitle = v.subtitle,
					text = v.text,
					boxes = v.boxes
				}
				v.subtitle = nil
			end
			
			SMODS.Enhancement(v)
		end
	end,
	Decks = function(v)
		if not (TheAutumnCircus.config.enabled_decks[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = "b_"..TheAutumnCircus.mod_prefix.."_"..v.key
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					text = v.text,
					boxes = v.boxes
				}
			end
			
			SMODS.Back(v)
		end
	end,
	Blinds = function(v)
		if not (TheAutumnCircus.config.enabled_blinds[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = "bl_"..TheAutumnCircus.mod_prefix.."_"..v.key
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					text = v.text,
					boxes = v.boxes
				}
			end
			
			SMODS.Blind(v)
		end
	end,
	Shaders = function(v)
		if (not v.load_check) or v.load_check() then
			SMODS.Shader(v)
		end
	end,
	Editions = function(v)
		if not (TheAutumnCircus.config.enabled_editions[v.key] == false) and ((not v.load_check) or v.load_check()) then
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					subtitle = v.subtitle,
					text = v.text,
					boxes = v.boxes
				}
				v.subtitle = nil
			end
			SMODS.Edition(v)
		end
	end,
	Tags = function(v)
		if not (TheAutumnCircus.config.enabled_tags[v.key] == false) and ((not v.load_check) or v.load_check()) then
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					text = v.text,
					boxes = v.boxes
				}
			end
			SMODS.Tag(v)
		end
	end,
	Aspects = function(v)
		if not (TheAutumnCircus.config.enabled_aspects[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = string.lower(v.name)..'_aspect'
			
			if not v.loc_txt then
				v.loc_txt = {
					label = v.display_name or v.name,
					description = {
						name = v.display_name or v.name,
						text = v.text,
						boxes = v.boxes
					}
				}
			end
			
			v.full_name = v.full_name or v.display_name or v.name
			v.colour = v.colour or v.color
			if type(v.colour) == "string" then v.colour = HEX(v.colour) end
			v.badge_colour = v.badge_colour or v.badge_color
			if type(v.badge_colour) == "string" then v.badge_colour = HEX(v.badge_colour) end
			v.badge_text_colour = v.badge_text_colour or v.badge_text_color
			if type(v.badge_text_colour) == "string" then v.badge_text_colour = HEX(v.badge_text_colour) end
			
			AMM.Aspect(v)
		end
	end,
	Zodiacs = function(v)
		if not (TheAutumnCircus.config.enabled_zodiacs[v.key] == false) and ((not v.load_check) or v.load_check()) then
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					text = v.text,
					boxes = v.boxes
				}
			end
			Ortalab.Zodiac(v)
		end
	end,
	Materials = function(v)
		if not (BUB.config.enabled_materials[v.key] == false) and ((not v.load_check) or v.load_check()) then
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					text = v.text,
					boxes = v.boxes
				}
			end
			Yggdrasil.Material(v)
		end
	end,
	Recipes = function(v)
		if not (BUB.config.enabled_recipes[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local m = {}
			m.recipe = {}
			for i=1,#v.recipe do
				m.recipe[i] = v.recipe[i]
			end
			m.config = v.config
			m.card_key = v.card_key
			YggCraftingRecipes[#YggCraftingRecipes+1] = m
		end
	end,
}

local THAC_JoyousSpring = (next(SMODS.find_mod("JoyousSpring")) and AMM.mod.config.joyousspringify) and {
		["helpful_joker"] = { attribute = "LIGHT", monster_type = "Spellcaster", is_tuner = true },
		["dutiful_joker"] = { attribute = "DARK", monster_type = "Spellcaster", is_tuner = true },
		["frivolous_joker"] = { attribute = "LIGHT", monster_type = "Warrior" },
		["groaning_joker"] = { attribute = "FIRE", monster_type = "Warrior", is_tuner = true },
		["lord_of_the_meek"] = { attribute = "EARTH", monster_type = "Warrior" },
		["mirage_joker"] = { attribute = "LIGHT", monster_type = "Illusion" },
		["placeholder_joker"] = { attribute = "DARK", monster_type = "Warrior" },
		["sans"] = { attribute = "DARK", monster_type = "Zombie" },
		["null"] = { attribute = "DIVINE", monster_type = "Cyberse" },
		["clown_posse"] = { attribute = "EARTH", monster_type = "Warrior" },
		["knight_of_heart"] = { attribute = "DARK", monster_type = "Warrior" },
		["witch_of_mind"] = { attribute = "DARK", monster_type = "Spellcaster" },
		["lord_of_void"] = { attribute = "DIVINE", monster_type = "Fiend" },
		["astront"] = { attribute = "LIGHT", monster_type = "Warrior" },
		["torrential"] = { attribute = "WATER", monster_type = "Aqua" },
		["landlord"] = { attribute = "DARK", monster_type = "Warrior" },
		["the_csi"] = { attribute = "DARK", monster_type = "Warrior" },
		["junk_collector"] = { attribute = "EARTH", monster_type = "Warrior" },
		["exorcist"] = { attribute = "LIGHT", monster_type = "Spellcaster" },
		["tombstone"] = { attribute = "DARK", monster_type = "Rock", is_tuner = true },
		["gem_joker"] = { attribute = "LIGHT", monster_type = "Rock", is_tuner = true },
		["discarded_vessel"] = { attribute = "DARK", monster_type = "Warrior", is_tuner = true },
		["jokermancer"] = { attribute = "DARK", monster_type = "Spellcaster" },
		["gravedigger"] = { attribute = "DARK", monster_type = "Warrior" },
		["triplicate_soul"] = { attribute = "DARK", monster_type = "Fairy" },
		["shutin"] = { attribute = "DARK", monster_type = "Warrior" },
		["amalgamiter"] = { attribute = "DARK", monster_type = "Machine" },
		["jack_of_all_trades"] = { attribute = "LIGHT", monster_type = "Warrior" },
		["lunatic_cultist"] = { attribute = "DARK", monster_type = "Spellcaster" },
		["grave_legion"] = { attribute = "DARK", monster_type = "Zombie" },
		["scrapper"] = { attribute = "EARTH", monster_type = "Machine" },
		["hardlyquin"] = { attribute = "DARK", monster_type = "Warrior" },
		["jet_worldmage"] = { attribute = "WATER", monster_type = "Spellcaster" },
		["ruby_sunmage"] = { attribute = "FIRE", monster_type = "Spellcaster" },
		["opal_moonmage"] = { attribute = "WIND", monster_type = "Spellcaster" },
		["topaz_starmage"] = { attribute = "EARTH", monster_type = "Spellcaster" },
		["amethyst_starmage"] = { attribute = "LIGHT", monster_type = "Spellcaster" },
		["onyx_moonmage"] = { attribute = "DARK", monster_type = "Spellcaster" },
		["coven"] = { attribute = "EARTH", monster_type = "Spellcaster" },
		["cartowomancer"] = { attribute = "DARK", monster_type = "BeastWarrior" },
		["rot_cartowomancer"] = { attribute = "DARK", monster_type = "BeastWarrior", is_tuner = true },
	} or nil

function data.buffer_insert(buffer, object, extra)
	if extra then
		for k, v in pairs(extra) do
			if not object[k] then
				object[k] = v
			end
		end
	end
	if THAC_JoyousSpring and THAC_JoyousSpring[object.key] then
		local this_trait = THAC_JoyousSpring[object.key]
		if not object.config then
			object.config = {}
		end
		if type(object.config.extra) == "nil" then
			object.config.extra = {}
		end
		if type(object.config.extra) == "table" and not object.config.extra.joyous_spring then
			object.generate_ui = JoyousSpring.generate_info_ui
			object.config.extra.joyous_spring = JoyousSpring.init_joy_table {
				attribute = this_trait.attribute,
				monster_type = this_trait.monster_type,
				is_tuner = this_trait.is_tuner,
				is_normal = this_trait.is_normal,
			}
		end
	end
	table.insert(data.BUFFERS[buffer], object)
end

-- DO NOT CALL THIS FUNCTION ANY ADDITIONAL TIMES
function data.register_objects()
	for k, v in pairs(data.BUFFERS) do
		for _, i in ipairs(v) do
			data.buffer_register_funcs[k](i)
		end
	end
	data.BUFFERS = nil
end

return data