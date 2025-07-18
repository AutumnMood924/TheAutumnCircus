

local suitstarloc_vars = function(_c, info_queue, card)
	local cfg = (card and card.ability) or _c.config
	return {vars = {
		G.GAME.amm_data.suit_levels[cfg.extra.asc_suit].level,
		G.GAME.amm_data.suit_levels[cfg.extra.asc_suit].asc > 0 and (" + "..G.GAME.amm_data.suit_levels[cfg.extra.asc_suit].asc.."") or "",
		localize(cfg.extra.asc_suit, 'suits_plural'),
		AMM.config.suit_levels.asc,
		colours = {
			(G.GAME.amm_data.suit_levels[cfg.extra.asc_suit].level<=1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.amm_data.suit_levels[cfg.extra.asc_suit].level)]),
			G.C.SUITS[cfg.extra.asc_suit],
		}
	}}
end


local frauds = {
}

local stars = {
	'rev_planet_s', rev_planet_s = {
		config = {extra = {asc_suit = "Spades"}},
		inversion = "c_thac_planet_s",
		pos = { x = 6, y = 2 },
		loc_vars = function(_c,info_queue,card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitstarloc_vars(_c,info_queue,card)
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.ascend_suit(used_tarot, card.ability.extra.asc_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self and self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Star?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.extra.asc_suit, true) then return true end
            end
        end,
	},
	'rev_planet_h', rev_planet_h = {
		config = {extra = {asc_suit = "Hearts"}},
		inversion = "c_thac_planet_h",
		pos = { x = 7, y = 2 },
		loc_vars = function(_c,info_queue,card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitstarloc_vars(_c,info_queue,card)
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.ascend_suit(used_tarot, card.ability.extra.asc_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self and self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Star?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.extra.asc_suit, true) then return true end
            end
        end,
	},
	'rev_planet_c', rev_planet_c = {
		config = {extra = {asc_suit = "Clubs"}},
		inversion = "c_thac_planet_c",
		pos = { x = 8, y = 2 },
		loc_vars = function(_c,info_queue,card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitstarloc_vars(_c,info_queue,card)
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.ascend_suit(used_tarot, card.ability.extra.asc_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self and self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Star?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.extra.asc_suit, true) then return true end
            end
        end,
	},
	'rev_planet_d', rev_planet_d = {
		config = {extra = {asc_suit = "Diamonds"}},
		inversion = "c_thac_planet_d",
		pos = { x = 9, y = 2 },
		loc_vars = function(_c,info_queue,card)
            --if not card.fake_card then info_queue[#info_queue+1] = {generate_ui = TheAutumnCircus.func.artcredit, key = 'jevonn'} end
			return suitstarloc_vars(_c,info_queue,card)
		end,
		use = function(self, card, area, copier)
			local used_tarot = copier or card
			AMM.ascend_suit(used_tarot, card.ability.extra.asc_suit)
		end,
		can_use = function(self, card) return true end,
		set_badges = function(self, card, badges)
			if self and self.discovered then
				badges[1].nodes[1].nodes[2].config.object:remove()
				badges[1] = create_badge("Star?", get_type_colour(self or card.config, card), nil, 1.2)
				return badges
			end
		end,
        in_pool = function(self)
            for k,v in ipairs(G.playing_cards) do
                if v:is_suit(self.config.extra.asc_suit, true) then return true end
            end
        end,
	},
}

local omens = {
}

SMODS.Atlas{
	key = "selbamusnoCeroM",
	path = "selbamusnoCeroM.png",
	px = 71,
	py = 95,
}

--frauds
for _, k in ipairs(frauds) do
	local v = frauds[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Fraud", key = k, atlas = "selbamusnoCeroM"})
end

--stars
for _, k in ipairs(stars) do
	local v = stars[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Star", key = k, atlas = "selbamusnoCeroM"})
end

--omens
for _, k in ipairs(omens) do
	local v = omens[k]
	TheAutumnCircus.data.buffer_insert("Consumables", v, {set = "Omen", key = k, atlas = "selbamusnoCeroM"})
end