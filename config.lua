local config = {
	enabled_modules = {
		dankranks = false,
		moreconsumables = true,
		vouchme = true,
		jokerstamps = true,
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
	enabled_vouchers = {
		spectral_merchant = true,
		spectral_tycoon = true,
		-- following requires jokerstamps
		stamp_savvy = true,
		stamp_coupon = true,
	},
	enabled_seals = {
		jimbo = true,
		todd = true,
		steven = true,
		chaos = true,
		andy = true,
	},
	testing_kit = false,
}

return config