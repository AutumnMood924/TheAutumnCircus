
local vouchers = {
	"spectral_merchant", spectral_merchant = {
		config = {
			extra = 4.8/4,
		},
		pos = { x = 0, y = 0 },
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		redeem = function(self, center)
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.spectral_rate = 4*self.config.extra
				return true end }))
		end,
	},
	"spectral_tycoon", spectral_tycoon = {
		config = {
			extra = 9.6/4,
			extra_disp = 2
		},
		pos = { x = 1, y = 0 },
		requires = {'v_thac_spectral_merchant'},
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { _c.config.extra_disp }} end,
		redeem = function(self, center)
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.spectral_rate = 4*self.config.extra
				return true end }))
		end,
	},
	"stamp_savvy", stamp_savvy = {
		config = {
		},
		pos = { x = 2, y = 0 },
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		redeem = function(self, center)
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps
		end,
	},
	"stamp_coupon", stamp_coupon = {
		config = {
		},
		pos = { x = 3, y = 0 },
		requires = {'v_thac_stamp_savvy'},
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {  }} end,
		redeem = function(self, center)
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.jokerstamps
		end,
	},
	"oddity_merchant", oddity_merchant = {
		config = {
			extra = 9.6/4,
			extra_disp = 2
		},
		pos = { x = 4, y = 0 },
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { _c.config.extra_disp }} end,
		redeem = function(self, center)
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.oddity_rate = OddityAPI.config.base_shop_rate*self.config.extra
				return true end }))
		end,
		load_check = function()
			return OddityAPI ~= nil
		end,
	},
	"oddity_tycoon", oddity_tycoon = {
		config = {
			extra = 19.2/4,
			extra_disp = 4
		},
		pos = { x = 5, y = 0 },
		requires = {'v_thac_oddity_merchant'},
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { _c.config.extra_disp }} end,
		redeem = function(self, center)
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.oddity_rate = OddityAPI.config.base_shop_rate*self.config.extra
				return true end }))
		end,
		load_check = function()
			return OddityAPI ~= nil
		end,
	},
	"wheel_of_wheel_of_fortune", wheel_of_wheel_of_fortune = {
		config = {
			extra = {
				odds = 4
			},
		},
		pos = { x = 6, y = 0 },
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS['c_wheel_of_fortune']
			return {vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
			}}
		end,
		redeem = function(self)
			G.GAME.wheel_of_wheel_of_fortune = true
		end,
	},
	"ceaseless_wheel", ceaseless_wheel = {
		boxes = { 2, 3, 3 },
		config = {
			extra = {
				odds = 4,
			},
		},
		pos = { x = 7, y = 0 },
		requires = {'v_thac_wheel_of_wheel_of_fortune'},
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			info_queue[#info_queue+1] = G.P_CENTERS['v_thac_wheel_of_wheel_of_fortune']
			return {vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
			}}
		end,
		redeem = function(self)
			G.GAME.ceaseless_wheel = true
		end,
	},
	"plus_four", plus_four = {
		config = {
			extra = {
				mult = 4
			},
		},
		pos = { x = 8, y = 0 },
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.mult }}
		end,
		calculate = function(self, card, context)
			if context.joker_main then return {mult = card.ability.extra.mult} end
		end,
	},
	"x_four", x_four = {
		config = {
			extra = {
				Xmult = 4
			}
		},
		pos = { x = 9, y = 0 },
		requires = {'v_thac_plus_four'},
		loc_vars = function(_c, info_queue, card) 
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra.Xmult }}
		end,
		calculate = function(self, card, context)
			if context.joker_main then return {xmult = card.ability.extra.Xmult} end
		end,
	},
	"limit_breaker", limit_breaker = {
		config = {
			extra = {
				limit = 1,
			},
		},
		pos = { x = 0, y = 1 },
		loc_vars = function(_c, info_queue, card)
			return {vars = {card.ability.extra.limit}}
		end,
		redeem = function(self, card)
			SMODS.change_play_limit(card.ability.extra.limit)
			SMODS.change_discard_limit(card.ability.extra.limit)
		end,
	},
	"transcendant", transcendant = {
		config = {
			extra = {
				limit = 1,
			},
		},
		pos = { x = 1, y = 1 },
		requires = {'v_thac_limit_breaker'},
		loc_vars = function(_c, info_queue, card)
			return {vars = {card.ability.extra.limit}}
		end,
		redeem = function(self, card)
			SMODS.change_play_limit(card.ability.extra.limit)
			SMODS.change_discard_limit(card.ability.extra.limit)
		end,
	},
}
SMODS.Atlas{
	key = "VouchMe",
	path = "VouchMe.png",
	px = 71,
	py = 95,
}

--vouchers
for _, k in ipairs(vouchers) do
	local v = vouchers[k]
	TheAutumnCircus.data.buffer_insert("Vouchers", v, {key = k, atlas = "VouchMe"})
end