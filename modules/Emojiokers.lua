local jokers = {
    ':joker:', [':joker:'] = {
        config = { extra = {
			mult = 4,
        }},
        cost = 2,
		soul_pos = {x = 1, y = 0},
		pronouns = "it_its",
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.mult}}
        end,
        calculate = function(self, card, context)
            if context.joker_main then return {mult = card.ability.extra.mult} end
        end,
		attributes = {"mult"},
    },
    ':free:', [':free:'] = {
        config = { extra = {
			--odds = 3,
        }},
        cost = 0,
		soul_pos = {x = 9, y = 0},
		pronouns = "it_its",
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = false,
		loc_vars = function(self, info_queue, card)
            return {vars = {}}
        end,
        calculate = function(self, card, context)
        end,
		update = function(self, card, dt)
			if card.area == G.shop_jokers and not card.ability.couponed then
				card.ability.couponed = true
				card:set_cost()
			end
		end,
		attributes = {"modify_card"},
    },
}

SMODS.Atlas{
	key = "Emojiokers",
	path = "Emojiokers.png",
	px = 84,
	py = 112,
}
SMODS.Font {
    key = "emoji",
    path = "NotoEmoji-Bold.ttf",
    TEXT_OFFSET = { x = 10, y = -12 },
}

--jokers
for _, k in ipairs(jokers) do
	local v = jokers[k]
	if not v.rarity then v.rarity = 1 end
	TheAutumnCircus.data.buffer_insert("Jokers", v, {key = k, pos = {x = 0, y = 0}, atlas = "Emojiokers",
    set_ability = function(self, card, initial, delay_sprites)
        local yoffset = pseudorandom("emojiokers", 0 , 3)
		--[[G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
                --]]card.children.center:set_sprite_pos({ x = 0, y = yoffset })--[[
                return true
            end
		}))--]]
    end})
end