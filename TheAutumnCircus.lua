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

	G.localization.misc.labels["thac_gilded"] = "Gilded"

	G.localization.descriptions.Other["mc_obs_off_comet"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Chooses a hand at random,",
			"{C:inactive,s:0.8}then gives {X:mult,C:white,s:0.8} X2.25 {C:inactive,s:0.8} Mult if the",
			"{C:inactive,s:0.8}played hand is that hand"
        }
    }
	G.localization.descriptions.Other["mc_obs_on_comet"] = {
        name = "Observatory Effect",
        text = {
            "Chooses a hand at random,",
			"then gives {X:mult,C:white} X2.25 {} Mult if the",
			"played hand is that hand"
        }
    }
	
	G.localization.descriptions.Other["mc_obs_off_meteor"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Chooses two hands at random,",
			"{C:inactive,s:0.8}then gives {X:mult,C:white,s:0.8} X3.375 {C:inactive,s:0.8} Mult if the",
			"{C:inactive,s:0.8}played hand is the first hand,",
			"{C:inactive,s:0.8}or gives {X:mult,C:white,s:0.8} X0.66 {C:inactive,s:0.8} Mult if the",
			"{C:inactive,s:0.8}played hand is the second hand"
        }
    }
	G.localization.descriptions.Other["mc_obs_on_meteor"] = {
        name = "Observatory Effect",
        text = {
            "Chooses two hands at random,",
			"then gives {X:mult,C:white} X3.375 {} Mult if the",
			"played hand is the first hand,",
			"or gives {X:mult,C:white} X0.66 {} Mult if the",
			"played hand is the second hand"
        }
    }
	
	G.localization.descriptions.Other["mc_obs_off_station"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Gives {X:mult,C:white,s:0.8} X1.5 {C:inactive,s:0.8} Mult if the played",
			"{C:inactive,s:0.8}hand is most played hand",
        }
    }
	G.localization.descriptions.Other["mc_obs_on_station"] = {
        name = "Observatory Effect",
        text = {
            "Gives {X:mult,C:white} X1.5 {} Mult if the played",
			"hand is most played hand",
        }
    }
	
	G.localization.descriptions.Other["mc_obs_off_dysnomia"] = {
        name = "Observatory Effect",
        text = {
			"{s:0.8}Effect is {C:red,s:0.8}inactive{s:0.8}!",
			"{s:0.8}Get the {C:attention,s:0.8}Observatory voucher{s:0.8} for:",
            "{C:inactive,s:0.8}Nothing actually...",
        }
    }
	G.localization.descriptions.Other["mc_obs_on_dysnomia"] = {
        name = "Observatory Effect",
        text = {
            "Nothing actually...",
        }
    }
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
        lyman = {
            name = "Art Credit",
            text = {
                "{X:lyman,C:dark_edition,s:1.2}Lyman{}"
            }
        },
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
	G.localization.descriptions.Other["thac_shadercredit_lyman"] = {
        name = "Shader Credit",
        text = {
            "{X:lyman,C:edition}Lyman{}"
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
if TheAutumnCircus.config.enabled_modules.skinnington then
	TheAutumnCircus.SGTB = NFS.load(TheAutumnCircus.mod.path.."modules/Skinnington.lua")()	
end
if TheAutumnCircus.config.enabled_modules.basicoddities then
	TheAutumnCircus.BO = NFS.load(TheAutumnCircus.mod.path.."modules/BasicOddities.lua")()	
end
if TheAutumnCircus.config.enabled_modules.enhancable then
	TheAutumnCircus.EA = NFS.load(TheAutumnCircus.mod.path.."modules/Enhancable.lua")()	
end
if TheAutumnCircus.config.enabled_modules.editiontomeetya then
	TheAutumnCircus.ETMY = NFS.load(TheAutumnCircus.mod.path.."modules/EditionToMeetYa.lua")()	
end
if TheAutumnCircus.config.enabled_modules.transgirlswhobooster then
	TheAutumnCircus.TGWB = NFS.load(TheAutumnCircus.mod.path.."modules/TransGirlsWhoBooster.lua")()	
end
if TheAutumnCircus.config.enabled_modules.stakemepls then
	TheAutumnCircus.SMP = NFS.load(TheAutumnCircus.mod.path.."modules/StakeMePls.lua")()	
end
if TheAutumnCircus.config.enabled_modules.hamspect then
	TheAutumnCircus.HS = NFS.load(TheAutumnCircus.mod.path.."modules/HamSpect.lua")()	
end


if TheAutumnCircus.config.enabled_modules.bossmyjokers and next(SMODS.find_mod("GrabBag")) then
	TheAutumnCircus.BMJ = NFS.load(TheAutumnCircus.mod.path.."modules/BossMyJokers.lua")()
end
if TheAutumnCircus.config.enabled_modules.shattermyjokersintopieces and next(SMODS.find_mod("GrabBag")) then
	TheAutumnCircus.SMJIP = NFS.load(TheAutumnCircus.mod.path.."modules/ShatterMyJokersIntoPieces.lua")()
end
if TheAutumnCircus.config.enabled_modules.selbamusnocerom and next(SMODS.find_mod("entr")) then
	TheAutumnCircus.CM = NFS.load(TheAutumnCircus.mod.path.."modules/selbamusnoCeroM.lua")()
end
if TheAutumnCircus.config.enabled_modules.threeerror and next(SMODS.find_mod("zeroError")) then
	TheAutumnCircus.THREE = NFS.load(TheAutumnCircus.mod.path.."modules/3ERROR.lua")()
end
if TheAutumnCircus.config.enabled_modules.joyinautumn and next(SMODS.find_mod("JoyousSpring")) then
	TheAutumnCircus.JIA = NFS.load(TheAutumnCircus.mod.path.."modules/JoyInAutumn.lua")()
end
if TheAutumnCircus.config.enabled_modules.effectsonmyjokersitsmorelikelythanyouthink and next(SMODS.find_mod("stacked")) then
	TheAutumnCircus.EOMJIMLTYT = NFS.load(TheAutumnCircus.mod.path.."modules/EffectsOnMyJokersItsMoreLikelyThanYouThink.lua")()
end

NFS.load(TheAutumnCircus.mod.path.."modules/compatibility.lua")()

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