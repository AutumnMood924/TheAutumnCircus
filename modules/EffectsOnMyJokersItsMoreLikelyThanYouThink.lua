-- im just
-- gonna add these directly

-- whoever reworks this later im sorry

local thac_effects = {
    thac_handsel = {
        ability = {sel = 1},
        description = {
            text = {
                "{C:inactive}[Passive]{} {C:inactive}({}{V:1}#2#%{}{C:inactive}){C:gold} ~ ÞAC",
                "Joker gives {C:blue}+#1# Hand",
				"{C:blue}selection limit",
            },
        },
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.sel, Stacked.round(ability_table.perfect, 1), colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = function(card, ability_table)
            local num = pseudorandom(card.config.center.key.."effect_thac_handsel", 1, 3)
            local max_possible = 3
            local min_possible = 1

            ability_table.sel = num
            ability_table.perfect = (math.max((num-min_possible),0)/(max_possible-min_possible)) * 100
        end,
        on_apply = function(card, ability_table, repeated)
            SMODS.change_play_limit(ability_table.sel)
        end,
        on_remove = function(card, ability_table, card_destroyed)
            SMODS.change_play_limit(-ability_table.sel)
        end,
    },
    thac_discardsel = {
        ability = {sel = 1},
        description = {
            text = {
                "{C:inactive}[Passive]{} {C:inactive}({}{V:1}#2#%{}{C:inactive}){C:gold} ~ ÞAC",
                "Joker gives {C:red}+#1# Discard",
				"{C:red}selection limit",
            },
        },
        loc_vars = function(info_queue, card, ability_table)
            return {vars = {ability_table.sel, Stacked.round(ability_table.perfect, 1), colours = {{1 - (1 * ability_table.perfect/100), 1 * ability_table.perfect/100, 0, 1}}}}
        end,
        randomize_values = function(card, ability_table)
            local num = pseudorandom(card.config.center.key.."effect_thac_discardsel", 1, 3)
            local max_possible = 3
            local min_possible = 1

            ability_table.sel = num
            ability_table.perfect = (math.max((num-min_possible),0)/(max_possible-min_possible)) * 100
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