--- STEAMODDED HEADER
--- MOD_NAME: The Autumn Circus
--- MOD_ID: TheAutumnCircus
--- MOD_AUTHOR: [AutumnMood (it/she/they)]
--- MOD_DESCRIPTION: Welcome to The Autumn Circus!
--- BADGE_COLOUR: 898945
--- DISPLAY_NAME: TheAutumnCircus
--- PREFIX: thac
--- PRIORITY: 42

----------------------------------------------
------------MOD CODE -------------------------


TheAutumnCircus = {}
TheAutumnCircus.INIT = {}

TheAutumnCircus.mod_id = 'TheAutumnCircus'
TheAutumnCircus.mod_prefix = 'thac'

TheAutumnCircus.mod = SMODS.current_mod

TheAutumnCircus.mod.optional_features = function()
	return {
		retrigger_joker = true,
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
	G.localization.descriptions.Other["thac_cups_tooltip"] = {
        name = "Flush Effect",
        text = {
            "A {C:attention}Flush{} of {C:cups}Cups{}",
            "gives {C:blue}+1{} Hand",
        }
    }
	G.localization.descriptions.Other["thac_swords_tooltip"] = {
        name = "Flush Effect",
        text = {
            "A {C:attention}Flush{} of {C:thac_swords}Swords{}",
            "gives {X:red,C:white} X2 {} Mult",
        }
    }
	G.localization.descriptions.Other["thac_wands_tooltip"] = {
        name = "Flush Effect",
        text = {
            "A {C:attention}Flush{} of {C:thac_wands}Wands{}",
            "gains {C:blue}+10{} Chips",
			"permanently",
        }
    }
	G.localization.descriptions.Other["thac_coins_tooltip"] = {
        name = "Flush Effect",
        text = {
            "A {C:attention}Flush{} of {C:thac_coins}Coins{}",
            "earns {C:money}$5{}",
        }
    }
	G.localization.descriptions.Other["thac_pickaxes_tooltip"] = {
        name = "Flush Effect",
        text = {
            "A {C:attention}Flush{} of {C:thac_pickaxes}Pickaxes{}",
            "converts all {C:attention}Stone Cards{}",
			"held in hand into {C:attention}Steel Cards{}",
        }
    }
	G.localization.descriptions.Other["card_thac_suit_bonus"] = {
		text = {
			"{s:0.8,C:inactive}({s:0.8,V:2}#4# {s:0.8,V:1}lvl.#1#{s:0.8,C:inactive}) {s:0.8,C:white,X:chips}+#2#{s:0.4} {s:0.8}X{s:0.4} {C:white,X:mult,s:0.8}+#3#{s:0.8}",
		}
	}
	
	
	G.localization.misc.dictionary["b_suits"] = "Suits"
	G.localization.misc.dictionary["k_thac_shuffle"] = "Shuffled!"
	G.localization.misc.v_dictionary["a_thac_reduced"] = "Blind -#1#%"
	
    G.localization.misc.dictionary["ml_stamp_explanation"] = {
                "Jokers may each have one",
                "Edition and Stamp"
            }
	
	-- below from feder's stamps port
    local loc_txt = {
        b_stamps = "Stamps"
    }

    SMODS.process_loc_text(G.localization.misc.dictionary, "b_stamps", loc_txt, "b_stamps")
end

TheAutumnCircus.config = NFS.load(TheAutumnCircus.mod.path.."config.lua")()

NFS.load(TheAutumnCircus.mod.path.."overrides.lua")()
TheAutumnCircus.func = NFS.load(TheAutumnCircus.mod.path.."func.lua")()
TheAutumnCircus.data = NFS.load(TheAutumnCircus.mod.path.."data.lua")()

TheAutumnCircus.api = {}
TheAutumnCircus.api.stamps = NFS.load(TheAutumnCircus.mod.path.."api/Stamps.lua")()

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
if TheAutumnCircus.config.enabled_modules.suitedunimpresseddispleasedoverlord then
	TheAutumnCircus.SUDO = NFS.load(TheAutumnCircus.mod.path.."modules/SuitedUnimpressedDispleasedOverlord.lua")()	
end
if TheAutumnCircus.config.enabled_modules.skinmeadeck then
	TheAutumnCircus.SMAD = NFS.load(TheAutumnCircus.mod.path.."modules/SkinMeADeck.lua")()	
end
if TheAutumnCircus.config.enabled_modules.blindtoallbutthevideo then
	TheAutumnCircus.BTABTV = NFS.load(TheAutumnCircus.mod.path.."modules/BlindToAllButTheVideo.lua")()	
end
if TheAutumnCircus.config.enabled_modules.tagimit then
	TheAutumnCircus.TII = NFS.load(TheAutumnCircus.mod.path.."modules/TagImIt.lua")()	
end
if TheAutumnCircus.config.enabled_modules.retrievehands then
	TheAutumnCircus.RH = NFS.load(TheAutumnCircus.mod.path.."modules/RetrieveHands.lua")()
end
if TheAutumnCircus.config.enabled_modules.basicoddities and OddityAPI then
	TheAutumnCircus.BO = NFS.load(TheAutumnCircus.mod.path.."modules/BasicOddities.lua")()	
end
if TheAutumnCircus.config.enabled_modules.enhancable then
	TheAutumnCircus.EA = NFS.load(TheAutumnCircus.mod.path.."modules/Enhancable.lua")()	
end
if TheAutumnCircus.config.enabled_modules.editiontomeetya then
	TheAutumnCircus.EA = NFS.load(TheAutumnCircus.mod.path.."modules/EditionToMeetYa.lua")()	
end

NFS.load(TheAutumnCircus.mod.path.."modules/compatibility.lua")()

-- Run INIT functions
for _, v in pairs(TheAutumnCircus.INIT) do
	if v and type(v) == 'function' then v() end
end

-- Register game objects
TheAutumnCircus.data.register_objects()

----------------------------------------------
------------MOD CODE END----------------------