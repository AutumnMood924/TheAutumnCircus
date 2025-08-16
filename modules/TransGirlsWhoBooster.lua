
local boosters = {
	'option_select', option_select = {
		config = {
			extra = 3,
			choose = 1,
		},
		kind = "Option Select",
		group_key = "k_thac_option_select",
		pos = { x = 0, y = 0 },
		cost = 13,
		weight = 0.1225,
		draw_hand = true,
		loc_vars = function(self, info_queue, card)
            if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = { card.ability.extra, card.ability.choose, colours = {HEX('FFF200'), HEX('FFAEC9')}}}
		end,
		thac_cardmapping = {
			{"c_emperor", {}},
			{"c_high_priestess", {}},
			{"c_thac_scry", {}},
			{"c_judgement", {}},
			{"c_poke_pokeball", {"Pokermon"}},
			{"c_cry_trade", {"Cryptid"}},
			--{"c_mf_white", {"MoreFluff"}},
			{"c_akyrs_umbral_book_smart", {"aikoyorisshenanigans"}},
		},
		--select_card = "consumeables",
		thac_cardmap = {},
		thac_handlecard = function(self, key)
			local pseed = "thac_option_select"
			if key == "c_emperor" then
				if pseudorandom(pseed) < 0.03 then
					return "c_thac_quest_bed"
				end
				if pseudorandom(pseed) < 0.025 and next(SMODS.find_mod("GrabBag")) then
					return "c_gb_awaken"
				end
				if pseudorandom(pseed) < 0.0999 and next(SMODS.find_mod("RevosVault")) then
					return "c_crv_supemperor"
				end
				if pseudorandom(pseed) < 0.45 and next(SMODS.find_mod("MoreFluff")) then
					return "c_mf_rot_emperor"
				end
			end
			if key == "c_high_priestess" then
				if pseudorandom(pseed) < 0.025 then
					return "c_black_hole"
				end
				if pseudorandom(pseed) < 0.015 and next(SMODS.find_mod("entr")) then
					return "c_entr_quasar"
				end
				if pseudorandom(pseed) < 0.025 and next(SMODS.find_mod("Cryptid")) then
					return "c_cry_white_hole"
				end
				if pseudorandom(pseed) < 0.015 and next(SMODS.find_mod("Cryptid")) and next(SMODS.find_mod("entr")) then
					return "c_entr_pulsar"
				end
				if pseudorandom(pseed) < 0.033 and next(SMODS.find_mod("allinjest")) then
					return "c_aij_pulsar"
				end
				if pseudorandom(pseed) < 0.033 and next(SMODS.find_mod("allinjest")) then
					return "c_aij_gravastar"
				end
				if pseudorandom(pseed) < 0.0999 and next(SMODS.find_mod("RevosVault")) then
					return "c_crv_suppriestess"
				end
				if pseudorandom(pseed) < 0.45 and next(SMODS.find_mod("MoreFluff")) then
					return "c_mf_rot_high_priestess"
				end
			end
			if key == "c_thac_scry" then
				if pseudorandom(pseed) < 0.015 and next(SMODS.find_mod("entr")) then
					return "c_entr_desire"
				end
			end
			if key == "c_judgement" then
				if pseudorandom(pseed) < 0.025 then
					return "c_soul"
				end
				if pseudorandom(pseed) < 0.015 and next(SMODS.find_mod("entr")) then
					return "c_entr_fervour"
				end
				if pseudorandom(pseed) < 0.04 and next(SMODS.find_mod("VISIBILITY")) then
					return "c_vis_hamsa"
				end
				if pseudorandom(pseed) < 0.025 and next(SMODS.find_mod("finity")) then
					return "c_finity_finity"
				end
				if pseudorandom(pseed) < 0.00666 and next(SMODS.find_mod("Cryptid")) then
					return "c_cry_gateway"
				end
				if pseudorandom(pseed) < 0.00333 and next(SMODS.find_mod("Cryptid")) and next(SMODS.find_mod("entr")) then
					return "c_entr_beyond"
				end
				if pseudorandom(pseed) < 0.001 and next(SMODS.find_mod("RevosVault")) then
					return "c_crv_chaoticsol"
				end
				if pseudorandom(pseed) < 0.001 and next(SMODS.find_mod("vallkarri")) then
					return "c_valk_freeway"
				end
				if pseudorandom(pseed) < 0.01225 and next(SMODS.find_mod("pta_saka")) then
					return "c_payasaka_gacha"
				end
				if pseudorandom(pseed) < 0.0777 and next(SMODS.find_mod("pta_saka")) then
					return "c_payasaka_center"
				end
				if pseudorandom(pseed) < 0.0999 and next(SMODS.find_mod("RevosVault")) then
					return "c_crv_supjudgement"
				end
				if pseudorandom(pseed) < 0.0999 and next(SMODS.find_mod("RevosVault")) then
					return "c_crv_supwraith"
				end
				if pseudorandom(pseed) < 0.45 and next(SMODS.find_mod("MoreFluff")) then
					return "c_mf_rot_judgement"
				end
			end
			if key == "c_poke_pokeball" then
				if pseudorandom(pseed) < 0.025 then
					return "c_poke_masterball"
				end
				if pseudorandom(pseed) < 0.075 then
					return "c_poke_ultraball"
				end
				if pseudorandom(pseed) < 0.25 then
					return "c_poke_greatball"
				end
			end
			if key == "c_cry_trade" then
				if pseudorandom(pseed) < 0.00001 then
					return "c_cry_pointer"
				end
			end
			if key == "c_mf_white" then
				if pseudorandom(pseed) < 0.025 and next(SMODS.find_mod("entr")) then
					return "c_mf_circle"
				end
			end
			return key
		end,
		create_card = function(self, card, i)
			local new_card_key = self:thac_handlecard(self.thac_cardmap[i])
			local new_card = SMODS.create_card{
				key = new_card_key,
				area = G.pack_cards,
				type = "Consumable",
			}
			new_card.children.particles:remove()
			return new_card
		end,
		particles = function(self)
			G.booster_pack_sparkles = Particles(1, 1, 0,0, {
				timer = 0.0001225,
				scale = 0.1225,
				initialize = true,
				lifespan = 1.1495,
				speed = 0.666,
				padding = -1,
				attach = G.ROOM_ATTACH,
				colours = {HEX('bd1864'), HEX('46fbc4'), HEX('00164F'), HEX('00164F'), HEX('00164F'), HEX('00164F'), HEX('00164F'), HEX('00164F')},
				fill = true
			})
			G.booster_pack_sparkles.fade_alpha = 1
			G.booster_pack_sparkles:fade(1, 0)
		end,
		ease_background_colour = function(self)
			ease_colour(G.C.DYN_UI.MAIN, HEX('FFF200'))
			ease_background_colour{new_colour = HEX('000000'), special_colour = HEX('FFFFFF'), contrast = 6}
		end,
		load_check = function(self)
			--finally doing something fancy with this
			for k,v in ipairs(self.thac_cardmapping) do
				local doit = true
				for _, modid in ipairs(v[2]) do
					if not next(SMODS.find_mod(modid)) then doit = false end
				end
				if doit then self.thac_cardmap[#self.thac_cardmap+1] = v[1] end
			end
			self.config.extra = #self.thac_cardmap
			self.config.choose = math.max(1,math.ceil(self.config.extra / 4))
			
			return true
		end,
	},
}

SMODS.Atlas{
	key = "TransGirlsWhoBooster",
	path = "TransGirlsWhoBooster.png",
	px = 71,
	py = 95,
}

--boosters
for _, k in ipairs(boosters) do
	local v = boosters[k]
	TheAutumnCircus.data.buffer_insert("Boosters", v, {key = k, atlas = "TransGirlsWhoBooster"})
end