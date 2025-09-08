local jokers = {
    'aggregating_mass', aggregating_mass = {
        config = { extra = {
			cards = 3
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
		pronouns = "they_it",
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
			return {vars = {card.ability.extra.cards}}
        end,
        calculate = function(self, card, context)
			if context.setting_blind then
				for i=1,card.ability.extra.cards do
					local cardmak = SMODS.create_card{
						set = "Playing Card",
						area = G.deck,
						suit = "gb_Eyes",
						seal = SMODS.poll_seal{key = "aggregating_mass", mod = 10},
						edition = poll_edition(pseed),
					}
					cardmak:move_to_graveyard()
				end
				return {
					message = localize("gb_Eyes", "suits_plural"),
					colour = G.C.PURPLE,
				}
			end
        end,
		dependencies = { "GrabBag" },
		shattered_of = { "j_thac_grave_legion" },
    },
    'void_nullmage', void_nullmage = {
        config = { extra = {
			
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
		pronouns = "they_it",
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.cards}}
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == "unscored" and not context.end_of_round and context.other_card:is_suit("gb_Eyes") then
                return {
					balance = true
				}
            end
        end,
		dependencies = { "GrabBag" },
		shattered_of = { "j_thac_jet_worldmage", "j_thac_ruby_sunmage", "j_thac_opal_moonmage", "j_thac_topaz_starmage", "j_thac_amethyst_starmage", "j_thac_onyx_moonmage" },
    },
    'shattered_lord_of_void', shattered_lord_of_void = {
        config = { extra = {
			
        }},
        pos = { x = 0, y = 0 },
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		pronouns = "it_he_they",
		loc_vars = function(self, info_queue, card)
			if card.area.config.collection then
			return {vars = {"N/A"}}
			else
            return {vars = {#G.riftraft_void.cards}}
			end
        end,
        calculate = function(self, card, context)
			if context.setting_blind and #G.riftraft_void.cards > 0 and not context.retrigger_joker then
				return {
					extra = {focus = context.other_card,
						message = localize{type = 'variable', key = 'a_blind_minus_percent',
							vars = {math.floor((1-1/#G.riftraft_void.cards)*100)}}, },
					card = card,
                    func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            AMM.mod_blind(1/#G.riftraft_void.cards, nil, true)
                            return true
                        end)}))
					end,
				}
			end
        end,
		dependencies = { "GrabBag", "RiftRaft" },
		shattered_of = { "j_thac_lord_of_void", "j_thac_", "j_thac_hmlt_lordofvoid" },
    },
}

SMODS.Atlas{
	key = "ShatterMyJokersIntoPieces",
	path = "ShatterMyJokersIntoPieces.png",
	px = 71,
	py = 95,
}

--jokers
for _, k in ipairs(jokers) do
	local v = jokers[k]
	if not v.rarity then v.rarity = "gb_shattered" end
	for __,n in ipairs(v.shattered_of) do
		GB_SHATTERED_TABLE[n] = "j_thac_"..k
	end
	TheAutumnCircus.data.buffer_insert("Jokers", v, {key = k, atlas = "ShatterMyJokersIntoPieces"})
end