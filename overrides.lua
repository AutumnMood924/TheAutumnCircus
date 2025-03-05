-- This file doesn't need to return anything

--[[
local alias__Card_Character_init = Card_Character.init;
function Card_Character:init(args)
	args.center = G.P_CENTERS.j_merry_andy
	return alias__Card_Character_init(self, args)
end]]

--[[
local alias__Card_draw = Card.draw;
function Card:draw(layer)
    if (layer == 'card' or layer == 'both') then
		if self.sprite_facing == 'front' then
			if self.config.center.key == 'c_Thac_power_chip' then
				self.children.center:draw_shader('booster', nil, self.ARGS.send_to_shader)
			end
		end
	end
	return alias__Card_draw(self, layer)
end]]

--[[local alias__create_UIBox_current_hand_row = create_UIBox_current_hand_row;
function create_UIBox_current_hand_row(handname, simple)
	return TheAutumnCircus.func.scale_nodes(alias__create_UIBox_current_hand_row(handname, simple), 1.0, {no_w = false})
end--]]

local alias__G_FUNCS_HUD_blind_debuff_prefix = G.FUNCS.HUD_blind_debuff_prefix
G.FUNCS.HUD_blind_debuff_prefix = function(e)
  if (G.GAME.blind and G.GAME.blind.name == 'Jera' and not G.GAME.blind.disabled) or
    e.config.id == 'bl_thac_jera' then
    e.config.ref_table.val = ''..G.GAME.probabilities.normal
    e.config.scale = 0.32
  else
    alias__G_FUNCS_HUD_blind_debuff_prefix(e)
  end
end

-- Hook into this to roll editions for Joker (tarot)
-- Also roll stamps for jokers if stamp savvy is taken
local alias__create_card = create_card;
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local area = area or G.jokers
    local center = G.P_CENTERS.b_red
	
	local card = alias__create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	
	if _type == 'Tarot' and card.config.center.key == 'c_thac_joker' then
        local edition = poll_edition('edi'..(key_append or '')..G.GAME.round_resets.ante)
        card:set_edition(edition)
        check_for_unlock({type = 'have_edition'})
	end
	
	if _type == 'Joker' and G.GAME.used_vouchers.v_thac_stamp_savvy and not card.seal then
		local odds = pseudorandom(pseudoseed('joker_seal_odds'))
		if odds < 3/10 then
            local keyset={}
            local n=0

            for k,v in pairs(SMODS.Stamps) do
                n=n+1
                keyset[n]=k
            end

			card:set_seal(pseudorandom_element(keyset, pseudoseed("joker_seal")))
		end
	end
	
	return card
end


-- Chaos' Stamp's effect
local alias__check_for_unlock = check_for_unlock;
function check_for_unlock(args)
	if args.type == 'round_win' then
		local bonus_jollars = 0
		
		for i=1, #G.jokers.cards do
			local card = G.jokers.cards[i]
			if card:get_seal() == "thac_chaos" then
				ease_dollars(4)
				card_eval_status_text(card, 'dollars', 4)
				delay(0.2)
				--card:juice_up()
			end
		end
	end
	alias__check_for_unlock(args)
end

-- Mr. Bones' Stamp's effect
-- Also Wheel of Wheel of Fortune
local alias__new_round = new_round;
function new_round()
	alias__new_round()
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
			
			local score_mult = 1
			
			for i=1, #G.jokers.cards do
				local card = G.jokers.cards[i]
				if card:get_seal() == "thac_mr_bones" then
					score_mult = score_mult * 0.85
					card:juice_up()
				end
			end
			
			
			G.GAME.blind.chips = math.floor(G.GAME.blind.chips * score_mult)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
			G.HUD_blind:recalculate() 
			G.hand_text_area.blind_chips:juice_up()
			play_sound('chips2')
			
			if G.GAME.wheel_of_wheel_of_fortune == true then
				local probability = G.GAME.probabilities.normal
				local odds = pseudorandom(pseudoseed('wheel_of_wheel_of_fortune'))
				if odds < probability/4 then
					local negative = false
					if G.GAME.ceaseless_wheel == true then
						odds = pseudorandom(pseudoseed('ceaseless_wheel'))
						if odds < probability/4 then
							negative = true
						end
					end
					if negative or #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						play_sound('timpani')
						local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, "c_wheel_of_fortune", nil)
						if negative then
							card:set_edition({negative = true}, true)
						end
						card:add_to_deck()
						G.consumeables:emplace(card)
					end
				end
			end
			
            return true
            end
        }))
end

--[[ OH MY GOD IF THIS WORKS YALL ARE COOKED (it doesnt)
local trackerCalculateJoker = false

local alias__Card_calculate_joker = Card.calculate_joker;
function Card:calculate_joker(context)
	if self.debuff then return nil end
	local ret = alias__Card_calculate_joker(self, context)
	local ret2 = nil
	if ret and self:get_seal() == "Chaos" and not trackerCalculateJoker and not context.blueprint then
		trackerCalculateJoker = true
		ret2 = self:calculate_joker(context)
		if ret.repetitions then
			ret2.repetitions = ret2.repetitions + ret.repetitions
		elseif context.other_card then
			TheAutumnCircus.func.eval_this(context.other_card, {mult_mod = normalEffect.mult, chip_mod = normalEffect.chips, Xmult_mod = normalEffect.x_mult})
		else
			TheAutumnCircus.func.eval_this(self, ret)
		end
		card_eval_status_text(self, 'jokers', nil, nil, nil, {message=localize('k_again_ex'), card=self})
		trackerCalculateJoker = false
	end
	return ret2 or ret
end--]]

