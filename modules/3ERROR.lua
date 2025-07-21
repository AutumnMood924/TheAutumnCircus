local prestiges = {
	"prestige_xchips", prestige_xchips = {
		config = {
			immutable = {
				base_amount = 0.1,
			},
			extra = {
				scale_amount = 0.1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'scaler_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, card.ability.extra.scale_amount } }
			return {vars = { 
				G.GAME.Prestiges and G.GAME.Prestiges["c_thac_prestige_xchips"] or card.ability.immutable.base_amount, 
				card.ability.extra.scale_amount 
			}}
		end,
		use = function(self, card, area, copier)
			local value = scaler_keyword(card, "c_thac_prestige_xchips")
			G.GAME.PrestigeValues.xchips_extra = G.GAME.PrestigeValues.xchips_extra + value
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("zeroError"))
			) and true
		end,
	},
	"prestige_dollar_eor", prestige_dollar_eor = {
		config = {
			extra = {
				amount = 1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            --info_queue[#info_queue+1] = {key = 'scaler_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, card.ability.extra.scale_amount } }
			return {vars = { 
				--G.GAME.Prestiges and G.GAME.Prestiges["c_thac_prestige_xchips"] or card.ability.immutable.base_amount, 
				card.ability.extra.amount 
			}}
		end,
		use = function(self, card, area, copier)
			--local value = scaler_keyword(card, "c_thac_prestige_xchips")
			G.GAME.PrestigeValues.dollar_eor = G.GAME.PrestigeValues.dollar_eor + card.ability.extra.amount
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("zeroError"))
			) and true
		end,
	},
	"prestige_numerator", prestige_numerator = {
		config = {
			immutable = {
				base_amount = 0.1,
			},
			extra = {
				scale_amount = 0.1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'scaler_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, card.ability.extra.scale_amount } }
			return {vars = { 
				G.GAME.Prestiges and G.GAME.Prestiges["c_thac_prestige_numerator"] or card.ability.immutable.base_amount, 
				card.ability.extra.scale_amount 
			}}
		end,
		use = function(self, card, area, copier)
			local value = scaler_keyword(card, "c_thac_prestige_numerator")
			G.GAME.PrestigeValues.numerator_extra = G.GAME.PrestigeValues.numerator_extra + value
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("zeroError"))
			) and true
		end,
	},
	"prestige_denominator", prestige_denominator = {
		config = {
			immutable = {
				base_amount = 0.4,
			},
			extra = {
				scale_amount = 0.1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'scaler_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, card.ability.extra.scale_amount } }
			return {vars = { 
				G.GAME.Prestiges and G.GAME.Prestiges["c_thac_prestige_denominator"] or card.ability.immutable.base_amount, 
				card.ability.extra.scale_amount 
			}}
		end,
		use = function(self, card, area, copier)
			local value = scaler_keyword(card, "c_thac_prestige_denominator")
			G.GAME.PrestigeValues.denominator_extra = G.GAME.PrestigeValues.denominator_extra - value
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("zeroError"))
			) and true
		end,
	},
	"prestige_ante", prestige_ante = {
		config = {
			extra = {
				amount = 1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
			local cooldown = G.GAME.PrestigeCooldowns and G.GAME.PrestigeCooldowns["c_thac_prestige_ante"] or 1
			local coolnow = G.GAME.Prestiges["c_thac_prestige_ante"]
			if coolnow ~= nil then
				info_queue[#info_queue+1] = {key = "prestige_ante_effect", set="Other"}
				return {
					key = card.config.center.key.."_cd",
					vars = {
						coolnow,
						coolnow == 1 and "" or "s",
					},
				}
			end
            info_queue[#info_queue+1] = {key = 'cooldown_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, cooldown } }
			return {vars = { 
				card.ability.extra.amount,
				cooldown
			}}
		end,
		use = function(self, card, area, copier)
			local doit = cooldown_keyword(card, "c_thac_prestige_ante")
			if doit then
				ease_ante(-card.ability.extra.amount)
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("zeroError"))
			) and true
		end,
	},
	"prestige_hand", prestige_hand = {
		config = {
			extra = {
				amount = 1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
			local cooldown = G.GAME.PrestigeCooldowns and G.GAME.PrestigeCooldowns["c_thac_prestige_hand"] or 1
			local coolnow = G.GAME.Prestiges["c_thac_prestige_hand"]
			if coolnow ~= nil then
				info_queue[#info_queue+1] = {key = "prestige_hand_effect", set="Other"}
				return {
					key = card.config.center.key.."_cd",
					vars = {
						coolnow,
						coolnow == 1 and "" or "s",
					},
				}
			end
            info_queue[#info_queue+1] = {key = 'cooldown_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, cooldown } }
			return {vars = { 
				card.ability.extra.amount,
				cooldown
			}}
		end,
		use = function(self, card, area, copier)
			local doit = cooldown_keyword(card, "c_thac_prestige_hand")
			if doit then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.amount
				ease_hands_played(card.ability.extra.amount)
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("zeroError"))
			) and true
		end,
	},
	"prestige_discard", prestige_discard = {
		config = {
			extra = {
				amount = 1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
			local cooldown = G.GAME.PrestigeCooldowns and G.GAME.PrestigeCooldowns["c_thac_prestige_discard"] or 1
			local coolnow = G.GAME.Prestiges["c_thac_prestige_discard"]
			if coolnow ~= nil then
				info_queue[#info_queue+1] = {key = "prestige_discard_effect", set="Other"}
				return {
					key = card.config.center.key.."_cd",
					vars = {
						coolnow,
						coolnow == 1 and "" or "s",
					},
				}
			end
            info_queue[#info_queue+1] = {key = 'cooldown_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, cooldown } }
			return {vars = { 
				card.ability.extra.amount,
				cooldown
			}}
		end,
		use = function(self, card, area, copier)
			local doit = cooldown_keyword(card, "c_thac_prestige_discard")
			if doit then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.amount
				ease_discard(card.ability.extra.amount)
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("zeroError"))
			) and true
		end,
	},
	"prestige_emult", prestige_emult = {
		config = {
			immutable = {
				base_amount = 0.05,
			},
			extra = {
				scale_amount = 0.01,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'scaler_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, card.ability.extra.scale_amount } }
			return {vars = { 
				G.GAME.Prestiges and G.GAME.Prestiges["c_thac_prestige_emult"] or card.ability.immutable.base_amount, 
				card.ability.extra.scale_amount 
			}}
		end,
		use = function(self, card, area, copier)
			local value = scaler_keyword(card, "c_thac_prestige_emult")
			G.GAME.PrestigeValues.emult_extra = G.GAME.PrestigeValues.emult_extra + value
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("Cryptid"))
				-- TODO: add other echips
			) and true
		end,
	},
	"prestige_echips", prestige_echips = {
		config = {
			immutable = {
				base_amount = 0.05,
			},
			extra = {
				scale_amount = 0.01,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'scaler_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, card.ability.extra.scale_amount } }
			return {vars = { 
				G.GAME.Prestiges and G.GAME.Prestiges["c_thac_prestige_echips"] or card.ability.immutable.base_amount, 
				card.ability.extra.scale_amount 
			}}
		end,
		use = function(self, card, area, copier)
			local value = scaler_keyword(card, "c_thac_prestige_echips")
			G.GAME.PrestigeValues.echips_extra = G.GAME.PrestigeValues.echips_extra + value
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("Cryptlib")) or
				next(SMODS.find_mod("pta_saka"))
				-- TODO: add other echips
			) and true
		end,
	},
	"prestige_ascension", prestige_ascension = {
		config = {
			extra = {
				amount = 1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
			local cooldown = G.GAME.PrestigeCooldowns and G.GAME.PrestigeCooldowns["c_thac_prestige_ascension"] or 1
			local coolnow = G.GAME.Prestiges["c_thac_prestige_ascension"]
			if coolnow ~= nil then
				info_queue[#info_queue+1] = {key = "prestige_ascension_effect", set="Other"}
				return {
					key = card.config.center.key.."_cd",
					vars = {
						coolnow,
						coolnow == 1 and "" or "s",
					},
				}
			end
            info_queue[#info_queue+1] = {key = 'cooldown_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, cooldown } }
			return {vars = { 
				card.ability.extra.amount,
				cooldown
			}}
		end,
		use = function(self, card, area, copier)
			local doit = cooldown_keyword(card, "c_thac_prestige_ascension")
			if doit then
				G.GAME.PrestigeValues.ascension_extra = G.GAME.PrestigeValues.ascension_extra + card.ability.extra.amount
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("entr"))
			) and true
		end,
	},
	"prestige_energy", prestige_energy = {
		config = {
			extra = {
				amount = 1,
			},
		},
		pos = { x = 0, y = 0 },
		soul_pos = { x = 1, y = 0 },
		cost = 4,
		loc_vars = function(_c, info_queue, card) 
			local cooldown = G.GAME.PrestigeCooldowns and G.GAME.PrestigeCooldowns["c_thac_prestige_energy"] or 1
			local coolnow = G.GAME.Prestiges["c_thac_prestige_energy"]
			if coolnow ~= nil then
				info_queue[#info_queue+1] = {key = "prestige_energy_effect", set="Other"}
				return {
					key = card.config.center.key.."_cd",
					vars = {
						coolnow,
						coolnow == 1 and "" or "s",
					},
				}
			end
            info_queue[#info_queue+1] = {key = 'cooldown_explainer', set = 'Other', specific_vars = { localize{key=card.config.center.key, set="Prestige", type="name_text"}, cooldown } }
			return {vars = { 
				card.ability.extra.amount,
				cooldown
			}}
		end,
		use = function(self, card, area, copier)
			local doit = cooldown_keyword(card, "c_thac_prestige_energy")
			if doit then
				G.GAME.energy_plus = (G.GAME.energy_plus or 0) + card.ability.extra.amount
			end
		end,
		can_use = function(self, card, area, copier)
			return true
		end,
		load_check = function()
			return (
				next(SMODS.find_mod("Pokermon"))
			) and true
		end,
	},
}

-- increase score yummy
local alias__SMODS_calculate_individual_effect = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
	
	if (key == "x_chips" or key == "xchips" or key == "Xchip_mod") then
		amount = amount + G.GAME.PrestigeValues.xchips_extra
	end
	
	if (key == "e_mult" or key == "emult" or key == "Emult_mod") then
		amount = amount + G.GAME.PrestigeValues.emult_extra
	end
	
	if (key == "e_chips" or key == "echips" or key == "Echip_mod") then
		amount = amount + G.GAME.PrestigeValues.echips_extra
	end
	
	return alias__SMODS_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end

-- apply probability effects
local alias__SMODS_get_probability_vars = SMODS.get_probability_vars
SMODS.get_probability_vars = function(trigger_obj, base_numerator, base_denominator, identifier, from_roll)
	local ret = {alias__SMODS_get_probability_vars(trigger_obj, base_numerator, base_denominator, identifier, from_roll)}
	ret[1] = (ret[1] or 0) + (G.GAME.PrestigeValues.numerator_extra or 0)
	ret[2] = (ret[2] or 0) + (G.GAME.PrestigeValues.denominator_extra or 0)
	return ret[1], ret[2]
end

-- do this the hard way because lovely no worky???
local alias__create_UIBox_current_prestige = create_UIBox_current_prestige
function create_UIBox_current_prestige(simple)
	local ret = alias__create_UIBox_current_prestige(simple)
	
	local hands = ret.nodes[1].nodes
	local thunk = hands[1]
	hands[1] = hands[2]
	hands[2] = thunk
	thunk = hands[3]
	hands[#hands+1] = create_UIBox_current_prestige_row("xchips_extra", "c_thac_prestige_xchips", 0.1, darken(G.C.CHIPS, 0.2))
	hands[3] = hands[#hands]
	hands[#hands] = thunk
	if next(SMODS.find_mod("Cryptlib")) or next(SMODS.find_mod("pta_saka")) then
		hands[#hands+1] = create_UIBox_current_prestige_row("echips_extra", "c_thac_prestige_echips", 0.05, lighten(G.C.CHIPS, 0.2))
		hands[#hands+1] = create_UIBox_current_prestige_row("emult_extra", "c_thac_prestige_emult", 0.05, lighten(G.C.MULT, 0.2))
	end
	if next(SMODS.find_mod("entr")) then
		hands[#hands+1] = create_UIBox_current_prestige_row("ascension_extra", "c_thac_prestige_ascension", 1, darken(G.C.GOLD, 0.1))
		-- this doesn't scale
		hands[#hands].nodes[3].nodes[1].config.text = "+1"
	end
	hands[#hands+1] = create_UIBox_current_prestige_row("dollar_eor", "c_thac_prestige_dollar_eor", 1, darken(G.C.MONEY, 0.1))
	
	hands[#hands+1] = create_UIBox_current_prestige_row("numerator_extra", "c_thac_prestige_numerator", 0.1, lighten(G.C.GREEN, 0.2))
	if G.GAME.PrestigeValues["numerator_extra"] >= 0 then
		hands[#hands].nodes[2].nodes[1].nodes[1].config.text = "+"..G.GAME.PrestigeValues["numerator_extra"]
	end
	hands[#hands+1] = create_UIBox_current_prestige_row("denominator_extra", "c_thac_prestige_denominator", 0.4, darken(G.C.GREEN, 0.2))
	if G.GAME.PrestigeValues["denominator_extra"] == 0 then
		hands[#hands].nodes[2].nodes[1].nodes[1].config.text = "-"..G.GAME.PrestigeValues["denominator_extra"]
	elseif G.GAME.PrestigeValues["denominator_extra"] > 0 then
		-- how??????
		hands[#hands].nodes[2].nodes[1].nodes[1].config.text = "+"..G.GAME.PrestigeValues["denominator_extra"]
	end
	hands[#hands].nodes[3].nodes[1].config.text = "-"..(G.GAME.Prestiges and G.GAME.Prestiges["c_thac_prestige_denominator"] or 0.4)
	
	local new_hands = {}
	
	for i=1, math.ceil(#hands/2) do
		local new_hand = {n=G.UIT.R, config={align = "cm", r = 0.1}, nodes={}}
		for ii=1, 2 do
			if not hands[i*2 - math.floor(2/ii) + 1] then break end
			hands[i*2 - math.floor(2/ii) + 1].n = G.UIT.C
			hands[i*2 - math.floor(2/ii) + 1].config.align = ii == 1 and "cl" or "cm"
			new_hand.nodes[#new_hand.nodes+1] = hands[i*2 - math.floor(2/ii) + 1]
		end
		new_hands[#new_hands+1] = new_hand
	end
	
	ret.nodes[1].nodes = new_hands
	
	return ret
end

SMODS.Atlas{
	key = "3ERROR",
	path = "3ERROR.png",
	px = 71,
	py = 95,
}

--prestiges
for _, k in ipairs(prestiges) do
	local v = prestiges[k]
	if not v.rarity then v.rarity = 1 end
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Prestige", key = k, atlas = "3ERROR"})
end