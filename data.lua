-- not much here yet
local data = {}

-- This one's used for random seal assignment
-- Chance checks this to avoid putting these seals on playing cards
data.joker_stamps = {
}
-- this can be done better probably
for k, v in pairs(TheAutumnCircus.config.enabled_seals) do
	if v then
		table.insert(data.joker_stamps, k:sub(1,1):upper()..k:sub(2))
	end
end

data.BUFFERS = {
	Jokers = {},
	Tarots = {},
	Planets = {},
	Spectrals = {},
	Seals = {},
	Vouchers = {},
}

data.buffer_register_funcs = {
	Jokers = function(v)
	end,
	Tarots = function(v)
		if TheAutumnCircus.config.enabled_tarots[v.key] and ((not v.load_check) or v.load_check()) then
			local a = "c_"..TheAutumnCircus.mod_prefix..v.key
			SMODS.Tarot:new(v.name, TheAutumnCircus.mod_prefix..v.key, v.config, v.pos, { name = v.display_name or v.name, text = v.text }, v.cost or 3, v.cost_mult or 1.0, v.effect, true, true, v.atlas):register()
			if v.loc_def then SMODS.Tarots[a].loc_def = v.loc_def end
			if v.use then SMODS.Tarots[a].use = v.use end
			if v.can_use then SMODS.Tarots[a].can_use = v.can_use end
			if v.set_badges then SMODS.Tarots[a].set_badges = v.set_badges end
			if v.calculate then SMODS.Tarots[a].calculate = v.calculate end
			if v.update then SMODS.Tarots[a].update = v.update end
		end
	end,
	Planets = function(v)
		if TheAutumnCircus.config.enabled_planets[v.key] and ((not v.load_check) or v.load_check()) then
			local a = "c_"..TheAutumnCircus.mod_prefix..v.key
			SMODS.Planet:new(v.name, TheAutumnCircus.mod_prefix..v.key, v.config, v.pos, { name = v.display_name or v.name, text = v.text }, v.cost or 3, v.cost_mult or 1.0, v.effect, 1, true, true, v.atlas):register()
			if v.loc_def then SMODS.Planets[a].loc_def = v.loc_def end
			if v.use then SMODS.Planets[a].use = v.use end
			if v.can_use then SMODS.Planets[a].can_use = v.can_use end
			if v.set_badges then SMODS.Planets[a].set_badges = v.set_badges end
			if v.calculate then SMODS.Planets[a].calculate = v.calculate end
			if v.update then SMODS.Planets[a].update = v.update end
		end
	end,
	Spectrals = function(v)
		if TheAutumnCircus.config.enabled_spectrals[v.key] and ((not v.load_check) or v.load_check()) then
			local a = "c_"..TheAutumnCircus.mod_prefix..v.key
			SMODS.Spectral:new(v.name, TheAutumnCircus.mod_prefix..v.key, v.config, v.pos, { name = v.display_name or v.name, text = v.text }, v.cost or 4, true, true, v.atlas):register()
			if v.loc_def then SMODS.Spectrals[a].loc_def = v.loc_def end
			if v.use then SMODS.Spectrals[a].use = v.use end
			if v.can_use then SMODS.Spectrals[a].can_use = v.can_use end
			if v.set_badges then SMODS.Spectrals[a].set_badges = v.set_badges end
			if v.calculate then SMODS.Spectrals[a].calculate = v.calculate end
			if v.update then SMODS.Spectrals[a].update = v.update end
		end
	end,
	Seals = function(v)
		if TheAutumnCircus.config.enabled_seals[v.key] and ((not v.load_check) or v.load_check()) then
			local a = string.lower(v.name)..'_seal'
			SMODS.Seal:new(v.name, a, v.full_name, v.pos, { name = v.full_name, text = v.text }, v.atlas, true, HEX(v.color)):register()
			if v.loc_def then SMODS.Seals[a].loc_def = v.loc_def end
			if v.apply then SMODS.Seals[a].apply = v.apply end
			if v.unapply then SMODS.Seals[a].unapply = v.unapply end
			if v.deck_add then SMODS.Seals[a].deck_add = v.deck_add end
			if v.deck_remove then SMODS.Seals[a].deck_remove = v.deck_remove end
		end
	end,
	Vouchers = function(v)
		if TheAutumnCircus.config.enabled_vouchers[v.key] and ((not v.load_check) or v.load_check()) then
			local a = "v_"..TheAutumnCircus.mod_prefix..v.key
			SMODS.Voucher:new(v.name, TheAutumnCircus.mod_prefix..v.key, v.config, v.pos, { name = v.display_name or v.name, text = v.text }, v.cost or 10, true, true, true, v.requires, v.atlas):register()
			if v.loc_def then SMODS.Vouchers[a].loc_def = v.loc_def end
			if v.redeem then SMODS.Vouchers[a].redeem = v.redeem end
			if v.set_badges then SMODS.Vouchers[a].set_badges = v.set_badges end
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