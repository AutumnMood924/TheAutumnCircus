-- im just
-- gonna add these directly

-- whoever reworks this later im sorry

local thac_effects = {
    thac_handsel = {
        ability = {sel = 1, min_possible = 1, max_possible = 3},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.sel, Stacked.round(ability_table.perfect, 1), colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = function(card, ability_table)
            ability_table.perfect = pseudorandom("thac_handsel_roll", 0, 2) * 50
            ability_table.sel = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
        end,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.sel
            local diff = new - old

            ability_table.sel = new
            if diff ~= 0 then
				SMODS.change_play_limit(diff)
            end
        end,
        on_apply = function(card, ability_table, repeated)
            SMODS.change_play_limit(ability_table.sel)
        end,
        on_remove = function(card, ability_table, card_destroyed)
            SMODS.change_play_limit(-ability_table.sel)
        end,
    },
    thac_discardsel = {
        ability = {sel = 1, min_possible = 1, max_possible = 3},
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.sel, Stacked.round(ability_table.perfect, 1), colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = function(card, ability_table)
            ability_table.perfect = pseudorandom("thac_discardsel_roll", 0, 2) * 50
            ability_table.sel = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
        end,
        update_values = function(card, ability_table)
            local new = (ability_table.min_possible) + ((ability_table.max_possible - ability_table.min_possible) * (ability_table.perfect/100))
            local old = ability_table.sel
            local diff = new - old

            ability_table.sel = new
            if diff ~= 0 then
				SMODS.change_discard_limit(diff)
            end
        end,
        on_apply = function(card, ability_table, repeated)
            SMODS.change_discard_limit(ability_table.sel)
        end,
        on_remove = function(card, ability_table, card_destroyed)
            SMODS.change_discard_limit(-ability_table.sel)
        end,
    },
}

for k,v in pairs(thac_effects) do
	v.key = k
	if (not v.load_check) or (type(v.load_check) == "function" and v:load_check()) then
		ExtraEffects[k] = v
	end
end