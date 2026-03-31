TheAutumnCircus = {}
TheAutumnCircus.INIT = {}

TheAutumnCircus.mod_id = 'TheAutumnCircus'
TheAutumnCircus.mod_prefix = 'thac'

TheAutumnCircus.mod = SMODS.current_mod
local version = "0.0."
for i = 1, 99 do
        version = version.."9"
end
TheAutumnCircus.mod.version = version

TheAutumnCircus.mod.ui_config = {
    colour = HEX('00164F'),
    bg_colour = HEX('ffaec999'),
    back_colour = HEX('46fbc4'),
	outline_colour = HEX('46fbc4'),
    tab_button_colour = HEX('bd1864'),
    collection_option_cycle_colour = HEX('fff200'),
    author_outline_colour = HEX('00000000'),
}

TheAutumnCircus.mod.optional_features = function()
	return {
		retrigger_joker = true,
        --quantum_enhancements = true,
		post_trigger = true,
        cardareas = {
            unscored = true,
            graveyard = true,
        },
        amm_suit_levels = true,
		amm_graveyard = true,
		--amm_plusmult = true,
	}
end

TheAutumnCircus.mod.calculate = function(self, context)
	if context.first_hand_drawn then
		for _,card in ipairs(G.graveyard) do
			if card.config.center.key == "m_thac_mist" then
				local _card = copy_card(card)
				_card.states.visible = false
				_card:set_ability(G.P_CENTERS["m_thac_tempmist"])
				G.playing_card = (G.playing_card and G.playing_card + 1) or 1
				_card.playing_card = G.playing_card
				table.insert(G.playing_cards, _card)

				G.E_MANAGER:add_event(Event({
					delay = 0.1, trigger = 'after', func = function()
						G.hand:emplace(_card)
						_card:start_materialize({G.C.JOKER_GREY})
						G.GAME.blind:debuff_card(_card)
						G.hand:sort()
						--SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
						save_run()
						return true
					end
				}))
			end
		end
	end
	if context.end_of_round and context.main_eval then
		local kill = {}
		for k,v in ipairs(G.playing_cards) do
			if v.config.center.key == "m_thac_tempmist" then
				kill[#kill+1] = v
			end
		end
		for i=#kill,1,-1 do
			G.E_MANAGER:add_event(Event({
				delay = 0.1, trigger = 'after', func = function()
		--print(context)
					kill[i]:start_dissolve({G.C.JOKER_GREY}, nil, 0.33, true)
					return true
				end
			}))
		end
	end
	if context.before then
		for k,card in ipairs(G.play.cards) do
			if SMODS.in_scoring(card, context.scoring_hand) and card.base.id == SMODS.Ranks["thac_wand"].id and not SMODS.has_no_rank(card) then
				AMM.level_up_suit(card, card.base.suit)
				update_hand_text({delay = 0}, {handname = localize(context.scoring_name, "poker_hands"),chips = hand_chips, mult = mult, level = nil })
			end
		end
	end
	if context.individual and context.cardarea == G.play and context.other_card.base.id == SMODS.Ranks["thac_vessel"].id and not SMODS.has_no_rank(context.other_card) then
		local amount = 2
		return {
			func = function()
                G.hand:change_size(amount)
                G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + amount
			end,
			card = context.other_card,
			focus = context.other_card,
			message = localize{type='variable',key=amount > 0 and 'a_thac_handsize' or "a_thac_handsize_minus",vars={math.abs(amount)}},
			colour = G.C.PURPLE
		}
	end
end

TheAutumnCircus.mod.process_loc_text = function()
	G.localization.descriptions.Other["thac_standard_hands"] = {
        name = "Standard Hands",
        text = {
            '{C:attention}"Standard hands"{} refers to',
            "each of the following hands:",
            "{C:attention}High Card{}, {C:attention}Pair{}, {C:attention}Two Pair{},",
            "{C:attention}Three of a Kind{}, {C:attention}Straight{},",
            "{C:attention}Flush{}, {C:attention}Full House{},",
            "{C:attention}Four of a Kind{}, {C:attention}Straight Flush{}",
        }
    }

    G.localization.descriptions.thacmeta = {
        jevonn = {
            name = "Art Credit",
            text = {
                "{X:jevonn,C:dark_edition,s:1.2}Jevonn{}"
            }
        },
        fritz = {
            name = "Art Credit",
            text = {
                "{X:fritz,C:dark_edition,s:1.2}Fritz Lancastor{}"
            }
        },
        autumn = {
            name = "Art Credit",
            text = {
                "{X:autumn,C:money,s:1.2}AutumnMood{}"
            }
        },
        astro = {
            name = "Art Credit",
            text = {
                "{X:black,C:astro,s:1.2}Astro{}"
            }
        },
    }
	G.localization.descriptions.Other["thac_shadercredit_autumn"] = {
        name = "Shader Credit",
        text = {
            "{X:autumn,C:money}AutumnMood{}"
        }
    }
	
	
	G.localization.misc.dictionary["k_thac_shuffle"] = "Shuffled!"
	G.localization.misc.v_dictionary["a_thac_reduced"] = "Blind -#1#%"
	
end

TheAutumnCircus.config = NFS.load(TheAutumnCircus.mod.path.."config.lua")()

NFS.load(TheAutumnCircus.mod.path.."overrides.lua")()
TheAutumnCircus.func = NFS.load(TheAutumnCircus.mod.path.."func.lua")()
TheAutumnCircus.data = NFS.load(TheAutumnCircus.mod.path.."data.lua")()

-- I know this can be done better but i really just don't care right now
if TheAutumnCircus.config.enabled_modules.lookslikethejokers then
	TheAutumnCircus.LLTJ = NFS.load(TheAutumnCircus.mod.path.."modules/LooksLikeTheJokers.lua")()
	NFS.load(TheAutumnCircus.mod.path.."modules/TheAutumnQuips.lua")()
end
if TheAutumnCircus.config.enabled_modules.moreconsumables then
	TheAutumnCircus.MC = NFS.load(TheAutumnCircus.mod.path.."modules/MoreConsumables.lua")()
end
if TheAutumnCircus.config.enabled_modules.jokerstamps then
	TheAutumnCircus.JS = NFS.load(TheAutumnCircus.mod.path.."modules/JokerStamps.lua")()
end
if TheAutumnCircus.config.enabled_modules.dankranks then
	TheAutumnCircus.DR = NFS.load(TheAutumnCircus.mod.path.."modules/DankRanks.lua")()	
end
if TheAutumnCircus.config.enabled_modules.vouchme then
	TheAutumnCircus.VM = NFS.load(TheAutumnCircus.mod.path.."modules/VouchMe.lua")()	
end
if TheAutumnCircus.config.enabled_modules.deckthebalatro then
	TheAutumnCircus.DTB = NFS.load(TheAutumnCircus.mod.path.."modules/DeckTheBalatro.lua")()	
end
if TheAutumnCircus.config.enabled_modules.blindtoallbutthevideo then
	TheAutumnCircus.BTABTV = NFS.load(TheAutumnCircus.mod.path.."modules/BlindToAllButTheVideo.lua")()	
end
if TheAutumnCircus.config.enabled_modules.tagimit then
	TheAutumnCircus.TII = NFS.load(TheAutumnCircus.mod.path.."modules/TagImIt.lua")()	
end
if TheAutumnCircus.config.enabled_modules.emojiokers then
	TheAutumnCircus.EJ = NFS.load(TheAutumnCircus.mod.path.."modules/Emojiokers.lua")()	
end
if TheAutumnCircus.config.enabled_modules.basicoddities then
	TheAutumnCircus.BO = NFS.load(TheAutumnCircus.mod.path.."modules/BasicOddities.lua")()	
end
if TheAutumnCircus.config.enabled_modules.enhancable then
	TheAutumnCircus.EA = NFS.load(TheAutumnCircus.mod.path.."modules/Enhancable.lua")()	
end
if TheAutumnCircus.config.enabled_modules.transgirlswhobooster then
	TheAutumnCircus.TGWB = NFS.load(TheAutumnCircus.mod.path.."modules/TransGirlsWhoBooster.lua")()	
end
if TheAutumnCircus.config.enabled_modules.hamspect then
	TheAutumnCircus.HS = NFS.load(TheAutumnCircus.mod.path.."modules/HamSpect.lua")()	
end


-- Run INIT functions
for _, v in pairs(TheAutumnCircus.INIT) do
	if v and type(v) == 'function' then v() end
end

-- yes i am in fact loading this twice
SMODS.Atlas{
	key = "modicon",
	path = "ShowdownThrowdown.png",
	px = 34,
	py = 34,
	frames = 21,
	atlas_table = "ANIMATION_ATLAS",
}

-- Register game objects
TheAutumnCircus.data.register_objects()