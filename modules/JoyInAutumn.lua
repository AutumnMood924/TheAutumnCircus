local jokers = {
    'edge_of_reality', edge_of_reality = {
        config = { extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
            },
			pyroxenes = 1,
			colour_rounds = 1,
			threshold = 4,
        }},
		set_sprites = JoyousSpring.set_back_sprite,
        pos = { x = 6, y = 0 },
        cost = 15,
		rarity = "cry_epic",
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			local suitless = AMM.api.graveyard.count_suitless()
			local rankless = AMM.api.graveyard.count_rankless()
			info_queue[#info_queue+1] = {key = "graveyard", set = "Other"}
            return {vars = {
				card.ability.extra.pyroxenes,
				rankless,
				card.ability.extra.colour_rounds,
				card.ability.extra.colour_rounds == 1 and "" or "s",
				suitless,
				card.ability.extra.threshold == 1 and "" or card.ability.extra.threshold.." ",
				card.ability.extra.threshold == 1 and "" or "s",
			}}
        end,
        calculate = function(self, card, context)
			if context.amm_buried_card and not (SMODS.has_no_suit(context.other_card) or SMODS.has_no_rank(context.other_card)) and not context.other_card.marked_for_edge_of_reality then
				-- basically just do Break Up but destroy the card without graveyarding it
				-- check for no suit or rank in the main check
				-- because if the card doesnt have both a suit and a rank
				-- then whats the point of even splitting it
				
				context.other_card.marked_for_edge_of_reality = true
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.1,
					func = function() 
						local _card = copy_card(context.other_card, nil, nil, G.playing_card)
						_card.ability.akyrs_special_card_type = "rank"
						_card:set_sprites(_card.config.center, _card.config.card)
						G.graveyard_area:emplace(_card)
						table.insert(G.graveyard, _card)
						_card.playing_card = #G.graveyard
						_card.graveyard = true
						local _card2 = copy_card(context.other_card, nil, nil, G.playing_card)
						_card2.ability.akyrs_special_card_type = "suit"
						_card2:set_sprites(_card2.config.center, _card2.config.card)
						G.graveyard_area:emplace(_card2)
						table.insert(G.graveyard, _card2)
						_card2.playing_card = #G.graveyard
						_card2.graveyard = true
						context.other_card:remove_from_game(nil, true, nil, true)
						card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_copied_ex"), colour = G.C.JOKER_GREY, instant = true})
                    return true end }))
			end
			
			if (context.end_of_round and G.GAME.blind.boss and context.cardarea == card.area) or context.forcetrigger then
				-- so
				-- aaa
				-- first: rankless cards = pyroxenes
				local rankless = AMM.api.graveyard.count_rankless()
				local pyrox = card.ability.extra.pyroxenes * rankless
				
				-- second: suitless cards = colour rounds
				local suitless = AMM.api.graveyard.count_suitless()
				local rounds = math.floor(card.ability.extra.colour_rounds * suitless / card.ability.extra.threshold)
				
				-- double pyrox and rounds if in the Flip-Side
				if G.GAME.entr_alt then
					pyrox = pyrox * 2
					rounds = rounds * 2
				end
				
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{ type = "variable", key = "thac_gain_pyrox", vars = { pyrox }}, colour = G.C.BLUE, instant = true})
				ease_pyrox(pyrox)
				if rounds < 1 then return end
				for i = 1, rounds do
					colour_end_of_round_effects()
				end
			end
        end,
		dependencies = { "JoyousSpring", "Cryptid", "aikoyorisshenanigans", "pta_saka", "MoreFluff", "entr" },
    },
}

SMODS.Atlas{
	key = "JoyInAutumn",
	path = "JoyInAutumn.png",
	px = 71,
	py = 95,
}

--jokers
for _, k in ipairs(jokers) do
	local v = jokers[k]
	if not v.rarity then v.rarity = 1 end
	TheAutumnCircus.data.buffer_insert("Jokers", v, {key = k, atlas = "JoyInAutumn"})
end