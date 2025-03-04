
local blinds = {
	"jera", jera = {
		name = "Jera",
		text = {
			"1 in 4 chance to","copy played cards",
		},
		pos = { x = 0, y = 11 },
		boss = {min = 1, max = 9000},
		boss_colour = HEX('FDA200'),
		debuff = {},
		dollars = 0,
		modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
			if self.disabled then return mult, hand_chips, false end
			for i=1,#cards do
				local card = cards[i]
				--print(inspect(card))
				if pseudorandom(pseudoseed('jera')) < G.GAME.probabilities.normal/4 then
					self.triggered = true
					card:juice_up()

					G.E_MANAGER:add_event(Event({
						trigger = "immediate",
						func = function()
							G.playing_card = (G.playing_card and G.playing_card + 1) or 1
							local _card = copy_card(card, nil, nil, G.playing_card)
							_card:add_to_deck()
							G.deck.config.card_limit = G.deck.config.card_limit + 1
							table.insert(G.playing_cards, _card)
							G.hand:emplace(_card)
							_card.states.visible = nil
							_card:start_materialize()
							return true
						end
					})) 
				end
			end
			return mult, hand_chips, false
		end,
		get_loc_debuff_text = function(self)
			return G.GAME.probabilities.normal.." in 4 chance to copy played cards"
		end,
	},
	"mannaz", mannaz = {
		name = "Mannaz",
		text = {
			"All Cup, Wand, Coin, and",
			"Sword cards are debuffed"
		},
		pos = { x = 0, y = 19 },
		boss = {min = 2, max = 9000},
		boss_colour = HEX('DAB772'),
		debuff = {},
		recalc_debuff = function(self, card, from_blind)
			if card:is_suit("thac_Cups", true) or card:is_suit("thac_Wands", true) or card:is_suit("thac_Coins", true) or card:is_suit("thac_Swords", true) then
				card:set_debuff(true)
				return
			end
		end,
		get_loc_debuff_text = function(self)
			return "All Cup, Wand, Coin, and Sword cards are debuffed"
		end,
		load_check = function()
			return TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord and (
				TheAutumnCircus.config.enabled_suits.Cups or
				TheAutumnCircus.config.enabled_suits.Wands or
				TheAutumnCircus.config.enabled_suits.Coins or
				TheAutumnCircus.config.enabled_suits.Swords
			)
		end,
	},
}

SMODS.Atlas{
	key = "BlindToAllButTheVideo",
	path = "BlindToAllButTheVideo.png",
	px = 34, 
	py = 34,
	atlas_table = "ANIMATION_ATLAS",
	frames = 21
}

--blinds
for _, k in ipairs(blinds) do
	local v = blinds[k]
	TheAutumnCircus.data.buffer_insert("Blinds", v, {key = k, atlas = "BlindToAllButTheVideo"})
end