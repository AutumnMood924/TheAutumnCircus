
local gb_boss_pool = function(self, args)
    return gb_is_blind_defeated(self.lazy_blind_key)
end

local jokers = {
    'jera', jera = {
        config = { extra = {
			odds = 4,
        }},
        pos = { x = 1, y = 2 },
        cost = 6,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			local probvars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds)}
            return {vars = {probvars[1], probvars[2]}}
        end,
        calculate = function(self, card, context)
            if context.before then
				for i=1,#G.play.cards do
					local this_card = G.play.cards[i]
					--print(inspect(card))
					if SMODS.pseudorandom_probability(card, 'boss_jera', 1, card.ability.extra.odds) then
						self.triggered = true
						this_card:juice_up()

						G.E_MANAGER:add_event(Event({
							trigger = "immediate",
							func = function()
								G.playing_card = (G.playing_card and G.playing_card + 1) or 1
								local _card = copy_card(this_card, nil, nil, G.playing_card)
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
            end
        end,
		lazy_blind_key = "bl_thac_jera",
    },
}

SMODS.Atlas{
	key = "BossMyJokers",
	path = "BossMyJokers.png",
	px = 71,
	py = 95,
}

--jokers
for _, k in ipairs(jokers) do
	local v = jokers[k]
	if not v.rarity then v.rarity = "gb_boss" end
	TheAutumnCircus.data.buffer_insert("Jokers", v, {key = k, in_pool = gb_boss_pool, atlas = "BossMyJokers"})
end