--- STEAMODDED HEADER
--- MOD_NAME: The Autumn Circus
--- MOD_ID: TheAutumnCircus
--- MOD_AUTHOR: [AutumnMood]
--- MOD_DESCRIPTION: Welcome to The Autumn Circus!
--- BADGE_COLOUR: 898945
--- DISPLAY_NAME: TheAutumnCircus

----------------------------------------------
------------MOD CODE -------------------------

-- Art for basically everything done by spike berd

TheAutumnCircus = {}
TheAutumnCircus.INIT = {}

TheAutumnCircus.mod_id = 'TheAutumnCircus'
TheAutumnCircus.mod_prefix = 'Thac_'

function SMODS.INIT.TheAutumnCircus()

	TheAutumnCircus.mod = SMODS.findModByID(TheAutumnCircus.mod_id)

	TheAutumnCircus.config = NFS.load(TheAutumnCircus.mod.path.."config.lua")()

	NFS.load(TheAutumnCircus.mod.path.."overrides.lua")()
	TheAutumnCircus.func = NFS.load(TheAutumnCircus.mod.path.."func.lua")()
	TheAutumnCircus.data = NFS.load(TheAutumnCircus.mod.path.."data.lua")()

	if TheAutumnCircus.config.enabled_modules.moreconsumables then
		TheAutumnCircus.MC = NFS.load(TheAutumnCircus.mod.path.."modules/MoreConsumables.lua")()
	end
	if TheAutumnCircus.config.enabled_modules.jokerstamps then
		TheAutumnCircus.JS = NFS.load(TheAutumnCircus.mod.path.."modules/JokerStamps.lua")()
	end
	if TheAutumnCircus.config.enabled_modules.vouchme then
		TheAutumnCircus.VM = NFS.load(TheAutumnCircus.mod.path.."modules/VouchMe.lua")()	
	end
	if TheAutumnCircus.config.enabled_modules.basicoddities and SMODS.INIT.OddityAPI then
		TheAutumnCircus.BO = NFS.load(TheAutumnCircus.mod.path.."modules/BasicOddities.lua")()	
	end
	if TheAutumnCircus.config.enabled_modules.enhancable and SMODS.INIT.EnhanceAPI then
		TheAutumnCircus.EA = NFS.load(TheAutumnCircus.mod.path.."modules/Enhancable.lua")()	
	end
	
	-- Run INIT functions
	for _, v in pairs(TheAutumnCircus.INIT) do
		if v and type(v) == 'function' then v() end
	end
	
	-- Register game objects
	TheAutumnCircus.data.register_objects()
	
	init_localization()
end

----------------------------------------------
------------MOD CODE END----------------------