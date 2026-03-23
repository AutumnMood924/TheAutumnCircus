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
            --graveyard = true,
        },
        amm_suit_levels = true,
		amm_graveyard = true,
		--amm_plusmult = true,
	}
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