-- not much here yet
local data = {}

-- This one's used for random seal assignment
-- Chance checks this to avoid putting these seals on playing cards
data.joker_stamps = {
}

data.flush_functions = {
}

data.BUFFERS = {
	Jokers = {},
	Consumables = {},
	Seals = {},
	Stamps = {},
	Vouchers = {},
	Enhancements = {},
	Decks = {},
	HandParts = {},
	Hands = {},
	Suits = {},
	DeckSkins = {},
	Blinds = {},
	Shaders = {},
	Editions = {},
	Tags = {},
	Aspects = {},
}

data.buffer_register_funcs = {
	Jokers = function(v)
		if not (TheAutumnCircus.config.enabled_jokers[v.key] == false) and ((not v.load_check) or v.load_check()) then
			local a = "j_"..TheAutumnCircus.mod_prefix.."_"..v.key
			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					text = v.text,
					boxes = v.boxes
				}
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
					text = v.text,
					boxes = v.boxes
				}
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
					text = v.text,
					boxes = v.boxes
				}
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
					text = v.text,
					boxes = v.boxes
				}
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
					text = v.text,
					boxes = v.boxes
				}
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
	HandParts = function(v)
		if (not v.load_check) or v.load_check() then			
			SMODS.PokerHandPart(v)
		end
	end,
	Hands = function(v)
		if not (TheAutumnCircus.config.enabled_hands[v.key] == false) and ((not v.load_check) or v.load_check()) then			
			if not v.loc_txt then
				v.loc_txt = {
					name = v.display_name or v.name,
					description = v.text
				}
			end
			
			SMODS.PokerHand(v)
		end
	end,
	Suits = function(v)
		if not (TheAutumnCircus.config.enabled_suits[v.key] == false) and ((not v.load_check) or v.load_check()) then
			if not v.lc_atlas then v.lc_atlas = v.atlas end
			if not v.hc_atlas then v.hc_atlas = v.atlas end
			if not v.lc_ui_atlas then v.lc_ui_atlas = v.ui_atlas end
			if not v.hc_ui_atlas then v.hc_ui_atlas = v.ui_atlas end
			if not v.colour then v.colour = v.color end
			if not v.lc_colour then v.lc_colour = v.colour end
			if not v.hc_colour then v.hc_colour = v.colour end
			if not v.pos then v.pos = {y = v.row} end
			if not v.loc_txt then v.loc_txt = {name = v.name, plural = v.name, singular = v.name:sub(1,-1)} end
			SMODS.Suit(v)
		end
	end,
	DeckSkins = function(v)
		if not (TheAutumnCircus.config.enabled_deckskins[v.key] == false) and ((not v.load_check) or v.load_check()) then
			if not v.lc_atlas then v.lc_atlas = v.atlas end
			if not v.posStyle then v.posStyle = 'suit' end
			if not v.loc_txt then v.loc_txt = v.name end
			SMODS.DeckSkin(v)
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
					text = v.text,
					boxes = v.boxes
				}
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
}

function data.buffer_insert(buffer, object, extra)
	if extra then
		for k, v in pairs(extra) do
			object[k] = v
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