-- overriden for testing
local alias__Game_start_run = Game.start_run;
function Game:start_run(args)
	local ret = alias__Game_start_run(self, args)
	
	if not args.savetext then
		local todelete = {}
		for k, v in ipairs(G.playing_cards) do
			if G.GAME.modifiers.thac_arcane_deck then
				if (v.base.suit ~= "thac_Cups" and v.base.suit ~= "thac_Swords" and v.base.suit ~= "thac_Coins" and v.base.suit ~= "thac_Wands") or TheAutumnCircus.config.starting_deck.allowed_ranks[v.base.value] == false then
					table.insert(todelete, v)
				end
			elseif TheAutumnCircus.config.starting_deck.allowed_suits[v.base.suit] == false or TheAutumnCircus.config.starting_deck.allowed_ranks[v.base.value] == false then
				table.insert(todelete, v)
			end
			if easy_spectra and type(easy_spectra) == 'function' and easy_spectra() then
				if TheAutumnCircus.config.enabled_hands.spectrumblaze then
					G.GAME.hands["thac_spectrumblaze"].visible = not TheAutumnCircus.config.mechanics.all_hands_are_secret
					G.GAME.hands["thac_spectrumblaze"].mult = 3
					G.GAME.hands["thac_spectrumblaze"].chips = 30
					G.GAME.hands["thac_spectrumblaze"].l_mult = 3
					G.GAME.hands["thac_spectrumblaze"].l_chips = 20
				end
				if TheAutumnCircus.config.enabled_hands.skeet_spectrum then
					G.GAME.hands["thac_skeet_spectrum"].visible = not TheAutumnCircus.config.mechanics.all_hands_are_secret
					G.GAME.hands["thac_skeet_spectrum"].mult = 5
					G.GAME.hands["thac_skeet_spectrum"].chips = 35
					G.GAME.hands["thac_skeet_spectrum"].l_mult = 4
					G.GAME.hands["thac_skeet_spectrum"].l_chips = 30
				end
				if TheAutumnCircus.config.enabled_hands.spectrumblaze_house then
					G.GAME.hands["thac_spectrumblaze_house"].visible = not TheAutumnCircus.config.mechanics.all_hands_are_secret
					G.GAME.hands["thac_spectrumblaze_house"].mult = 8
					G.GAME.hands["thac_spectrumblaze_house"].chips = 85
					G.GAME.hands["thac_spectrumblaze_house"].l_mult = 4
					G.GAME.hands["thac_spectrumblaze_house"].l_chips = 40
				end
				if TheAutumnCircus.config.enabled_hands.spectrumblaze_five then
					G.GAME.hands["thac_spectrumblaze_five"].visible = not TheAutumnCircus.config.mechanics.all_hands_are_secret
					G.GAME.hands["thac_spectrumblaze_five"].mult = 15
					G.GAME.hands["thac_spectrumblaze_five"].chips = 130
					G.GAME.hands["thac_spectrumblaze_five"].l_mult = 3
					G.GAME.hands["thac_spectrumblaze_five"].l_chips = 45
				end
			end
		end
		for i=#todelete, 1, -1 do
			todelete[i]:remove()
		end
		self.GAME.starting_deck_size = #G.playing_cards
	end
	if not args.savetext and TheAutumnCircus.config.testing_kit then
		local testing_cards = {
			{"Joker", "j_joker", "thac_jimbo"},
			{"Joker", "j_odd_todd", "thac_steven"},
			{"Joker", "j_even_steven", "thac_todd"},
			{"Joker", "j_chaos", "thac_chaos"},
			{"Joker", "j_mr_bones", "thac_mr_bones"},
			{"Joker", "j_merry_andy", "thac_andy"},
		}
		for i=1, #testing_cards do
			local targetarea = G.jokers
			
			local card = create_card(testing_cards[i][1], targetarea, nil, nil, nil, nil, testing_cards[i][2], 'deck')
			card:add_to_deck()
			card:set_seal(testing_cards[i][3])
			targetarea:emplace(card)
		end
		
		G.GAME.used_vouchers['v_thac_stamp_savvy'] = true
		G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
		Card.apply_to_run(nil, G.P_CENTERS['v_thac_stamp_savvy'])
		G.GAME.used_vouchers['v_thac_stamp_coupon'] = true
		G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
		Card.apply_to_run(nil, G.P_CENTERS['v_thac_stamp_coupon'])
	end
	if not args.savetext and TheAutumnCircus.config.test_hands then
		for k,v in pairs(G.GAME.hands) do
			v.visible = true
		end
	end
	return ret
end
--[[
local alias__Card_set_sprites = Card.set_sprites;
function Card:set_sprites(_center, _front)
	alias__Card_set_sprites(self, _center, _front)
    if _center then
		if _center and _center.pos then
			self.children.center.scale.x = self.children.center.scale.x * (_center.pos.scale_w or 1)
			self.children.center.scale.y = self.children.center.scale.y * (_center.pos.scale_h or 1)
		end
    end
	local suit = (_front and _front.suit) or (self.base and self.base.suit)
	if suit and SMODS.Suits[suit] and SMODS.Suits[suit].center_override and type(SMODS.Suits[suit].center_override) == "function" then
		SMODS.Suits[suit].center_override(self, _center, _front)
	end
end--]]

------------------------------------------------------------------------
--- Sock and Buskin Stamp

local alias__SMODS_calculate_retriggers = SMODS.calculate_retriggers
SMODS.calculate_retriggers = function(card, context, _ret)
    local retriggers = alias__SMODS_calculate_retriggers(card, context, _ret)
	if card:get_seal() == "thac_sock_and_buskin" then
		retriggers[#retriggers+1] = {repetitions = 1, colour = G.C.ORANGE, message = localize('k_again_ex')}
	end
    return retriggers
end