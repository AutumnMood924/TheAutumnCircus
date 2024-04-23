local config = {
	enabled_modules = {
		dankranks = false,
		oddityapi = false,
		basicoddities = true,
		gooddesigndecisions = false,
		intelligence = false,
		moreconsumables = true,
		vouchme = true,
		jokerstamps = true,
		enhancable = false, --requires EnhanceAPI to be loaded
	},
	enabled_tarots = {
		universe = true,
		void = true,
		happy_squirrel = true,
		artist = true,
		veteran = true,
		drunkard = true,
		juggler = true,
		joker = true,
	},
	enabled_planets = {
		comet = true,
		meteor = true,
		satellite = true,
		moon = true,
		station = true,
		dysnomia = true,
	},
	enabled_spectrals = {
		chance = true,
		offering = true,
		scry = true,
		phantom = true,
		-- following require jokerstamps and respective stamp if applicable
		mischief = true,
		comedy = true,
		tragedy = true,
		whimsy = true,
		entropy = true,
		wonder = true,
	},
	enabled_oddities = {
		one_jollar = true,
		two_jollar = true,
		five_jollar = true,
		ten_jollar = true,
		twenty_jollar = true,
		pot_of_joker = true,
		green_chip = true,
		yellow_chip = true,
		red_blue_chip = true,
		purple_chip = true,
		power_chip = true,
		silica_packet = true,
		jimbobread_man = true,
		jimbobread_man_half = true,
	},
	enabled_vouchers = {
		spectral_merchant = true,
		spectral_tycoon = true,
		-- following requires jokerstamps
		stamp_savvy = true,
		stamp_coupon = true,
		-- following requires oddityapi
		oddity_merchant = true,
		oddity_tycoon = true,
	},
	enabled_seals = {
		jimbo = true,
		todd = true,
		steven = true,
		chaos = true,
		mrbones = true,
		andy = true,
	},
	enabled_enhancements = {
		grass = true,
	},
	testing_kit = false,
}

return config