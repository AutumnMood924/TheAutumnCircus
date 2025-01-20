local func = {}

-- traverses a UI table and scales all nodes i think
function func.scale_nodes(t, factor, extra)
	if t then
		if t.config then
			if extra and not extra.no_w then
				if t.config.minw then t.config.minw = t.config.minw * factor end
				if t.config.maxw then t.config.maxw = t.config.maxw * factor end
			end
			if extra and not extra.no_h then
				if t.config.minh then t.config.minh = t.config.minh * factor end
				if t.config.maxh then t.config.maxh = t.config.maxh * factor end
			end
		end
		
		if t.n == G.UIT.R or t.n == G.UIT.C then
			for k,v in ipairs(t.nodes) do
				func.scale_nodes(v, factor, extra)
			end
		elseif t.n == G.UIT.T and t.config and t.config.scale then
			t.config.scale = t.config.scale * factor
		end
	end
	return t
end

-- based on level_up_hand, but levels up a suit instead
function level_up_suit(card, suit, instant, amount)
    amount = amount or 1
	if not instant then
		update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(suit, 'suits_plural'),chips = G.GAME.thac_data.suit_levels[suit].chips, mult = G.GAME.thac_data.suit_levels[suit].mult, level=G.GAME.thac_data.suit_levels[suit].level})
	end
    G.GAME.thac_data.suit_levels[suit].level = math.max(0, G.GAME.thac_data.suit_levels[suit].level + amount)
    G.GAME.thac_data.suit_levels[suit].mult = math.max(TheAutumnCircus.config.mechanics.suit_levels.mult*(G.GAME.thac_data.suit_levels[suit].level - 1), 0)
    G.GAME.thac_data.suit_levels[suit].chips = math.max(TheAutumnCircus.config.mechanics.suit_levels.chips*(G.GAME.thac_data.suit_levels[suit].level - 1), 0)
    if not instant then 
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = G.GAME.thac_data.suit_levels[suit].mult, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            return true end }))
        update_hand_text({delay = 0}, {chips = G.GAME.thac_data.suit_levels[suit].chips, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.thac_data.suit_levels[suit].level})
        delay(1.3)
    end
	update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
end

-- note this returns the string name of the hand, not the hand 'object'
-- effectively just 'skips over' locked hands
function func.pseudorandom_unlocked_hand(ignore, seed)
	local chosen_hand
	ignore = ignore or {}
	seed = seed or 'comet_planet'
	if type(ignore) ~= 'table' then ignore = {ignore} end
	while true do
		chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
		if G.GAME.hands[chosen_hand].visible then
			local safe = true
			for _, v in pairs(ignore) do
				if v == chosen_hand then safe = false end
			end
			if safe then break end
		end
	end
	return chosen_hand
end

-- Counts how many cards of each suit are in the deck
-- Ignores wild cards and other effects
function func.count_deck_suits()
  local suit_tallies = {}
  for k, v in ipairs(G.playing_cards) do
    if v.ability.name ~= 'Stone Card' then 
      suit_tallies[v.base.suit] = (suit_tallies[v.base.suit] or 0) + 1
    end
  end
  return suit_tallies
end

function func.eval_this(_card, effects)
	if effects then 
		local extras = {mult = false, hand_chips = false}
		if effects.mult_mod then mult = mod_mult(mult + effects.mult_mod);extras.mult = true end
		if effects.chip_mod then hand_chips = mod_chips(hand_chips + effects.chip_mod);extras.hand_chips = true end
		if effects.Xmult_mod then mult = mod_mult(mult*effects.Xmult_mod);extras.mult = true  end
		update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
		if effects.message then
			card_eval_status_text(_card, 'jokers', nil, nil, nil, effects)
		end
	end
end

function func.get_card_suits(_card, bypass_debuff)
	local ret = {}
	for _, v in ipairs(SMODS.Suit.obj_buffer) do
		if _card:is_suit(v, bypass_debuff) then
			table.insert(ret, v)
		end
	end
	return ret
end

-- again, returns the string name of the hand
-- this handles ties the same way that Telescope does, which is to say it doesn't.
function func.favorite_hand()
	local chosen_hand = 'High Card'
	local highest_played = 0
	for _, v in ipairs(G.handlist) do
		if G.GAME.hands[v].played > highest_played then
			chosen_hand = v
			highest_played = G.GAME.hands[v].played
		end
	end
	return chosen_hand
end

function func.pseudorandom_enhancement()
	local ret = pseudorandom_element(G.P_CENTER_POOLS['Enhanced'], pseudoseed('universe_tarot'))
	return ret
end

return func