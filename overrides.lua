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
-- Also roll stamps for jokers
local alias__create_card = create_card;
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local area = area or G.jokers
    local center = G.P_CENTERS.b_red
	
	local card = alias__create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	
	if _type == 'Tarot' and card.config.center.key == 'c_Thac_joker_tarot' then
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

--[[
local alias__Card_generate_UIBox_ability_table = Card.generate_UIBox_ability_table;
function Card:generate_UIBox_ability_table()
	local ret = alias__Card_generate_UIBox_ability_table(self)
	
	local center_obj = self.config.center
	
	if center_obj and center_obj.discovered and center_obj.subtitle then
	
		if ret.name and ret.name ~= true then
			local text = ret.name
			
			text[1].config.object.text_offset.y = text[1].config.object.text_offset.y - 14
			ret.name = {{n=G.UIT.R, config={align = "cm"},nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes=text},
				{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.O, config={object = DynaText({string = center_obj.subtitle, colours = {G.C.WHITE},float = true, shadow = true, offset_y = 0.1, silent = true, spacing = 1, scale = 0.33*0.7})}}
				}}
			}}}
		end
	
	end
	
	return ret
end]]

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

local alias__Game_init_game_object = Game.init_game_object;
function Game:init_game_object()
	local ret = alias__Game_init_game_object(self)
	for _,suit in ipairs(SMODS.Suit.obj_buffer) do
		ret.thac_data.suit_levels[suit] = {
			level = 1,
			mult = 0,
			chips = 0,
		}
	end
	return ret
end

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
			elseif G.GAME.modifiers.thac_alpha_deck then
				if (v.base.suit ~= "thac_Life" and v.base.suit ~= "thac_Hope" and v.base.suit ~= "thac_Void" and v.base.suit ~= "thac_Heart") or TheAutumnCircus.config.starting_deck.allowed_ranks[v.base.value] == false then
					table.insert(todelete, v)
				end
			elseif G.GAME.modifiers.thac_beta_deck then
				if (v.base.suit ~= "thac_Breath" and v.base.suit ~= "thac_Space" and v.base.suit ~= "thac_Light" and v.base.suit ~= "thac_Time") or TheAutumnCircus.config.starting_deck.allowed_ranks[v.base.value] == false then
					table.insert(todelete, v)
				end
			elseif G.GAME.modifiers.thac_omega_deck then
				if (v.base.suit ~= "thac_Blood" and v.base.suit ~= "thac_Rage" and v.base.suit ~= "thac_Doom" and v.base.suit ~= "thac_Heart") or TheAutumnCircus.config.starting_deck.allowed_ranks[v.base.value] == false then
					table.insert(todelete, v)
				end
			elseif G.GAME.modifiers.thac_progenitor_deck then
				if (v.base.suit ~= "thac_Time" and v.base.suit ~= "thac_Breath" and v.base.suit ~= "thac_Doom" and v.base.suit ~= "thac_Blood" and v.base.suit ~= "thac_Heart" and v.base.suit ~= "thac_Space" and v.base.suit ~= "thac_Mind" and v.base.suit ~= "thac_Light" and v.base.suit ~= "thac_Void" and v.base.suit ~= "thac_Rage" and v.base.suit ~= "thac_Hope" and v.base.suit ~= "thac_Life") or TheAutumnCircus.config.starting_deck.allowed_ranks[v.base.value] == false then
					table.insert(todelete, v)
				end
			elseif TheAutumnCircus.config.starting_deck.allowed_suits[v.base.suit] == false or TheAutumnCircus.config.starting_deck.allowed_ranks[v.base.value] == false then
				table.insert(todelete, v)
			end
			if easy_spectra and type(easy_spectra) == 'function' and easy_spectra() then
				if TheAutumnCircus.config.enabled_hands.spectrumblaze then
					G.GAME.hands["thac_spectrumblaze"].visible = true
					G.GAME.hands["thac_spectrumblaze"].mult = 3
					G.GAME.hands["thac_spectrumblaze"].chips = 30
					G.GAME.hands["thac_spectrumblaze"].l_mult = 3
					G.GAME.hands["thac_spectrumblaze"].l_chips = 20
				end
				if TheAutumnCircus.config.enabled_hands.skeet_spectrum then
					G.GAME.hands["thac_skeet_spectrum"].visible = true
					G.GAME.hands["thac_skeet_spectrum"].mult = 5
					G.GAME.hands["thac_skeet_spectrum"].chips = 35
					G.GAME.hands["thac_skeet_spectrum"].l_mult = 4
					G.GAME.hands["thac_skeet_spectrum"].l_chips = 30
				end
				if TheAutumnCircus.config.enabled_hands.spectrumblaze_house then
					G.GAME.hands["thac_spectrumblaze_house"].visible = true
					G.GAME.hands["thac_spectrumblaze_house"].mult = 8
					G.GAME.hands["thac_spectrumblaze_house"].chips = 85
					G.GAME.hands["thac_spectrumblaze_house"].l_mult = 4
					G.GAME.hands["thac_spectrumblaze_house"].l_chips = 40
				end
				if TheAutumnCircus.config.enabled_hands.spectrumblaze_five then
					G.GAME.hands["thac_spectrumblaze_five"].visible = true
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

