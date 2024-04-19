--- STEAMODDED HEADER
--- MOD_NAME: Þe Autumn Circus
--- MOD_ID: ÞeAutumnCircus
--- MOD_AUTHOR: [AutumnMood]
--- MOD_DESCRIPTION: Welcome to Þe Autumn Circus!
--- BADGE_COLOUR: 898945
--- DISPLAY_NAME: ÞeAutumnCircus

----------------------------------------------
------------MOD CODE -------------------------

-- Art for basically everything done by spike berd

ÞeAutumnCircus = {}
ÞeAutumnCircus.INIT = {}

ÞeAutumnCircus.mod_id = 'ÞeAutumnCircus'
ÞeAutumnCircus.mod_prefix = 'Þac_'

function SMODS.INIT.ÞeAutumnCircus()

	ÞeAutumnCircus.mod = SMODS.findModByID(ÞeAutumnCircus.mod_id)

	ÞeAutumnCircus.config = NFS.load(ÞeAutumnCircus.mod.path.."config.lua")()

	NFS.load(ÞeAutumnCircus.mod.path.."overrides.lua")()
	ÞeAutumnCircus.func = NFS.load(ÞeAutumnCircus.mod.path.."func.lua")()
	ÞeAutumnCircus.data = NFS.load(ÞeAutumnCircus.mod.path.."data.lua")()

	if ÞeAutumnCircus.config.enabled_modules.moreconsumables then
		ÞeAutumnCircus.MC = NFS.load(ÞeAutumnCircus.mod.path.."modules/MoreConsumables.lua")()
	end
	if ÞeAutumnCircus.config.enabled_modules.jokerstamps then
		ÞeAutumnCircus.JS = NFS.load(ÞeAutumnCircus.mod.path.."modules/JokerStamps.lua")()
	end
	if ÞeAutumnCircus.config.enabled_modules.vouchme then
		ÞeAutumnCircus.VM = NFS.load(ÞeAutumnCircus.mod.path.."modules/VouchMe.lua")()	
	end
	
	-- Run INIT functions
	for _, v in pairs(ÞeAutumnCircus.INIT) do
		if v and type(v) == 'function' then v() end
	end
	
	-- Register game objects
	ÞeAutumnCircus.data.register_objects()
	
	init_localization()
end

----------------------------------------------
------------MOD CODE END----------------------