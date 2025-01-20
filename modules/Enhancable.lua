local enhancements = {
	--[['loop', loop = {
		name = "loop",
		display_name = "Loop Card",
		text = {
			'Returns to the deck',
			'after being played'
		},
		effect = 'loop',
		config = {
		},
		pos = { x = 0, y = 0 },
	},              This effect requires too much jank rn]]
	'grass', grass = {
		name = "grass",
		display_name = "Grass Card",
		text = {
			'This card permanently gains',
			'{C:chips}+#1#{} chips each hand played',
			'while it stays in hand'
		},
		effect = 'grass',
		config = {
			extra = {
				chips = 4
			}
		},
		pos = { x = 1, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.chips}}
		end,
		calculate = function(self, card, context)
			if context.cardarea == G.hand and
				context.main_scoring then
				card.ability.perma_bonus = card.ability.perma_bonus or 0
				card.ability.perma_bonus = card.ability.perma_bonus + card.ability.extra.chips
				return {
					message = localize('k_upgrade_ex'),
					colour = G.C.CHIPS,
					card = card,
				}
			end
		end,
	},
	'dirt', dirt = {
		name = "dirt",
		display_name = "Dirt Card",
		text = {
			'This card permanently',
			'gains {C:mult}+#1#{} Mult when',
			'it is discarded'
		},
		effect = 'dirt',
		config = {
			extra = {
				mult = 2
			}
		},
		pos = { x = 2, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.mult}}
		end,
		calculate = function(self, card, context)
			if context.discard and context.other_card == card then
				card.ability.perma_mult = card.ability.perma_mult or 0
				card.ability.perma_mult = card.ability.perma_mult + card.ability.extra.mult
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT})
			end
		end,
	},
	'bounty', bounty = {
		name = "bounty",
		display_name = "Bounty Card",
		text = {
			'Reduces Blind requirement',
			'by {C:attention}#1#%{} when scored'
		},
		effect = 'bounty',
		config = {
			extra = {
				reduction = 0.08,
			}
		},
		pos = { x = 3, y = 0 },
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.reduction*100}}
		end,
		calculate = function(self, card, context)
			if context.main_scoring and context.cardarea == G.play then
				return {
					extra = {focus = card,
						message = localize{type = 'variable', key = 'a_blind_minus_percent',
							vars = {card.ability.extra.reduction*100}}, 
						func = function()
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 0.0,
							func = (function()
								AMM.mod_blind(1-card.ability.extra.reduction, nil, true)
								return true
							end)}))
					end},
					card = card
				}
			end
		end,
	},
}

SMODS.Atlas{
	key = "Enhancable",
	path = "Enhancable.png",
	px = 71,
	py = 95,
}

--enhancements
for _, k in ipairs(enhancements) do
	local v = enhancements[k]
	TheAutumnCircus.data.buffer_insert("Enhancements", v, {key = k, atlas = "Enhancable"})
end