local alias__Card_set_ability = Card.set_ability;
function Card:set_ability(center,initial,delay_sprites)
    alias__Card_set_ability(self,center,initial,delay_sprites)
	
	if center and center.pos then
        self.T.h = self.T.h * (center.pos.scale_h or 1)
        self.T.w = self.T.w * (center.pos.scale_w or 1)
	end
end

local alias__Card_load = Card.load;
function Card:load(cardTable, other_card)
    alias__Card_load(self,cardTable,other_card)
	
	if center and center.pos then
        self.T.h = G.CARD_H * (center.pos.scale_h or 1)
        self.T.w = G.CARD_W * (center.pos.scale_w or 1)
	end
    self.VT.h = self.T.h
    self.VT.w = self.T.w
end

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
end

local alias__Card_get_chip_bonus = Card.get_chip_bonus;
function Card:get_chip_bonus()
    if self.debuff then return 0 end
    local ret = alias__Card_get_chip_bonus(self)
	if G.GAME.thac_data.suit_levels[self.base.suit] and self.ability.effect ~= 'Stone Card' and (not self.config.center.no_suit) then
		ret = ret + G.GAME.thac_data.suit_levels[self.base.suit].chips
	end
	return ret
end

local alias__Card_get_chip_mult = Card.get_chip_mult;
function Card:get_chip_mult()
    if self.debuff then return 0 end
    local ret = alias__Card_get_chip_mult(self)
	if G.GAME.thac_data.suit_levels[self.base.suit] and self.ability.effect ~= 'Stone Card' and (not self.config.center.no_suit) then
		ret = ret + G.GAME.thac_data.suit_levels[self.base.suit].mult
	end
	return ret
end

------------------------------------------------------------------------
--- SUIT LEVEL PAGE

function create_UIBox_current_suits(simple)
	G.current_suits = {}
	local index = 0
	
	local counts = TheAutumnCircus.func.count_deck_suits()
	
	for i=#SMODS.Suit.obj_buffer,1,-1 do
		local v = SMODS.Suit.obj_buffer[i]
		local ui_element = create_UIBox_current_suit_row(v, simple, counts[v])
		G.current_suits[index + 1] = ui_element
		if ui_element then
			index = index + 1
		end
		if index >= 10 then
			break
		end
	end

	local visible_suits = {}
	for i=#SMODS.Suit.obj_buffer,1,-1 do
		local v = SMODS.Suit.obj_buffer[i]
		if (counts[v] and counts[v] > 0) or (G.GAME.thac_data.suit_levels[suit] and G.GAME.thac_data.suit_levels[suit].level > 1) or (v == "Spades" or v == "Hearts" or v == "Clubs" or v == "Diamonds") then
			table.insert(visible_suits, v)
		end
	end

	local suit_options = {}
	for i = 1, math.ceil(#visible_suits / 10) do
		table.insert(suit_options,
			localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#visible_suits / 10)))
	end

	local object = {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0.04 },
				nodes = G.current_suits
			},
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0 },
				nodes = {
					create_option_cycle({
						options = suit_options,
						w = 4.5,
						cycle_shoulders = true,
						opt_callback = 'your_suits_page',
						focus_args = { snap_to = true, nav = 'wide' },
						current_option = 1,
						colour = G.C.RED,
						no_pips = true
					})
				}
			}
		}
	}

	local t = {
		n = G.UIT.ROOT,
		config = { align = "cm", minw = 3, padding = 0.1, r = 0.1, colour = G.C.CLEAR },
		nodes = {
			{
				n = G.UIT.O,
				config = {
					id = 'hand_list',
					object = UIBox {
						definition = object,
						config = { offset = { x = 0, y = 0 }, align = 'cm' }
					}
				}
			}
		}
	}
	return t
end

G.FUNCS.current_suits = function(e, simple)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = create_UIBox_current_suits(simple),
  }
end

