
local vouchers = {
	spectral_merchant = {
		name = "Spectral Merchant",
		text = {
			"{C:spectral}Spectral{} cards appear",
			"in the shop"
		},
		config = {
			extra = 4.8/4,
		},
		pos = { x = 0, y = 0 },
		loc_def = function(_c) return {  } end,
		redeem = function(center)
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.spectral_rate = 4*center.extra
				return true end }))
		end,
	},
	spectral_tycoon = {
		name = "Spectral Tycoon",
		text = {
			"{C:spectral}Spectral{} cards appear",
			"{C:attention}#1#X{} more frequently",
			"in the shop"
		},
		config = {
			extra = 9.6/4,
			extra_disp = 2
		},
		pos = { x = 1, y = 0 },
		requires = {'v_Thac_spectral_merchant'},
		loc_def = function(_c) return { _c.config.extra_disp } end,
		redeem = function(center)
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.spectral_rate = 4*center.extra
				return true end }))
		end,
	},
	stamp_savvy = {
		name = "Stamp Savvy",
		text = {
			"{C:attention}Jokers{} can appear","with special {C:attention}stamps{}",
		},
		config = {
		},
		pos = { x = 2, y = 0 },
		loc_def = function(_c) return {  } end,
		redeem = function(center)
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps
		end,
	},
	stamp_coupon = {
		name = "Stamp Coupon",
		text = {
			"{C:attention}Jokers{} with special {C:attention}stamps{}",
			"cost up to {C:money}$2{} less",
		},
		config = {
		},
		pos = { x = 3, y = 0 },
		requires = {'v_Thac_stamp_savvy'},
		loc_def = function(_c) return {  } end,
		redeem = function(center)
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps
		end,
	},
}

local voucher_codex = {
	'spectral_merchant',
	'spectral_tycoon',
	'stamp_savvy',
	'stamp_coupon',
}



function TheAutumnCircus.INIT.VouchMe()
	
	SMODS.Sprite:new("Thac_VouchMe", TheAutumnCircus.mod.path, "VouchMe.png", 71, 95, "asset_atli"):register();

	--vouchers
	for _, k in ipairs(voucher_codex) do
		local v = vouchers[k]
		TheAutumnCircus.data.buffer_insert("Vouchers", v, {key = k, atlas = "Thac_VouchMe"})
	end

end