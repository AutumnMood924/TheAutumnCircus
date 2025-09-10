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
    },
    ':art:', [':art:'] = {
        config = { extra = {
			--odds = 3,
        }},
        cost = 4,
		soul_pos = {x = 2, y = 0},
		pronouns = "it_its",
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
            return {vars = {}}
        end,
        calculate = function(self, card, context)
        end,
		dependencies = { "MoreFluff" },
		yes_pool_flag = "never",
    },
    ':currency_exchange:', [':currency_exchange:'] = {
        config = { extra = {
			dollars_to = 4,
			dollars_from = 3,
			pyrox_to = 2,
			pyrox_from = 2,
        }},
        cost = 6,
		rarity = 2,
		soul_pos = {x = 3, y = 0},
		pronouns = "it_its",
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rental_compat = true,
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = { key = "petting", set = "Other" }
            return {vars = {card.ability.extra.dollars_to, card.ability.extra.pyrox_from, card.ability.extra.pyrox_to, card.ability.extra.dollars_from}}
        end,
        calculate = function(self, card, context)
            if context.amm_pet_card and context.amm_pet_card == card then
				if context.amm_pet_direction == "clockwise" and G.GAME.dollars >= card.ability.extra.dollars_to then
					return {
						message = localize("k_thac_owo"),
						colour = G.C.BLUE,
						func = function()
							ease_dollars(-card.ability.extra.dollars_to)
							ease_pyrox(card.ability.extra.pyrox_from)
						end,
					}
				elseif context.amm_pet_direction == "counter-clockwise" and G.GAME.payasaka_pyroxenes >= card.ability.extra.pyrox_to then
					return {
						message = localize("k_thac_owo"),
						colour = G.C.MONEY,
						func = function()
							ease_pyrox(-card.ability.extra.pyrox_to)
							ease_dollars(card.ability.extra.dollars_from)
						end,
					}
				end
            end
        end,
		dependencies = { "pta_saka" },
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
		G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
                card.children.center:set_sprite_pos({ x = 0, y = yoffset })
                return true
            end
		}))
    end})
end