G.FUNCS.your_suits_page = function(args)
	if not args or not args.cycle_config then return end
	G.current_suits = {}
	
	local counts = TheAutumnCircus.func.count_deck_suits()

	local index = 0
	for i=#SMODS.Suit.obj_buffer,1,-1 do
		local v = SMODS.Suit.obj_buffer[i]
		local ui_element = create_UIBox_current_suit_row(v, simple, counts[v])
		if index >= (0 + 10 * (args.cycle_config.current_option - 1)) and index < 10 * args.cycle_config.current_option then
			G.current_suits[index - (10 * (args.cycle_config.current_option - 1)) + 1] = ui_element
		end

		if ui_element then
			index = index + 1
		end

		if index >= 10 * args.cycle_config.current_option then
			break
		end
	end

	local visible_suits = {}
	for i=#SMODS.Suit.obj_buffer,1,-1 do
		local v = SMODS.Suit.obj_buffer[i]
		if (counts[v] and counts[v] > 0) or (G.GAME.thac_data.suit_levels[suit] and G.GAME.thac_data.suit_levels[suit].level > 1) or (v == "Spades" or v == "Hearts" or v == "Clubs" or v == "Diamonds") then
			table.insert(visible_suits, v)
		end
	end

	local suit_options = {}
	for i = 1, math.ceil(#visible_suits / 10) do
		table.insert(suit_options,
			localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#visible_suits / 10)))
	end

	local object = {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0.04 },
				nodes = G.current_suits
			},
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0 },
				nodes = {
					create_option_cycle({
						options = suit_options,
						w = 4.5,
						cycle_shoulders = true,
						opt_callback =
						'your_suits_page',
						focus_args = { snap_to = true, nav = 'wide' },
						current_option = args.cycle_config.current_option,
						colour = G
							.C.RED,
						no_pips = true
					})
				}
			}
		}
	}

	-- dunno what any of this does but it doesn't break if i don't touch it so
	local hand_list = G.OVERLAY_MENU:get_UIE_by_ID('hand_list')
	if hand_list then
		if hand_list.config.object then
			hand_list.config.object:remove()
		end
		hand_list.config.object = UIBox {
			definition = object,
			config = { offset = { x = 0, y = 0 }, align = 'cm', parent = hand_list }
		}
	end
end

function create_UIBox_current_suit_row(suit, simple, count)
	count = count or 0
  return (count > 0 or G.GAME.thac_data.suit_levels[suit].level > 1) and
  (not simple and
    {n=G.UIT.R, config={align = "cm", padding = 0.05, r = 0.1, colour = darken(G.C.SUITS[suit], 0.1), emboss = 0.05, hover = true, force_focus = true}, nodes={
      {n=G.UIT.C, config={align = "cl", padding = 0, minw = 5}, nodes={
        {n=G.UIT.C, config={align = "cm", padding = 0.01, r = 0.1, colour = G.C.HAND_LEVELS[math.min(7, G.GAME.thac_data.suit_levels[suit].level)], minw = 1.5, outline = 0.8, outline_colour = lighten(G.C.SUITS[suit], 0.4)}, nodes={
          {n=G.UIT.T, config={text = localize('k_level_prefix')..G.GAME.thac_data.suit_levels[suit].level, scale = 0.5, colour = G.C.UI.TEXT_DARK}}
        }},
        {n=G.UIT.C, config={align = "cm", minw = 4.5, maxw = 4.5}, nodes={
          {n=G.UIT.T, config={text = ' '..localize(suit,'suits_plural'), scale = 0.45, colour = lighten(G.C.SUITS[suit], 0.8), shadow = true}}
        }}
      }},
      {n=G.UIT.C, config={align = "cm", padding = 0.05, colour = darken(G.C.SUITS[suit], 0.6),r = 0.1}, nodes={
        {n=G.UIT.C, config={align = "cr", padding = 0.01, r = 0.1, colour = G.C.CHIPS, minw = 1.1}, nodes={
          {n=G.UIT.T, config={text = G.GAME.thac_data.suit_levels[suit].chips, scale = 0.45, colour = G.C.UI.TEXT_LIGHT}},
          {n=G.UIT.B, config={w = 0.08, h = 0.01}}
        }},
        {n=G.UIT.T, config={text = "X", scale = 0.45, colour = G.C.SUITS[suit]}},
        {n=G.UIT.C, config={align = "cl", padding = 0.01, r = 0.1, colour = G.C.MULT, minw = 1.1}, nodes={
          {n=G.UIT.B, config={w = 0.08,h = 0.01}},
          {n=G.UIT.T, config={text = G.GAME.thac_data.suit_levels[suit].mult, scale = 0.45, colour = G.C.UI.TEXT_LIGHT}}
        }}
      }},
      {n=G.UIT.C, config={align = "cm"}, nodes={
          {n=G.UIT.T, config={text = '  #', scale = 0.45, colour = lighten(G.C.SUITS[suit],0.6), shadow = true}}
        }},
      {n=G.UIT.C, config={align = "cm", padding = 0.05, colour = darken(G.C.SUITS[suit],0.5),r = 0.1, minw = 0.9}, nodes={
        {n=G.UIT.T, config={text = ""..count, scale = 0.45, colour = lighten(G.C.SUITS[suit],0.4), shadow = true}},
      }}
    }}
  or {n=G.UIT.R, config={align = "cm", padding = 0.05, r = 0.1, colour = darken(G.C.SUITS[suit], 0.1), force_focus = true, emboss = 0.05, hover = true, focus_args = {snap_to = (simple and suit == SMODS.Suit.obj_buffer[#SMODS.Suit.obj_buffer])}}, nodes={
    {n=G.UIT.C, config={align = "cm", padding = 0, minw = 5}, nodes={
        {n=G.UIT.T, config={text = localize(suit,'suits_plural'), scale = 0.5, colour = lighten(G.C.SUITS[suit], 0.4), shadow = true}}
    }}
  }})
  or nil
end

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