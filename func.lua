local func = {}

-- artist stuff
G.ARGS.LOC_COLOURS['lyman'] = HEX('73FE04')
G.ARGS.LOC_COLOURS['autumn'] = HEX('999999')
G.ARGS.LOC_COLOURS['fritz'] = HEX('993366')
G.ARGS.LOC_COLOURS['jevonn'] = HEX('993366')
G.ARGS.LOC_COLOURS['lordofvoid'] = HEX('033476')
G.ARGS.LOC_COLOURS['witchofmind'] = HEX('50B250')
G.ARGS.LOC_COLOURS['knightofheart'] = HEX('6E0E2E')

function func.artcredit(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table)
	localize {
		type = 'descriptions',
		set = 'thacmeta',
		key = _c.key,
		nodes = desc_nodes,
		vars = specific_vars or _c.vars,
	}
	desc_nodes.name = "Art Credit"
end

-- stupid function to babyproof drawing cards on the first turn
-- like actually this only exists because context.first_hand_drawn is irritating
-- and goes off if you draw cards for ANY REASON while having 0 hands and discards
-- used this round like WHY ACTUALLY THO JUST WHY AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
function func.force_draw_cards(cards, delay, nosave)
	if #G.hand.cards > 1 then
		local remember = G.hand.config.card_limit
		local remember2 = G.GAME.current_round.discards_used
		G.hand.config.card_limit = #G.hand.cards + cards
		-- this avoids the first_hand_drawn context from recalculating
		-- thus avoiding drawing the entire deck infinitely
		G.GAME.current_round.discards_used = 666
		G.FUNCS.draw_from_deck_to_hand(cards)
		G.hand.config.card_limit = remember
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = delay or 0.2,
			func = function()
				G.GAME.current_round.discards_used = remember2; if not nosave then G.E_MANAGER:add_event(Event({
					trigger = 'after',
					func = function() save_run() return true end})) end; return true
			end}))
	end
end

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

function func.context_check_animal(context)
	return context.scoring_hand and (
		next(context.poker_hands["thac_little_dog"]) or
		next(context.poker_hands["thac_big_dog"]) or
		next(context.poker_hands["thac_little_cat"]) or
		next(context.poker_hands["thac_big_cat"]) --[[or
		next(context.poker_hands["thac_little_snake"]) or
		next(context.poker_hands["thac_big_snake"]) or
		next(context.poker_hands["thac_little_bird"]) or
		next(context.poker_hands["thac_big_bird"]) or
		next(context.poker_hands["thac_little_dragon"]) or
		next(context.poker_hands["thac_big_dragon"]) or
		next(context.poker_hands["thac_little_griffon"]) or
		next(context.poker_hands["thac_big_griffon"])--]]
	)
end

function func.context_check_castle(context)
	return context.scoring_hand and (
		next(context.poker_hands["thac_castle"]) --[[or
		next(context.poker_hands["thac_castle_stone"]) or
		next(context.poker_hands["thac_castle_glass"]) or
		next(context.poker_hands["thac_castle_steel"]) or
		next(context.poker_hands["thac_castle_gold"]) or
		next(context.poker_hands["thac_castle_rusty"]) or
		next(context.poker_hands["thac_castle_sand"]) or
		next(context.poker_hands["thac_castle_grass"]) or
		next(context.poker_hands["thac_castle_dirt"]) or
		next(context.poker_hands["thac_castle_bone"]) or
		next(context.poker_hands["thac_castle_jewel"])--]]
	)
end

--[[ preserved for historical reasons
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
end--]]

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