local enhancements = {
	'bone', bone = {
		name = "bone",
		effect = 'bone',
		config = {
			extra = {
				chips = 6,
			}
		},
		pos = { x = 0, y = 1 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = {
				card.ability.extra and card.ability.extra.chips or 6,
				(card.ability.extra and card.ability.extra.chips or 6) * AMM.api.graveyard.count_cards()
			}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play then
				local gy_cards = AMM.api.graveyard.count_cards()
				if gy_cards == 0 then return end
				return {
					chips = (card.ability.extra and card.ability.extra.chips or 6) * gy_cards
				}
			end
		end,
	},
	'school', school = {
		name = "school",
		effect = 'school',
		config = {
			extra = {
				mult = 2,
				curr_mult = 0
			}
		},
		pos = { x = 4, y = 1 },
		--in_pool = function(self) return false end,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {card.ability.extra.mult, card.ability.extra.curr_mult}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring then
				if context.cardarea == G.play then
					card.ability.extra.curr_mult = card.ability.extra.curr_mult + card.ability.extra.mult
					return {mult = card.ability.extra.curr_mult}
				elseif context.cardarea == "unscored" and card.ability.extra.curr_mult > 0 then
					card.ability.extra.curr_mult = 0
					return {message = localize('k_reset')}
				end
			end
			if context.discard and context.other_card == card and card.ability.extra.curr_mult > 0 then
				card.ability.extra.curr_mult = 0
				return {message = localize('k_reset')}
			end
		end,
	},
	'loop', loop = {
		name = "loop",
		effect = 'loop',
		config = {
			extra = {
				repeats = 1
			}
		},
		pos = { x = 0, y = 0 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            --info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.repeats, card.ability.extra.repeats == 1 and "" or "s" }}
		end,
		calculate = function(self, card, context)
			if context.repetition and context.cardarea == G.play then
				return {
					repetitions = card.ability.extra.repeats
				}
			end
		end,
	},
	'star', star = {
		name = "star",
		effect = 'bounty',
		config = {
			extra = {
				reduction = 0.10,
			}
		},
		pos = { x = 3, y = 0 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {card.ability.extra.reduction*100}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play then
				return {
					extra = {focus = card,
						message = localize{type = 'variable', key = 'a_blind_minus_percent',
							vars = {card.ability.extra and card.ability.extra.reduction*100 or 10}}, },
					card = card,
                    func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            AMM.mod_blind(1-(card.ability.extra and card.ability.extra.reduction or 0.10), nil, true)
                            return true
                        end)}))
					end,
				}
			end
		end,
	},
	'party', party = {
		name = "party",
		display_name = "Party Card",
		text = {
			'Work in Progress!'
		},
		effect = 'party',
		config = {
		},
		pos = { x = 6, y = 0 },
		in_pool = function(self) return false end,
	},
	'plan', plan = {
		name = "plan",
		effect = 'plan',
		config = {
			extra = {
				planning = false
			}
		},
		pos = { x = 3, y = 1 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if not card.fake_card then info_queue[#info_queue+1] = G.P_CENTERS.m_thac_plan end
			return {vars = {}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play then
				local found = false
				for k,v in ipairs(G.deck.cards) do
					if v.config.center.key == "m_thac_plan" and not v.ability.extra.planning then
						draw_card(G.deck, G.hand, 100, 'up', true, v)
						v.ability.extra.planning = true
						found = true
						--[[G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0, func = function()
							--v:flip()
							return true
						end}))]]
						break
					end
				end
				if found then return {
					message = "Planned!",
				} end
			end
			if context.after or context.end_of_round then
				card.ability.extra.planning = false
			end
		end,
	},
	'mint', mint = {
		name = "mint",
		effect = 'mint',
		config = {
			extra = {
				dollars = 1,
				dollars_curr = 0,
				oddsn = 1,
				oddsd = 6,
			},
		},
		pos = { x = 5, y = 1 },
		shatters = true,
		in_pool = function(self) return false end,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            --if not card.fake_card then info_queue[#info_queue+1] = G.P_CENTERS.m_thac_plan end
			local probvars = {SMODS.get_probability_vars(card, card.ability.extra.oddsn, card.ability.extra.oddsd)}
			return {vars = {card.ability.extra.dollars, card.ability.extra.dollars_curr, probvars[1], probvars[2]}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play and card.ability.extra.dollars_curr > 0 then
				return { p_dollars = card.ability.extra.dollars_curr }
			end
			if context.main_scoring and context.cardarea == G.hand then
				card.ability.extra.dollars_curr = card.ability.extra.dollars_curr + card.ability.extra.dollars
				return { colour = G.C.GREEN, message = localize('k_thac_minty') }
			end
            if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and SMODS.pseudorandom_probability(card, 'mint', card.ability.extra.oddsn, card.ability.extra.oddsd) then
                --TODO: figure out if this is useful?: card.glass_trigger = true
                return { remove = true }
            end
		end,
	},
	'spark', spark = {
		name = "spark",
		effect = 'spark',
		config = {
			extra = {
				factor = 4
			},
		},
		pos = { x = 2, y = 0 },
		--in_pool = function(self) return false end,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {card.ability.extra.factor}}
		end,
	},
	'cardboard', cardboard = {
		name = "cardboard",
		effect = 'cardboard',
		config = {
			extra = {
				xchips = 2,
				threshold = 4
			},
		},
		pos = { x = 4, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.xchips, card.ability.extra.threshold}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play and G.GAME.dollars < card.ability.extra.threshold then
				return {
					xchips = card.ability.extra.xchips
				}
			end
		end,
	},
	'ruled', ruled = {
		name = "ruled",
		no_rank = true,
		no_suit = true,
		replace_base_card = true,
		always_scores = true,
		effect = 'ruled',
		config = {
			extra = {
				["High Card"] = 0,
				["Pair"] = 0,
				["Two Pair"] = 0,
				["Three of a Kind"] = 0,
				["Straight"] = 0,
				["Flush"] = 0,
				["Full House"] = 0,
				["Four of a Kind"] = 0,
				["Straight Flush"] = 0,
				-- Basically just an easter egg. Still works like StrFlush
				["Royal Flush"] = 0,
			},
		},
		pos = { x = 5, y = 0 },
		active_hands = function(self, card)
			local ret = {}
			for k,v in pairs(card.ability.extra) do
				if k ~= "Royal Flush" and v > 0 then
					ret[#ret+1] = k
				end
			end
			return ret
		end,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'thac_standard_hands', set = 'Other'}
			local _hands = self:active_hands(card)
			local _chips = 0
			local _mult = 0
			for k,v in ipairs(_hands) do
				if G.GAME.hands[v].chips > _chips then _chips = G.GAME.hands[v].chips end
				if G.GAME.hands[v].mult > _mult then _mult = G.GAME.hands[v].mult end
			end
			return {vars = { _chips, _mult }}
		end,
		calculate = function(self, card, context)
			if context.before and context.cardarea == G.hand then
				if card.ability.extra[context.scoring_name] then
					if context.scoring_name == "Royal Flush" then
						card.ability.extra["Straight Flush"] = card.ability.extra["Straight Flush"] + 1
					end
					card.ability.extra[context.scoring_name] = card.ability.extra[context.scoring_name] + 1
				end
			end
			if context.main_scoring and context.cardarea == G.play then
				local _hands = self:active_hands(card)
				local _chips = 0
				local _mult = 0
				for k,v in ipairs(_hands) do
					if G.GAME.hands[v].chips > _chips then _chips = G.GAME.hands[v].chips end
					if G.GAME.hands[v].mult > _mult then _mult = G.GAME.hands[v].mult end
				end
				return {
					chips = _chips,
					mult = _mult
				}
			end
		end,
	},
	'jewel', jewel = {
		name = "jewel",
		effect = 'jewel',
		config = {
			extra = {
				money = 5,
			}
		},
		no_rank = true,
		no_suit = true,
		replace_base_card = true,
		always_scores = true,
		pos = { x = 1, y = 1 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            --info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = {(card.ability.extra and card.ability.extra.money or 5)}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play then
				return {
					p_dollars = (card.ability.extra and card.ability.extra.money or 5)
				}
			end
		end,
	},
	'angel', angel = {
		name = "angel",
		effect = 'angel',
		config = {
			extra = {
				ap = 1,
				score = 17,
				score_factor = 0.1666,
				score_power = 0.01225,
			},
		},
		no_rank = true,
		no_suit = true,
		replace_base_card = true,
		always_scores = true,
		pos = { x = 7, y = 0 },
		--in_pool = function(self) return false end,
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
			return {vars = {((G.GAME.amm_ap or 0) + card.ability.extra.ap) * (card.ability.extra.score + math.floor((G.GAME.amm_ap or 0) * card.ability.extra.score_factor) + math.floor((G.GAME.amm_ap or 0) ^ card.ability.extra.score_power))}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play then
                return {
                    ap = card.ability.extra.ap,
					score = (G.GAME.amm_ap + card.ability.extra.ap) * (card.ability.extra.score + math.floor(G.GAME.amm_ap * card.ability.extra.score_factor) + math.floor(G.GAME.amm_ap ^ card.ability.extra.score_power))
                }
			end
		end,
	},
	'soulbound', soulbound = {
		name = "soulbound",
		effect = 'soulbound',
		config = {
			extra = {
				xmult = 1
			}
		},
		pos = { x = 2, y = 1 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = { card.ability.extra.xmult }}
		end,
		remove_from_graveyard = function(self, card)
			card.ability.perma_x_mult = card.ability.perma_x_mult + card.ability.extra.xmult
		end,
	},
	'mist', mist = {
		name = "mist",
		effect = 'mist',
		config = {
		},
		pos = { x = 1, y = 0 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if not card.fake_card then info_queue[#info_queue+1] = G.P_CENTERS.m_thac_tempmist end
            info_queue[#info_queue+1] = {key = 'graveyard', set = 'Other'}
			return {vars = {}}
		end,
		--in_pool = function(self) return false end,
	},
	'tempmist', tempmist = {
		name = "tempmist",
		effect = 'mist',
		config = {
		},
		pos = { x = 1, y = 0 },
		loc_vars = function(self, info_queue, card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'autumn'} end
            if not card.fake_card then info_queue[#info_queue+1] = G.P_CENTERS.m_thac_mist end
			return {vars = {}}
		end,
		in_pool = function(self) return false end,
		no_collection = true,
	},
	'shadow', shadow = {
		name = "shadow",
		display_name = "Shadow Card",
		text = {
			'Work in Progress!'
		},
		effect = 'shadow',
		config = {
		},
		pos = { x = 6, y = 1 },
		in_pool = function(self) return false end,
	},
	'placeholder', placeholder = {
		name = "placeholder",
		display_name = "SOLAR",
		text = {
			"{C:inactive,s:0.666}This shouldn't be here..."
		},
		effect = 'placeholder',
		config = {
		},
		no_rank = true,
		no_suit = true,
		replace_base_card = true,
		always_scores = true,
		pos = { x = 7, y = 1 },
		in_pool = function(self) return false end,
	},
}

SMODS.Atlas{
	key = "Enhancable",
	path = "Enhancable.png",
	px = 71,
	py = 95,
}
SMODS.Atlas{
	key = "RouxldKaard",
	path = "RouxldKaard.png",
	px = 71,
	py = 95,
}

--enhancements
for _, k in ipairs(enhancements) do
	local v = enhancements[k]
	TheAutumnCircus.data.buffer_insert("Enhancements", v, {key = k, atlas = "Enhancable"})
end

SMODS.Shader {
	key = "trans",
	path = "trans.fs",
}

SMODS.DrawStep {
    key = 'tempmist',
    order = -9,
    func = function(self)
        if self.config.center.key == "m_thac_tempmist" then
            self.children.center:draw_shader('thac_trans', nil, self.ARGS.send_to_shader)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}

local scribbles
SMODS.DrawStep {
    key = "rouxldkaard",
    order = 55,
    func = function(card, layer)
        if card and card.config.center == G.P_CENTERS["m_thac_ruled"] then

            scribbles = scribbles or {
				["High Card"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 0, y = 0}),
				["Pair"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 1, y = 0}),
				["Two Pair"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 2, y = 0}),
				["Three of a Kind"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 3, y = 0}),
				["Straight"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 4, y = 0}),
				["Flush"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 5, y = 0}),
				["Full House"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 6, y = 0}),
				["Four of a Kind"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 7, y = 0}),
				["Straight Flush"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 8, y = 0}),
				["Royal Flush"] = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["thac_RouxldKaard"], {x = 9, y = 0}),
			}
			for k,v in ipairs({"High Card", "Pair", "Two Pair", "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind", "Straight Flush", "Royal Flush"}) do
				if card.ability.extra[v] > 0 then
					scribbles[v].role.draw_major = card
					scribbles[v]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil, 0, 0)
				end
			end
        end
    end,
    conditions = {vortex = false, facing = 'front'}
}