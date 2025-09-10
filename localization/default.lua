return {
	misc = {
		dictionary = {
			k_thac_scrapped = "Scrapped!",
			k_thac_planets = "Planets!",
			k_thac_godtier = "God Tier!",
			k_thac_heeheehee = "Hee Hee Hee",
			k_thac_lvup = "LV Up",
			k_thac_negative = "Negative!",
			k_thac_converted = "Converted!",
			k_thac_cawcaw = "CAW CAW!!!!",
			k_thac_active = "ACTIVE!",
			k_thac_owo = "owo",
			k_thac_hubris = "Your hubris exceeds my interest.",
			k_thac_not_fun = "Nah. Not fun anymore.",
			
			k_thac_option_select = "Option Select",
			
			xchips_extra = "Bonus XChips",
			emult_extra = "Bonus ^Mult",
			echips_extra = "Bonus ^Chips",
			ascension_extra = "Bonus Ascension Power",
			numerator_extra = "Numerator Modifier",
			denominator_extra = "Denominator Modifier",
			packopt_extra = "Bonus Booster Cards",
			packsel_extra = "Bonus Booster Choices",
			dollar_eor = "Bonus $ each Round",
			effect_slots_extra = "Maximum Effect Slots",
			potency_extra = "Effect Potency Cap",
			
			k_c_thac_prestige_ante = "Prestige: Ante",
			k_c_thac_prestige_hand = "Prestige: Hand",
			k_c_thac_prestige_discard = "Prestige: Discard",
			k_c_thac_prestige_ascension = "Prestige: Ascension",
			k_c_thac_prestige_energy = "Prestige: Energy",
		},
		v_dictionary = {
			prestige_dollar_eor = "Prestige: $",
			thac_gain_pyrox = "¥#1#",
		},
		labels = {
			thac_breath_aspect = "Breath",
			thac_life_aspect = "Life",
			thac_light_aspect = "Light",
			thac_time_aspect = "Time",
			thac_heart_aspect = "Heart",
			thac_rage_aspect = "Rage",
			thac_blood_aspect = "Blood",
			thac_doom_aspect = "Doom",
			thac_void_aspect = "Void",
			thac_space_aspect = "Space",
			thac_mind_aspect = "Mind",
			thac_hope_aspect = "Hope",
		},
	},
	descriptions = {
		Joker = {
			j_thac_helpful_joker = {
				name = {
					"Helpful Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Played cards with",
					"{C:six_stars}#2#{} suit give",
					"{C:chips}+#1#{} Chips when scored", 
				},
			},
			j_thac_dutiful_joker = {
				name = {
					"Dutiful Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Played cards with",
					"{C:six_moons}#2#{} suit give",
					"{C:chips}+#1#{} Chips when scored", 
				},
			},
			j_thac_frivolous_joker = {
				name = {
					"Frivolous Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:mult}+#1#{} Mult if played",
					"hand doesn't contain",
					"a {C:attention}Spectrum"
				},
			},
			j_thac_groaning_joker = {
				name = {
					"Groaning Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:chips}+#1#{} Chips if played",
					"hand doesn't contain",
					"a {C:attention}Spectrum"
				},
			},
			j_thac_wayfarer = {
				name = {
					"The Wayfarer",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:mult,C:white} X#1# {} Mult if played",
					"hand contains",
					"a {C:attention}Straight{} but",
					"{C:attention}isn't{} a {C:attention}Straight",
				},
			},
			j_thac_power_of_unity = {
				name = {
					"Power of Unity",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:mult,C:white} X#1# {} Mult if played",
					"hand contains",
					"a {C:attention}Flush{} but",
					"{C:attention}isn't{} a {C:attention}Flush",
				},
			},
			j_thac_chaotic = {
				name = {
					"The Chaotic",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:mult,C:white} X#1# {} Mult if played",
					"hand contains",
					"a {C:attention}Spectrum{} but",
					"{C:attention}isn't{} a {C:attention}Spectrum",
				},
			},
			j_thac_standardized = {
				name = {
					"The Standardized",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:mult,C:white} X#1# {} Mult if played",
					"hand is a",
					"{C:attention}standard hand"
				},
			},
			j_thac_nonstandard = {
				name = {
					"The Nonstandard",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:mult,C:white} X#1# {} Mult if played",
					"hand isn't a",
					"{C:attention}standard hand"
				},
			},
			j_thac_gift_from_the_void = {
				name = {
					"Gift from the Void",
					"{C:lordofvoidw,s:0.5}Value in emptiness.",
				},
				text = {
					"At end of round, add",
					"a random {C:dark_edition}Negative {C:attention}playing",
					"{C:attention}card{} to your deck"
				},
			},
			j_thac_lord_of_the_meek = {
				name = {
					"Lord of the Meek",
					"{C:autumn,s:0.5}Power to the people",
				},
				text = {
					"{C:attention}Retrigger{} each",
					"{C:common}Common{} {C:attention}Joker{} {C:attention}#1#{} time#2#",
				},
			},
			j_thac_mirage_joker = {
				name = "Mirage Joker",
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}retrigger{}",
					"each {C:attention}Joker{} {C:attention}#3#{} time#4#",
				},
			},
			j_thac_transfusion = {
				name = "Transfusion",
				text = {
					"{C:mult}#1#%{} of {C:chips}Chips{} are",
					"{C:attention}converted{} to {C:mult}Mult{}",
					"at a {X:mult,C:white} X#2# {} rate"
				},
			},
			j_thac_placeholder_joker = {
				name = {
					"Placeholder Joker",
					"{C:autumn,s:0.5}TODO: this subtitle",
				},
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}convert{}",
					"this {C:attention}Joker{} into a {C:purple}random{}",
					"other {C:attention}Joker with the same art"
				},
			},
			j_thac_filler_card = {
				name = {
					"Filler Card",
					"{C:autumn,s:0.5}- remember to replace Filler Card",
				},
				text = {
					"This {C:attention}Joker{} gains {X:chips,C:white} X#1# {} Chips",
					"for each scored card {C:attention}without any{}",
					"{C:attention}Enhancement{}, {C:blue}Seal{}, {C:dark_edition}Edition{}, or {C:red}Aspect",
					"{C:inactive}(Currently {X:chips,C:white} X#2# {C:inactive} Chips)"
				},
			},
			j_thac_test_print = {
				name = {
					"Test Print",
					"{C:autumn,s:0.5}Within parameters",
				},
				text = {
					"{C:attention}Jokers with the same",
					"{C:attention}art{} as this {C:attention}Joker",
					"give {X:chips,C:white} X#1# {} Chips"
				},
			},
			j_thac_sans = {
				name = {
					"sans",
					"{C:autumn,s:0.5}sans",
				},
				text = {
					"{C:attention}Retrigger{} each {C:attention}Joker with the",
					"{C:attention}same art{} as this {C:attention}Joker",
				},
			},
			j_thac_null = {
				name = {
					"▯▯▯▯▯▯ ▯▯▯▯▯▯",
					"{s:0.5}▯▯▯▯ ▯▯ ▯▯▯▯",
				},
				text = {
					"When {C:attention}Blind{} is selected,",
					"a random {C:attention}Joker with the",
					"{C:attention}same art{} as this {C:attention}Joker{}",
					"becomes {C:dark_edition,E:1}Negative{}"
				},
			},
			j_thac_garden = {
				name = {
					"Garden",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Retrigger{} all played",
					"{C:attention}Grass{} and {C:attention}Dirt{} cards",
					"{C:attention}#1#{} additional time#2#"
				},
			},
			j_thac_clown_posse = {
				name = "Clown Posse",
				text = {
					"This Joker gains {X:mult,C:white} X#1# {}",
					"Mult whenever another",
					"{C:attention}Joker{} is gained",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
				},
			},
			j_thac_stellar_alignment = {
				name = {
					"Stellar Alignment",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Retriggers{} each played",
					"{C:attention}Star{} card {C:attention}#1#{} time#2# for",
					"each level of its suit",
					"{C:inactive}(Reminder: Suit levels",
					"{C:inactive}start at lvl.1!)"
				},
			},
			j_thac_paint_mixer = {
				name = {
					"Paint Mixer",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"If played hand contains",
					"a {C:attention}Spectrum{}, {C:green}randomize{}",
					"the {C:attention}suit{} of each",
					"scoring card"
				},
			},
			j_thac_psychic_double_reacharound = {
				name = {
					"Psychic Double Reacharound",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Retrigger{} each {C:attention}Joker{} that {C:attention}copies{}",
					"another {C:attention}Joker{} {C:attention}#1#{} time#2#"
				},
			},
			j_thac_knight_of_heart = {
				name = {
					"Knight of Heart",
					"{C:knightofheartw,s:0.5}apotheotic vessel",
				},
				text = {
					{
						"Played cards are {C:attention}converted{} to {C:hearts}Hearts{}",
						"and this Joker gains the following",
						"depending on the card's {C:attention}original suit{}:",
					},
					{
						"{C:spades}Spades{}: {C:chips}+#1#{} Chips {C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
						"{C:clubs}Clubs{}: {C:mult}+#3#{} Mult {C:inactive}(Currently {C:mult}+#4#{C:inactive} Mult)",
						"{C:diamonds}Diamonds{}: {C:money}+$#5#{} at end of round {C:inactive}(Currently {C:money}$#6#{C:inactive})",
						"{C:attention}Other suits{}: {C:mult}+{X:mult,C:white} X#7# {} Mult {C:inactive}(Currently {X:mult,C:white} X#8# {C:inactive} Mult)"
					},
				},
			},
			j_thac_witch_of_mind = {
				name = {
					"Witch of Mind",
					"{C:witchofmindw,s:0.5}apoÞ3otic v3ss3l",
				},
				text = {
					"Rescore each",
					"{C:attention}scoring Joker{}",
				},
			},
			j_thac_lord_of_void = {
				name = {
					"Lord of Void",
					"{C:lordofvoidw,s:0.5}Apotheotic Vessel",
				},
				text = {
					"{X:mult,C:white} X#1# {} Mult for each",
					"{C:attention}Voucher{} redeemed this run",
					"{C:attention}Retrigger{} this Joker once",
					"for each empty {C:attention}consumable slot{}",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult, {C:attention}#3#{C:inactive} retriggers)"
				},
			},
			j_thac_funny_fertilizer = {
				name = {
					"Funny Fertilizer",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Enhances{} up to {C:attention}#1#{} unenhanced",
					"or {C:attention}Dirt{} card#2# in your full",
					"deck to {C:attention}Grass{} cards at",
					"the end of each {C:attention}Boss Blind",
				},
			},
			j_thac_highest_number = {
				name = {
					"The Highest Number",
					"{C:knightofheartw,s:0.5}there's nothing higher...",
				},
				text = {
					"Played {C:attention}9s{} reduce {C:attention}Blind{}",
					"requirement by {C:attention}#1#%{}",
					"This Joker {C:attention}improves{} at the",
					"end of each {C:attention}Boss Blind{}"
				},
			},
			j_thac_astront = {
				name = {
					"Astron't Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:green}#1# in #2#{} chance to",
					"upgrade level of",
					"{C:attention}suit{} of {C:attention}first{} card",
					"used in scoring"
				},
			},
			j_thac_torrential = {
				name = {
					"Torrential Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"If discarded hand",
					"contains a {C:attention}Flush{},",
					"upgrade level of {C:attention}suit{}",
					"of {C:attention}leftmost{} discarded card"
				},
			},
			j_thac_landlord = {
				name = {
					"Landlord",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Earn {C:money}$#1#{} if discarded hand",
					"contains a {C:attention}Full House{}",
				},
			},
			j_thac_lost_sock = {
				name = {
					"Lost Sock",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"This Joker gains {C:chips}+#1#{}",
					"Chips when {C:attention}played hand{}",
					"contains {C:attention}exactly one{}",
					"{C:attention}unscored{} card",
					"{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			j_thac_the_csi = {
				name = {
					"The C.S.I.",
					"{C:autumn,s:0.5}Comedy Scene Investigators",
				},
				text = {
					"{C:chips}+#1#{} Chips for",
					"each {C:attention}face card{} in",
					"your {C:attention}graveyard{}",
					"{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			j_thac_junk_collector = {
				name = {
					"Junk Collector",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Create an {C:oddity}Oddity{} when",
					"{C:attention}Blind{} is selected",
					"{C:inactive}(Must have room)"
				},
			},
			j_thac_exorcist = {
				name = {
					"Exorcist",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"When {C:attention}Blind{} is selected, remove",
					"{C:attention}#1#{} random card#2# from your",
					"{C:attention}graveyard{} and this Joker gains ",
					"{X:mult,C:white}X#3#{} Mult for each removed",
					"{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
				},
			},
			j_thac_gallows_humor = {
				name = {
					"Gallows Humor",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:mult,C:white}X#1#{} Mult if there",
					"are {C:attention}#2#{} or more cards",
					"in your {C:attention}graveyard{}",
					"{C:inactive}(Currently: {C:attention}#3#{C:inactive} cards)",
				},
			},
			j_thac_common_ground = {
				name = {
					"Common Ground",
					"{C:autumn,s:0.5}We all rot in the same soil",
				},
				text = {
					"When round begins, draw #1#",
					"additional card#2# for each",
					"{C:attention}different rank{} among",
					"cards in your {C:attention}graveyard{}",
					"{C:inactive}(Currently: {C:attention}#3#{C:inactive} ranks)"
				},
			},
			j_thac_tombstone = {
				name = {
					"Tombstone",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:chips,C:white}X#1#{} Chips for each",
					"{C:attention}Stone Card{} in your",
					"{C:attention}graveyard{}",
					"{C:inactive}(Currently: {X:chips,C:white}X#2#{C:inactive} Chips)",
				},
			},
			j_thac_gem_joker = {
				name = {
					"Gem Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Jewel Cards{} held in",
					"hand give {X:chips,C:white} X#1# {} Chips",
				},
			},
			j_thac_discarded_vessel = {
				name = {
					"Discarded Vessel",
					"{C:lordofvoidw,s:0.5}* It bears the curse of AMBITION.",
				},
				text = {
					"{C:green}#1# in #2#{} chance to add",
					"a random {C:red}Aspect{} to each",
					"discarded unaspected card",
				},
			},
			j_thac_afterlife_archive = {
				name = {
					"Afterlife Archive",
					"{C:autumn,s:0.5}It's important to keep records",
				},
				text = {
					"Earn {C:money}$#1#{} for each {C:attention}4{} or {C:attention}9{}",
					"in your {C:attention}graveyard{}",
					"at end of round",
					"{C:inactive}(Currently: {C:money}$#2#{C:inactive})",
				},
			},
			j_thac_jokermancer = {
				name = {
					"Jokermancer",
					"{C:autumn,s:0.5}Waste not, want not!",
				},
				text = {
					"Each scored card gives",
					"{C:mult}+#1#{} Mult for each card",
					"in your {C:attention}graveyard{} that",
					"shares a {C:attention}suit{} or {C:attention}rank{} with it"
				},
			},
			j_thac_gaudy_bracelet = {
				name = {
					"Gaudy Bracelet",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"This Joker gains {C:chips}+#1#{}",
					"Chips when a played",
					"{C:attention}Jewel Card{} scores",
					"{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			j_thac_twisted_mind = {
				name = {
					"Twisted Mind",
					"{C:witchofmindw,s:0.5}* do you still subscrib3 to LOGIC?",
				},
				text = {
					"Cards in your {C:attention}graveyard",
					"are scored as if they",
					"were held in your hand",
				},
			},
			j_thac_joke_book_of_the_dead = {
				name = {
					"Joke Book of the Dead",
					"{C:autumn,s:0.5}It's missing a lot of pages...",
				},
				text = {
					"When {C:attention}Blind{} is selected, gain",
					"{C:red}+#1#{} Discard#2# for every {C:attention}#3#{} cards",
					"in your {C:attention}graveyard{}",
					"{C:inactive}(Currently: {C:red}+#4#{C:inactive} Discards)",
				},
			},
			j_thac_gravedigger = {
				name = {
					"Gravedigger",
					"{C:autumn,s:0.5}Somebody's gotta do it",
				},
				text = {
					"Earn {C:money}$#1#{} when a",
					"card is put into",
					"your {C:attention}graveyard{}",
				},
			},
			j_thac_matchbook = {
				name = {
					"Matchbook",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"The first {C:red}#2#{} card#3#",
					"played each {C:attention}Round{} are",
					"{C:red,s:1.1,E:1}destroyed{}",
					"{C:inactive}(Remaining: {C:red}#4#{C:inactive} card#5#)",
				},
			},
			j_thac_dark_hallway = {
				name = {
					"Dark Hallway",
					"{C:autumn,s:0.5}Twilight shines through...",
				},
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:red,E:1}destroy#1#{} #2# random card#3#",
					"in your {C:attention}full deck{}"
				},
			},
			j_thac_triplicate_soul = {
				name = {
					"Triplicate Soul",
					"{C:knightofheartw,s:0.5}* my soul shines with POWER...",
				},
				text = {
					"Create {C:attention}#1#{} extra cop#2#",
					"of each card put",
					"into your {C:attention}graveyard{}",
					"{C:inactive}(Copies are created",
					"{C:inactive}in your graveyard)",
				},
			},
			j_thac_grasp_of_emptiness = {
				name = {
					"Grasp of Emptiness",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"give {X:mult,C:white}X#1#{} Mult",
				},
			},
			j_thac_shutin = {
				name = {
					"Shut-In",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"permanently gain",
					"{C:mult}+#1#{} Mult when scored",
				},
			},
			j_thac_ace_in_the_hole = {
				name = {
					"Ace in the Hole",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played {C:attention}Aces{}",
					"earn {C:money}$#1#{} and are {C:red,E:1}destroyed",
				},
			},
			j_thac_underdogs_secret = {
				name = {
					"Underdog's Secret",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"If scored Chips value is at least",
					"{X:attention,C:white}#1#X{} the Mult value, earn {C:money}$#2#",
				},
			},
			j_thac_topple_the_titans = {
				name = {
					"Topple the Titans",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"If scored Chips value is at least",
					"{X:attention,C:white}#1#X{} the Mult value, reduce",
					"{C:attention}Blind{} requirement by {C:attention}#2#%{}",
				},
			},
			j_thac_autoapotheosis = {
				name = {
					"Autoapotheosis",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"If scored Chips value is at least",
					"{X:attention,C:white}#1#X{} the Mult value, each scoring",
					"unaspected card gets a random {C:red}Aspect{}",
				},
			},
			j_thac_amalgamiter = {
				name = {
					"Amalgamiter",
					"{C:autumn,s:0.5}using alchemiters in alchemy was a mistake",
				},
				text = {
					"When round begins, if there are",
					"at least {C:attention}#1#{} cards in your {C:attention}graveyard{},",
					"{C:attention}combine{} all of them and put",
					"the result into your hand",
				},
			},
			j_thac_celestial_awe = {
				name = {
					"Celestial Awe",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"If played hand is a",
					"{C:attention}Straight Spectrum{},",
					"fill your consumable",
					"slots with random",
					"{C:planet}Planet{} cards",
					"{C:inactive}(Must have room)",
				},
			},
			j_thac_somber_snowfall = {
				name = {
					"Somber Snowfall",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Each {C:attention}unscored{} played card",
					"gives {C:chips}+#1#{} Chips for each",
					"card in your {C:attention}graveyard{}",
					"that shares a {C:attention}suit{} with it",
				},
			},
			j_thac_jack_of_all_trades = {
				name = {
					"Jack of All Trades",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Played {C:attention}Jacks{} are treated as",
					"if they are each {C:attention}enhancement{}",
					"among cards held in hand",
				},
			},
			j_thac_all_lucky_sevens = {
				name = {
					"All Lucky Sevens",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Played {C:attention}7s{} are treated",
					"as if they are also",
					"{C:attention}Lucky Cards{}",
				},
			},
			j_thac_celestial_crossing = {
				name = {
					"Celestial Crossing",
					"{C:autumn,s:0.5}Work In progress!",
				},
				text = {
					"Played cards with {C:six_stars}Star{} suit",
					"are treated as if they are",
					"also {C:attention}Cosmic Cards{}",
				},
			},
			j_thac_twin_stella = {
				name = {
					"Twin Stella",
					"{C:autumn,s:0.5}hey how come Star gets two?",
				},
				text = {
					"Played cards with {C:six_stars}Star{} suit",
					"are treated as if they are",
					"also {C:attention}Star Cards{}",
				},
			},
			j_thac_lunar_grave = {
				name = {
					"Lunar Grave",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Played cards with {C:six_moon}Moon{} suit",
					"are treated as if they are",
					"also {C:attention}Bone Cards{}",
				},
			},
			j_thac_lunatic_cultist = {
				name = {
					"Lunar Cult",
					"{C:autumn,s:0.5}Oh I guess Moon gets two also",
				},
				text = {
					"Played cards with {C:six_moon}Moon{} suit",
					"are treated as if they are",
					"also {C:attention}Cult Cards{}",
				},
			},
			j_thac_grave_legion = {
				name = {
					"Grave Legion",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:green}#1# in #2#{} chance to create",
					"{C:attention}#3# cop#4#{} of each played card",
					"and put #5# into your",
					"{C:attention}graveyard{} when scored",
				},
			},
			j_thac_scrapper = {
				name = {
					"Scrapper",
					"{C:autumn,s:0.5}*grinding noises intensify*",
				},
				text = {
					"When round begins, remove a {C:attention}metal",
					"{C:attention}Enhanced Card{} from your {C:attention}graveyard{},",
					"then create {C:attention}#1#{} random {C:attention}metal Enhanced",
					"Card#2#{} and put #3# into your hand",
				},
			},
			j_thac_snecko_eye = {
				name = {
					"Snecko Eye",
					"{C:autumn,s:0.5}Confused!",
				},
				text = {
					"{C:attention}+#1#{} hand size",
					"{C:green}Randomize{} the {C:attention}rank{} of",
					"each card after it is drawn"
				},
			},
			j_thac_hardlyquin = {
				name = {
					"Hardlyquin",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"{C:green}#1# in #2#{} chance",
					"for {C:mult}+#3# Mult",
				},
			},
			j_thac_penumbra_phantasm = {
				name = {
					"Penumbra Phantasm",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Whenever a card with {C:six_moon}Moon{} suit",
					"is put into your {C:attention}graveyard{},",
					"create {C:attention}#1#{C:spectral} Spectral{} card#2#",
					"{C:inactive}(Must have room)",
				},
			},
			j_thac_golden_ratio = {
				name = "Golden Ratio",
				text = {
					"{C:attention}Aces{}, {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{}, and {C:attention}8s{}",
					"each give {X:mult,C:white} X#1# {} Mult",
					"when played and scored",
				},
			},
			j_thac_whispers_of_beyond = {
				name = {
					"Whispers of Beyond",
					"{C:witchofmindw,s:0.5}almost ind3ciph3rabl3",
				},
				text = {
					"{C:attention}Retrigger{} your {C:attention}6th",
					"{C:attention}Joker #1#{}#2#",
				},
			},
			j_thac_jet_worldmage = {
				name = {
					"Jet Worldmage",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"with {C:spades}Spade{} suit",
					"give {X:chips,C:white}X#1#{} Chips",
				},
			},
			j_thac_ruby_sunmage = {
				name = {
					"Ruby Sunmage",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"with {C:hearts}Heart{} suit",
					"give this {C:attention}Joker{}",
					"{C:mult}+#1#{} Mult this round",
					"{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)"
				},
			},
			j_thac_opal_moonmage = {
				name = {
					"Opal Moonmage",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"with {C:clubs}Club{} suit",
					"{C:attention}retrigger{} the cards",
					"to their {C:attention}left{} and {C:attention}right{}"
				},
			},
			j_thac_topaz_starmage = {
				name = {
					"Topaz Starmage",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"with {C:diamonds}Diamond{} suit",
					"have a {C:green}#1# in #2#{} chance",
					"to create an {C:oddity}Oddity{}",
					"{C:inactive}(Must have room)",
				},
			},
			j_thac_amethyst_starmage = {
				name = {
					"Amethyst Starmage",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"with {C:six_stars}Star{} suit",
					"have a {C:green}#1# in #2#{} chance",
					"to create a {C:Zodiac}Zodiac{} card",
					"{C:inactive}(Must have room)",
				},
			},
			j_thac_onyx_moonmage = {
				name = {
					"Onyx Moonmage",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"with {C:six_moons}Moon{} suit",
					"give {C:chips}+#1#{} Chips for each",
					"remaining card in {C:attention}deck{}",
					"{C:inactive}(Currently: {C:chips}+#2#{C:inactive})",
				},
			},
			j_thac_coven = {
				name = {
					"Coven Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:mult}+#1#{} Mult if played",
					"hand contains at least {C:attention}three",
					"cards with {C:attention}different ranks",
				},
			},
			j_thac_meteorite = {
				name = {
					"Meteorite",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Each card held in hand",
					"with {C:six_stars}Star{} suit has a",
					"{C:green}#1# in #2#{} chance to {C:attention}temporarily{}",
					"increase hand level by {C:attention}#3#",
				},
			},
			j_thac_olivine = {
				name = {
					"Olivine",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Each card held in hand",
					"with {C:six_moons}Moon{} suit gives",
					"{C:attention}-#1#%{} Blind requirement",
				},
			},
			j_thac_cartowomancer = {
				name = {
					"Cartowomancer",
				},
				text = {
					"Rotate {C:tarot}Tarot{} cards to {C:tarot}45 Degree",
					"{C:tarot}Rotated Tarot{} cards and vice versa",
					"by {C:green}petting them {C:inactive}({C:attention}Direction{C:inactive} matters)",
				},
			},
			j_thac_rot_cartowomancer = {
				name = {
					"Cartowomancer!",
				},
				text = {
					"Rotate {C:tarot}45 Degree Rotated Tarot{}",
					"cards to {C:tarot}Tarot{} cards and vice versa",
					"by {C:green}petting them {C:inactive}({C:attention}Direction{C:inactive} matters)",
				},
			},
			j_thac_nekogloop = {
				name = {
					"{C:knightofheartw}nekoGloop",
				},
				text = {
					{
						"Cards with {C:hearts}Heart{}",
						"suit can't be {C:attention}debuffed",
					},
					{
						"{C:green}#1# in #2#{} chance for this",
						"{C:attention}Joker{} to be {C:red}destroyed",
						"at end of round",
					},
				},
			},
			j_thac_autumnmood = {
				name = {
					"{C:witchofmindw}autumnMood",
				},
				text = {
					{
						"{C:mult}+#3#{} Mult for each card area",
						"with exactly {C:attention}#4#{} cards in it",
						"{C:inactive}(Currently: {C:mult}+#5#{C:inactive} Mult)",
					},
					{
						"{C:green}#1# in #2#{} chance for this",
						"{C:attention}Joker{} to be {C:red}destroyed",
						"at end of round",
					},
				},
			},
			j_thac_  = {
				name = {
					"{C:lordofvoidw} ",
				},
				text = {
					{
						"{C:mult}+#3#{} Mult for each {C:dark_edition}Negative",
						"{C:attention}Joker{} or {C:attention}consumable{} and for",
						"each {C:dark_edition}Negative{C:attention} playing card{}",
						"in your {C:attention}full deck{}",
						"{C:inactive}(Currently: {C:mult}+#4#{C:inactive} Mult)",
					},
					{
						"{C:green}#1# in #2#{} chance for this",
						"{C:attention}Joker{} to be {C:red}destroyed",
						"at end of round",
					},
				},
			},
			j_thac_hmlt_knightofheart = {
				name = {
					"{C:knightofheartw}Knight of Heart",
				},
				text = {
					{
						"Cards with {C:hearts}Heart{}",
						"suit can't be {C:attention}debuffed",
					},
					{
						"When a card with {C:hearts}Heart{} suit",
						"is put into your {C:attention}graveyard{},",
						"{C:attention}create a copy{} of it and put it",
						"on the {C:attention}bottom{} of your deck",
					},
				},
			},
			j_thac_hmlt_witchofmind = {
				name = {
					"{C:witchofmindw}Witch of Mind",
				},
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult for each card area",
						"with exactly {C:attention}#2#{} cards in it",
						"{C:inactive}(Currently: {X:mult,C:white}X#3#{C:inactive} Mult)",
					},
				},
			},
			j_thac_hmlt_lordofvoid = {
				name = {
					"{C:lordofvoidw}Lord of Void",
				},
				text = {
					{
						"{C:mult}+#1#{} Mult for each {C:dark_edition}Negative",
						"{C:attention}Joker{} or {C:attention}consumable{} and for",
						"each {C:dark_edition}Negative{C:attention} playing card{}",
						"in your {C:attention}full deck{}",
						"{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)",
					},
					{
						"When another {C:attention}Joker{} without an",
						"{C:dark_edition}Edition{} is gained, {C:green}#3# in #4#{} chance",
						"for it to become {C:dark_edition}Negative",
						"{C:inactive}#5#{}",
					},
				},
			},
			j_thac_stirring_graves = {
				name = {
					"Stirring Graves",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Cards put into your {C:attention}graveyard{}",
					"permanently gain {C:attention}#1#{} retrigger",
				},
			},
			j_thac_plusjimbo = {
				name = {
					"+Joker",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:mult}+4 +Mult",
				},
			},
			j_thac_amalgam_joker = {
				name = {
					"Amalgam Joker",
					"{C:autumn,s:0.5}Come join the fun!",
				},
				text = {
					"Combines {C:attention}#1#{} random cards",
					"held in hand at end of round",
					"This Joker gains {X:money,C:white}X#2#{} of the",
					"combined card's {C:chips}Chips{} value as",
					"additional {C:money}sell value",
				},
			},
			['j_thac_:joker:'] = {
				name = "{f:thac_emoji}🃏{}",
				text = {
					"{C:mult,s:1.1}+#1#{s:1.1} Mult",
				},
			},
			['j_thac_:art:'] = {
				name = "{f:thac_emoji}🎨{}",
				text = {
					"Placeholder Text",
				},
			},
			['j_thac_:currency_exchange:'] = {
				name = "{f:thac_emoji}💱{}",
				text = {
					"{C:green}Pet this Joker{C:attention} clockwise",
					"to {C:attention}convert {C:money}$#1#{} to {C:blue}¥#2#",
					"or {C:attention}counter-clockwise{} to",
					"{C:attention}convert {C:blue}¥#3#{} to {C:money}$#4#",
				},
			},
			['j_thac_:free:'] = {
				name = "{C:blue,f:thac_emoji}🆓{}",
				text = {
					"{X:blue,s:1.5,C:white}FREE",
				},
			},
			j_thac_jera = {
				name = {
					"Jera",
					--"{C:autumn,s:0.5}(Not the Grab Bag one)",
				},
				text = {
					"{C:green}#1# in #2#{} chance to",
					"copy played cards",
				},
			},
			j_thac_edge_of_reality = {
				name = {
					"{C:joy_spell}Edge of Reality",
					"{C:lordofvoid,s:0.5}Are you afraid?",
				},
				text = {
					{
						"{C:attention}Split{} each card put in your",
						"{C:attention}graveyard{} into {C:attention}Suit{} and {C:attention}Rank{} cards",
					},
					{
						"Earn {C:blue}¥#1#{} at end of round after",
						"{C:attention}Boss Blind{} is defeated for each",
						"{C:attention}rankless card{} in your {C:attention}graveyard {C:inactive}[{C:attention}#2#{C:inactive}]",
					},
					{
						"{C:colour}Colour{} and {C:shape}Shape?{} cards get {C:attention}#3#",
						"{C:attention}additional round#4#{} after {C:attention}Boss Blind",
						"is defeated for every #6#{C:attention}suitless",
						"{C:attention}card#7#{} in your {C:attention}graveyard {C:inactive}[{C:attention}#5#{C:inactive}]",
					},
					{
						"{C:attention}Double these rewards{} in the {C:purple}Flip-Side",
					},
				},
			},
			j_thac_aggregating_mass = {
				name = {
					"{C:purple}Aggregating Mass",
				},
				text = {
					{
						"When {C:attention}Blind{} is selected,",
						"create {C:attention}#1#{} random cards",
						"with {C:gb_eyes}Eye{} suit and put",
						"them in your {C:attention}graveyard",
					},
				},
			},
			j_thac_void_nullmage = {
				name = {
					"{C:purple}Void Nullmage",
				},
				text = {
					"{C:attention}Unscored{} played cards",
					"with {C:gb_eyes}Eye{} suit {C:purple}balance",
					"{C:chips} Chips{} and {C:mult}Mult{}",
				},
			},
			j_thac_shattered_lord_of_void = {
				name = {
					"{C:purple}Lord of Void",
				},
				text = {
					{
						"{C:purple}Divides {C:attention}Blind{} requirement by the",
						"amount of cards in the {C:riftraft_void}Void{C:inactive} [{C:riftraft_void}#1#{C:inactive}]"
					},
				},
			},
		},
		Tarot = {
			c_thac_universe = {
				name = "The Universe",
				text = {
					'Randomly enhances',
					'selected cards',
					'{C:inactive}Having seen the World\'s vastness,{}',
					'{C:inactive}the Fool saw endless possibility{}',
				},
				boxes = { 2, 2, },
			},
			c_thac_void = {
				name = "Void",
				text = {
					'{C:attention}Removes{} each enhancement from',
					'each selected card and gain {C:money}$#2#{} for',
					'each {C:attention}removed{} enhancement',
					'{C:inactive}However, the Fool was unable to handle{}',
					'{C:inactive}this freedom, and fell to aimless despair{}',
				},
				boxes = { 3, 2, },
			},
			c_thac_happy_squirrel = {
				name = "The Happy Squirrel",
				text = {
					"Create {C:attention}#2#{} copy of",
					"{C:attention}#1#{} selected card",
					"without an enhancement",
					"in your hand",
					'{C:inactive}Seeking meaning once again, the Fool{}',
					'{C:inactive}looked to nature\'s simplicity{}',
				},
				boxes = { 4, 2, },
			},
			c_thac_artist = {
				name = "The Artist",
				text = {
					'Select {C:attention}#1#{} card,',
					'apply its {C:attention}enhancement{}, {C:dark_edition}edition{},',
					'and {C:purple}seal{} to {C:attention}#2#{} {C:green}random{}',
					'cards in your hand'
				},
			},
			c_thac_veteran = {
				name = "The Veteran",
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_drunkard = {
				name = "The Drunkard",
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_juggler = {
				name = {
					"The Juggler",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					'{C:inactive}Not Yet Implemented',
				},
			},
			c_thac_grass = {
				name = {
					"The Grass",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_bone = {
				name = {
					"The Bone",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_collector = {
				name = {
					"The Collector",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected card to",
					"a {C:attention}#2#"
				},
			},
			c_thac_cycle = {
				name = {
					"The Cycle",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_joker = {
				name = {
					"The Joker",
					"{C:autumn,s:0.5}Our gracious host!",
				},
				text = {
					'{C:mult}+#1#{} Mult while in your',
					'{C:attention}consumable{} area',
					'{C:inactive}Hee hee, hoo hoo!{}',
					'{C:inactive}Looks like the joke\'s{}',
					'{C:dark_edition,E:2,s:1.75}ON YOU!{}',
				},
				boxes = { 2, 3, },
			},
		},
		Planet = {
			c_thac_comet = {
				name = "Comet",
				text = {
					"Upgrades a {C:green}random{}",
					"poker hand by {C:attention}#1#{} levels",
				},
			},
			c_thac_meteor = {
				name = "Meteor",
				text = {
					"Upgrades a {C:green}random{}",
					"poker hand by {C:attention}#1#{} levels,",
					"but {C:attention}decreases{} a different",
					"{C:green}random{} poker hand's level by #2#"
				},
			},
			c_thac_satellite = {
				name = {
					"Satellite",
					"{C:autumn,s:0.5}(Not the Joker One)",
				},
				text = {
					"Creates up to {C:attention}2",
					"random {C:planet}Planet{} cards",
					"{C:inactive}(Must have room)"
				},
			},
			c_thac_moon = {
				name = {
					"Moon",
					"{C:autumn,s:0.5}Moon of Earth",
				},
				text = {
					"Creates #1# random",
					"{C:tarot}Tarot{}, {C:planet}Planet{}, or",
					"{C:spectral}Spectral{} card",
					"{C:inactive}(Must have room)"
				},
			},
			c_thac_station = {
				name = "Space Station",
				text = {
					"Upgrades your most played",
					"poker hand by {C:attention}#1#{} level",
					"{C:inactive}Currently: {C:attention}#2#{}",
				},
			},
			c_thac_dysnomia = {
				name = {
					"Dysnomia",
					"{C:autumn,s:0.5}Moon of Eris",
				},
				text = {
					"{C:green}Shuffle{} your poker hands' levels",
					"{C:green}#1# in #2#{} chance to {C:green}randomly{}",
					"{C:attention}upgrade{} or {C:attention}downgrade{}",
					"each shuffled hand",
				},
				boxes = { 1, 3, },
			},
			c_thac_planet_s = {
				name = {
					"{C:spades}Planet S",
					"{C:autumn,s:0.5}Spades in Spades",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{V:2}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips"
				},
			},
			c_thac_planet_h = {
				name = {
					"{C:hearts}Planet H",
					"{C:autumn,s:0.5}Hearty Hearts",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{V:2}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips"
				},
			},
			c_thac_planet_c = {
				name = {
					"{C:clubs}Planet C",
					"{C:autumn,s:0.5}Club's Clubbin'",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{V:2}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips"
				},
			},
			c_thac_planet_d = {
				name = {
					"{C:diamonds}Planet D",
					"{C:autumn,s:0.5}Diamonds twice (funny somehow?)",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{V:2}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips"
				},
			},
			c_thac_shooting_star = {
				name = {
					"{C:six_stars}Shooting Star",
					"{C:autumn,s:0.5}Look out it's got a gun!",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{V:2}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips"
				},
			},
			c_thac_chill_moon = {
				name = {
					"{C:six_moons}Chill Moon",
					"{C:autumn,s:0.5}That moon has sunglasses on?",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{V:2}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips"
				},
			},
		},
		Spectral = {
		},
		Colour = {
			c_thac_placeholder_grey = {
				name = "Placeholder Grey",
				text = {
					"Create a {C:dark_edition}Negative",
					"{C:attention}Placeholder Joker{} for every",
					"{C:attention}#4#{} rounds this has been held",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
				},
			},
		},
		Rotarot = {
			c_thac_rot_universe = {
				name = "The Universe!",
				text = {
					"{C:inactive}Sorry nothing",
				},
			},
			c_thac_rot_void = {
				name = "Void!",
				text = {
					"{C:inactive}Sorry nothing",
				},
			},
			c_thac_rot_happy_squirrel = {
				name = "The Happy Squirrel!",
				text = {
					"{C:inactive}Sorry nothing",
				},
			},
			c_thac_rot_artist = {
				name = "The Artist!",
				text = {
					"{C:inactive}Sorry nothing",
				},
			},
			c_thac_rot_veteran = {
				name = "The Veteran!",
				text = {
					"{C:inactive}Sorry nothing",
				},
			},
			c_thac_rot_drunkard = {
				name = "The Drunkard!",
				text = {
					"Creates a {C:attention}Drunkard",
					"{C:inactive}(Must have room)",
				},
			},
			c_thac_rot_juggler = {
				name = "The Juggler!",
				text = {
					"Creates a {C:attention}Juggler",
					"{C:inactive}(Must have room)",
				},
			},
			c_thac_rot_joker = {
				name = "The Joker!",
				text = {
					"Creates a {C:attention}The Joker",
					"{C:inactive}(Must have room)",
					"{s:0.15} ",
					'{C:inactive}Hoo hoo, hee hee!{}',
					'{C:inactive}This time the joke\'s{}',
					'{C:dark_edition,E:2,s:1.75}ON ME!{}',
				},
			},
			c_thac_rotflip_star = {
				name = "The Star?!",
				text = {
					"Add {C:attention}#1#{} random {C:attention}Enhanced",
					"{C:six_stars}Stars{} to your hand",
				},
			},
			c_thac_rotflip_moon = {
				name = "The Moon?!",
				text = {
					"Add {C:attention}#1#{} random {C:attention}Enhanced",
					"{C:six_moons}Moons{} to your hand",
				},
			},
		},
		Fraud = {
		},
		Star = {
			c_thac_rev_planet_s = {
				name = {
					"Star S",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8,C:gold}#2#{S:0.8}){} Level up",
					"{V:2}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_thac_rev_planet_h = {
				name = {
					"Star H",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8,C:gold}#2#{S:0.8}){} Level up",
					"{V:2}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_thac_rev_planet_c = {
				name = {
					"Star C",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8,C:gold}#2#{S:0.8}){} Level up",
					"{V:2}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
			c_thac_rev_planet_d = {
				name = {
					"Star D",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8,C:gold}#2#{S:0.8}){} Level up",
					"{V:2}#3#",
					"{C:gold}+#4#{} Ascension Power"
				}
			},
		},
		Omen = {
		},
		Oddity = {
			c_thac_one_jollar = {
				name = "$1",
				text = {
					'Redeemable for {C:money}$#1#{}',
				},
			},
			c_thac_two_jollar = {
				name = "$2",
				text = {
					'Redeemable for {C:money}$#1#{}',
				},
			},
			c_thac_five_jollar = {
				name = "$5",
				text = {
					'Redeemable for {C:money}$#1#{}',
				},
			},
			c_thac_ten_jollar = {
				name = "$10",
				text = {
					'Redeemable for {C:money}$#1#{}',
				},
			},
			c_thac_twenty_jollar = {
				name = "$20",
				text = {
					'Redeemable for {C:money}$#1#{}',
				},
			},
			c_thac_green_chip = {
				name = "Green Chip",
				text = {
					'Up to {C:attention}#1#{} selected',
					'cards permanently gain',
					'{C:chips}+#2#{} Chips when scored',
				},
			},
			c_thac_yellow_chip = {
				name = "Yellow Chip",
				text = {
					'Up to {C:attention}#1#{} selected',
					'cards permanently gain',
					'{C:chips}+#2#{} Chips when scored',
				},
			},
			c_thac_red_blue_chip = {
				name = "Red-Blue Chip",
				text = {
					'Up to {C:attention}#1#{} selected',
					'cards permanently gain',
					'{C:chips}+#2#{} Chips when scored',
				},
			},
			c_thac_purple_chip = {
				name = "Purple Chip",
				text = {
					'Up to {C:attention}#1#{} selected',
					'cards permanently gain',
					'{C:chips}+#2#{} Chips when scored',
				},
			},
			c_thac_power_chip = {
				name = "Power Chip",
				text = {
					'{C:attention}#1#{} selected',
					'card permanently gains',
					'{C:chips}+#2#{} Chips when scored',
				},
			},
			c_thac_pot_of_joker = {
				name = "Pot of Joker",
				text = {
					'Draw #1# cards',
				},
			},
			c_thac_jimbobread_man = {
				name = "Jimbobread Man",
				text = {
					'Gain {C:blue}+#1#{} hand',
					'{C:inactive}Looks big enough{}',
					'{C:inactive}for two sittings!{}',
				},
			},
			c_thac_jimbobread_man_half = {
				name = {
					"Jimbobread Man",
					"{C:autumn,s:0.5}Half-Eaten",
				},
				text = {
					'Gain {C:blue}+#1#{} hand',
					'{C:inactive}Just one bite{}',
					'{C:inactive}left, now{}',
				},
			},
			c_thac_cultist_potion = {
				name = {
					"Cultist Potion",
					"{C:autumn,s:0.5}CAW CAW!!!!",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} This Oddity gains',
					'{X:mult,C:white}X#1#{} Mult per {C:blue}Hand{} played',
					'{C:red,E:1}self destructs{} after {C:attention}Round{}',
					'{C:inactive}(Currently: {X:mult,C:white}X#2#{C:inactive} Mult)',
				},
			},
			c_thac_fire_potion = {
				name = {
					"Fire Potion",
					"{C:autumn,s:0.5}Deals 20 damage",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} {C:mult}+#1# Mult{}',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_snecko_potion = {
				name = {
					"Snecko Oil",
					"{C:autumn,s:0.5}Confusing...",
				},
				text = {
					'Draw {C:attention}#1#{} cards, then',
					'{C:green}randomize{} the {C:attention}ranks{} of',
					'each card held in hand',
				},
			},
			c_thac_energy_potion = {
				name = {
					"Energy Potion",
					"{C:autumn,s:0.5}Gain 2 Energy",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} Retrigger each',
					'playing card {C:attention}#1#{} time#2#',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_estradiol = {
				name = "Estradiol",
				text = {
					'Converts {C:attention}all{} {C:attention}Kings{}',
					'and {C:attention}Jacks{} in your {C:attention}full{}',
					'{C:attention}deck{} into {C:attention}Queens{}',
				},
			},
			c_thac_faded_voucher = {
				name = "Faded Voucher",
				text = {
					'{C:attention}Redeems #1#{C:green} random',
					'{C:red,s:1.5}Voucher#2#{}',
				},
			},
			c_thac_empty_bottle = {
				name = "Empty Bottle",
				text = {
					"{C:attention}Bottles #1#{}","selected card"
				},
			},
			c_thac_trick_deck = {
				name = {
					"Trick Deck",
					"{C:autumn,s:0.5}Not really playing poker anymore",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}non-material Enhanced Cards{} and",
					"puts them in your hand",
				},
			},
			c_thac_box_of_rocks = {
				name = {
					"Box of Rocks",
					"{C:autumn,s:0.5}They seem pretty smart, actually",
				},
				text = {
					"Creates {C:attention}#1#{} random {C:attention}Stone Cards{}",
					"and puts them in your hand"
				},
			},
			c_thac_pouch_of_sand = {
				name = {
					"Pouch of Sand",
					"{C:autumn,s:0.5}It gets everywhere...",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Sand Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_bag_of_stardust = {
				name = {
					"Bag of Stardust",
					"{C:autumn,s:0.5}Pocketful of potential",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Cosmic Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_jar_of_dirt = {
				name = {
					"Jar of Dirt",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Dirt Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_calcium = {
				name = {
					"Calcium",
					"{C:autumn,s:0.5}Grows your bones!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Bone Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_flashlight = {
				name = {
					"Flashlight",
					"{C:autumn,s:0.5}Cryptid Crossmod!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Light Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_abstract_oddity = {
				name = {
					"Abstract Oddity",
					"{C:autumn,s:0.5}Cryptid Crossmod!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Abstract Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_corrupting_shard = {
				name = {
					"Corrupting Shard",
					"{C:autumn,s:0.5}The light bends around it",
					"{C:autumn,s:0.5}As if in fear",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Dark Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_sack_of_meat = {
				name = {
					"Sack of Meat",
					"{C:autumn,s:0.5}Work In Progress",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Flesh Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_immaculate_prism = {
				name = {
					"Immaculate Prism",
					"{C:edition,s:0.5}LIGHT{C:autumn,s:0.5} pours out endlessly",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Prismatic Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_pot_of_honey = {
				name = {
					"Pot of Honey",
					"{C:autumn,s:0.5}By all known laws of aviation...",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Honey Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_bottle_of_water = {
				name = {
					"Bottle of Water",
					"{C:autumn,s:0.5}Refreshing!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Ripple Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_bag_of_bricks = {
				name = {
					"Bag of Bricks",
					"{C:autumn,s:0.5}Do you carry that around everywhere?",
				},
				text = {
					"Creates {C:attention}#1#{} random {C:attention}Brick Cards{}",
					"and puts them in your hand"
				},
			},
			c_thac_charred_pouch = {
				name = {
					"Charred Pouch",
					"{C:autumn,s:0.5}Bone to ash, magic to dust...",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Ash Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_unstable_concoction = {
				name = {
					"Unstable Concoction",
					"{C:autumn,s:0.5}Work In Progress",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Volatile Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_vial_of_plasma = {
				name = {
					"Vial of Plasma",
					"{C:autumn,s:0.5}A powerful substance...",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Laser Cards{} and puts",
					"them in your hand"
				},
			},
			c_thac_scrap_metal = {
				name = {
					"Scrap Metal",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}metal Enhanced Cards{}","and puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_fossil = {
				name = {
					"Fossil",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Bone Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_lost_envelope = {
				name = {
					"Lost Envelope",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Post Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_groundwater = {
				name = {
					"Groundwater",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}River Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_ritual_page = {
				name = {
					"Ritual Page",
					"{C:autumn,s:0.5}Unreadable, yet ominous",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Cult Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_glimmer_beyond = {
				name = {
					"Glimmer Beyond",
					"{C:autumn,s:0.5}Light that defies all dark...",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Light Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_bizarre_shard = {
				name = {
					"Bizarre Shard",
					"{C:autumn,s:0.5}For just a brief moment...",
					"{C:autumn,s:0.5}Peer through, tell what you see",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Abstract Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_fading_shadow = {
				name = {
					"Fading Shadow",
					"{C:autumn,s:0.5}Dark wavering under oppressive light...",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Dark Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_viscera = {
				name = {
					"Viscera",
					"{C:autumn,s:0.5}Yikes!",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Flesh Cards{} and","puts them in","your {C:attention}graveyard{}"
				},
			},
			c_thac_gift_of_the_knight = {
				name = {
					"Gift of the Knight",
					"{C:autumn,s:0.5}Three of...",
				},
				text = {
					"Creates a random {C:dark_edition}Polychrome",
					"{C:dark_edition}Light {C:attention}3 of {C:hearts}Hearts{} with {C:knightofheart}Heart{C:red} Aspect",
					"and adds it to your hand",
				},
			},
			c_thac_gift_of_the_witch = {
				name = {
					"Gift of the Witch",
					"{C:autumn,s:0.5}Three of...",
				},
				text = {
					"Creates a random {C:dark_edition}Dark {C:attention}3{}",
					"with {C:witchofmind}Mind{C:red} Aspect{}, {C:attention}bottles it",
					"and adds it to your hand",
				},
			},
			c_thac_gift_of_the_lord = {
				name = {
					"Gift of the Lord",
					"{C:autumn,s:0.5}Three of...",
				},
				text = {
					"Creates a random {C:attention}Glass {C:attention}3{}",
					"{C:attention}of {V:1}Eyes{} with an {C:attention}Ouroboros ",
					"Seal{} and {C:lordofvoid}Void{C:red} Aspect{}, and",
					"adds it to your hand",
				},
			},
			c_thac_dance_with_the_dead = {
				name = {
					"Dance of the Dead",
					"{C:autumn,s:0.5}Betraying Graves",
				},
				text = {
					"Put each card in your hand",
					"into your {C:attention}graveyard{}, then",
					"return {C:attention}that many{} random cards",
					"from your {C:attention}graveyard{} to your hand",
				},
			},
			c_thac_stareater = {
				name = {
					"Stareater",
					"{C:autumn,s:0.5}Into the maw of the void",
				},
				text = {
					"Lose {C:attention}all{} of your {C:Zodiac}Zodiac{}",
					"levels, and gain {C:money}$#1#{} for",
					"each {C:attention}unique{C:Zodiac} Zodiac{} lost",
					"{C:inactive}(Max of {C:money}$#2#{C:inactive}; Currently {C:money}$#3#{C:inactive})"
				},
			},
			c_thac_memorial_ticket = {
				name = {
					"Memorial Ticket",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Gain {C:money}$#1#{} for each card in",
					"your {C:attention}graveyard{} {C:inactive}(Max of {C:money}$#2#{C:inactive})",
					"{C:inactive}(Currently {C:money}$#3#{C:inactive})"
				},
			},
			c_thac_ironskin_potion = {
				name = {
					"Ironskin Potion",
					"{C:autumn,s:0.5}Increase defense by 8",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} Each playing',
					'card is treated as if it',
					'is also a {C:attention}#1#{}',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_stoneskin_potion = {
				name = {
					"Stoneskin Potion",
					"{C:autumn,s:0.5}Immunity to some statuses",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} Each playing',
					'card is treated as if it',
					'is also a {C:attention}#1#{}',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_midas_potion = {
				name = {
					"Midas Potion",
					"{C:autumn,s:0.5}Touch of Greed",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} Each playing',
					'card is treated as if it',
					'is also a {C:attention}#1#{}',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_stardust_potion = {
				name = {
					"Stardust Potion",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} Each playing',
					'card is treated as if it',
					'is also a {C:attention}#1#{}',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_teal_potion = {
				name = {
					"Teal Potion",
					"{C:autumn,s:0.5}Teal In Progress!",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} Each playing',
					'card is treated as if it',
					'is also a {C:attention}#1#{}',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_brickskin_potion = {
				name = {
					"Brickskin Potion",
					"{C:autumn,s:0.5}... what?",
				},
				text = {
					'{C:attention}Use{} to {X:attention,C:white}ACTIVATE{}',
					'{X:attention,C:white}ACTIVE:{} Each playing',
					'card is treated as if it',
					'is also a {C:attention}#1#{}',
					'{C:red,E:1}self destructs{} after {C:blue}Hand{}',
				},
			},
			c_thac_experience_splitter = {
				name = {
					"Experience Splitter",
					"{C:autumn,s:0.5}Not to be confused with \\#&$ !@%\")",
				},
				text = {
					"Level up each of each {C:attention}suit's",
					"{C:attention}levels{} to the {C:knightofheart}highest level",
					"among that {C:attention}suit's levels",
				},
			},
			c_thac_chaos_harness = {
				name = {
					"Chaos Harness",
					"{C:autumn,s:0.5}Totally not contrived",
				},
				text = {
					"Each card held in hand gains",
					"{C:purple}+#1#%{} Balance permanently for",
					"each {C:attention}Light{} or {C:attention}Dark{} Card",
					"in your {C:attention}graveyard{} {C:inactive}[#2#]",
				},
			},
			c_thac_yellow_amulet = {
				name = {
					"Yellow Amulet",
					"{C:autumn,s:0.5}Engraved with a strange symbol",
				},
				text = {
					"Gives each card held in",
					"hand a {C:diamonds}Yellow Sign{} sicker",
				},
			},
			c_thac_get_out_of_juvie = {
				name = {
					"Get Out Of Juvie Free Card",
					"{C:autumn,s:0.5}",
				},
				text = {
					"Reduces {C:attention}Blind{} requirement by {C:attention}#1#%{}",
				},
			},
		},
		Bakery = {
			c_thac_odd_bread = {
				name = "Odd Bread",
				text = {
                    "Create {C:attention}#1#{} {C:green}free{} {C:oddity}Oddity Pack{}",
                    "at the start of shop,",
                    "lasts {C:attention}#2#{} trigger(s)",
                    "{C:inactive}(Doesn't require room)"
                },
			},
		},
		Umbral = {
			c_thac_exosphere = {
				name = "Exosphere",
				text = {
                    "Give {C:attention}permanent{} bonus of {C:purple}#1#%{} Balance",
					"to {C:attention}all{C:six_stars} Stars{} cards in hands",
                },
			},
			c_thac_vacuum = {
				name = "Vacuum",
				text = {
                    "{C:green}#1# in #2#{} chance to give {C:attention}permanent{} bonus of",
					"{C:attention}+#3#{} retrigger#4# to {C:attention}all{C:six_moons} Moons{} cards in hands",
                },
			},
			c_thac_friend = {
				name = "Friend",
				text = {
                    "Cards in your {C:attention}graveyard{}",
					"{C:attention}permanently{} gain {X:chips,C:white}X#1#{} Chips",
                },
			},
		},
		Prestige = {
			c_thac_prestige_xchips = {
				name = {
					"Prestige: XChips",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"All future {X:chips,C:white}XChips{} triggers",
					"give {X:chips,C:white}X#1#{} more {X:chips,C:white}XChips{}",
					"{s:0.15} ",
					"{C:dark_edition}Scaler{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_emult = {
				name = {
					"Prestige: ^Mult",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"All future {X:dark_edition,C:white}^Mult{} triggers",
					"give {X:dark_edition,C:white}^#1#{} more {X:dark_edition,C:white}^Mult{}",
					"{s:0.15} ",
					"{C:dark_edition}Scaler{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_echips = {
				name = {
					"Prestige: ^Chips",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"All future {X:dark_edition,C:white}^Chips{} triggers",
					"give {X:dark_edition,C:white}^#1#{} more {X:dark_edition,C:white}^Chips{}",
					"{s:0.15} ",
					"{C:dark_edition}Scaler{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_ascension = {
				name = {
					"Prestige: Ascension",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"All future {C:gold}Ascension Power{} triggers",
					"give {C:gold}+#1#{} more {C:gold}Ascension Power{}",
					"{s:0.15} ",
					"{C:dark_edition}Cooldown{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_ascension_cd = {
				name = {
					"Prestige: Ascension",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:red}On cooldown!{}",
					"{s:0.15} ",
					"Will become functional",
					"after {C:attention}#1#{} more use#2#"
				},
			},
			c_thac_prestige_dollar_eor = {
				name = {
					"Prestige: $",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:money}+$#1#{} each {C:attention}Round",
				},
			},
			c_thac_prestige_numerator = {
				name = {
					"Prestige: Numerator",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"All listed {C:green}probabilities",
					"have {C:green}+#1# numerator",
					"{s:0.15} ",
					"{C:dark_edition}Scaler{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_denominator = {
				name = {
					"Prestige: Denominator",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"All listed {C:green}probabilities",
					"have {C:green}-#1# denominator",
					"{s:0.15} ",
					"{C:dark_edition}Scaler{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_ante = {
				name = {
					"Prestige: Ante",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:dark_edition}-#1#{} Ante",
					"{s:0.15} ",
					"{C:dark_edition}Cooldown{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_ante_cd = {
				name = {
					"Prestige: Ante",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:red}On cooldown!{}",
					"{s:0.15} ",
					"Will become functional",
					"after {C:attention}#1#{} more use#2#"
				},
			},
			c_thac_prestige_hand = {
				name = {
					"Prestige: Hand",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:blue}+#1# Hand{} per round",
					"{s:0.15} ",
					"{C:dark_edition}Cooldown{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_hand_cd = {
				name = {
					"Prestige: Hand",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:red}On cooldown!{}",
					"{s:0.15} ",
					"Will become functional",
					"after {C:attention}#1#{} more use#2#"
				},
			},
			c_thac_prestige_discard = {
				name = {
					"Prestige: Discard",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:red}+#1# Discard{} per round",
					"{s:0.15} ",
					"{C:dark_edition}Cooldown{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_discard_cd = {
				name = {
					"Prestige: Discard",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:red}On cooldown!{}",
					"{s:0.15} ",
					"Will become functional",
					"after {C:attention}#1#{} more use#2#"
				},
			},
			c_thac_prestige_energy = {
				name = {
					"Warped Energy",
					"{C:autumn,s:0.5}Probably safe?",
				},
				text = {
					"{C:pink}+#1#{} Energy Limit",
					"{s:0.15} ",
					"{C:dark_edition}Cooldown{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_energy_cd = {
				name = {
					"Warped Energy",
					"{C:autumn,s:0.5}Probably safe?",
				},
				text = {
					"{C:red}On cooldown!{}",
					"{s:0.15} ",
					"Will become functional",
					"after {C:attention}#1#{} more use#2#"
				},
			},
			c_thac_prestige_effect_slots = {
				name = {
					"Prestige: Effect Slots",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Increases {C:attention}Maximum Effect Slots{}",
					"of {C:attention}Jokers{} by {C:attention}+#1#{}",
					"{s:0.15} ",
					"{C:dark_edition}Cooldown{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
			c_thac_prestige_effect_slots_cd = {
				name = {
					"Prestige: Effect Slots",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:red}On cooldown!{}",
					"{s:0.15} ",
					"Will become functional",
					"after {C:attention}#1#{} more use#2#"
				},
			},
			c_thac_prestige_potency = {
				name = {
					"Prestige: Potency",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Increases {C:attention}Effect Potency Cap{}",
					"of {C:attention}Jokers{} by {C:attention}#1#%{}",
					"{s:0.15} ",
					"{C:dark_edition}Scaler{s:0.5,C:attention} {f:6,s:0.8}—{s:0.5,C:attention} {C:attention}#2#"
				},
			},
		},
		Stake = {
			stake_thac_culmination = {
				name = "{s:1.225,C:gold}The Culmination{}",
				text = {
					"Enables {C:red}most{} gameplay mechanics",
					"from {C:gold}most{} modded stakes",
				},
			},
		},
		Voucher = {
			v_thac_spectral_merchant = {
				name = "Spectral Merchant",
				text = {
					"{C:spectral}Spectral{} cards appear",
					"in the shop"
				},
			},
			v_thac_spectral_tycoon = {
				name = "Spectral Tycoon",
				text = {
					"{C:spectral}Spectral{} cards appear",
					"{C:attention}#1#X{} more frequently",
					"in the shop"
				},
			},
			v_thac_stamp_savvy = {
				name = "Stamp Savvy",
				text = {
					"{C:attention}Jokers{} can appear",
					"with special {C:attention}stamps{}",
				},
			},
			v_thac_stamp_coupon = {
				name = "Stamp Coupon",
				text = {
					"{C:attention}Jokers{} with special {C:attention}stamps{}",
					"cost up to {C:money}$2{} less",
				},
			},
			v_thac_oddity_merchant = {
				name = "Oddity Merchant",
				text = {
					"{C:oddity}Oddities{} appear",
					"{C:attention}#1#X{} more frequently",
					"in the shop"
				},
			},
			v_thac_oddity_tycoon = {
				name = "Oddity Tycoon",
				text = {
					"{C:oddity}Oddities{} appear",
					"{C:attention}#1#X{} more frequently",
					"in the shop"
				},
			},
			v_thac_wheel_of_wheel_of_fortune = {
				name = "Wheel of Wheel of Fortune",
				text = {
					"{C:green}#1# in #2#{} chance to create",
					"{C:attention}The Wheel of Fortune{}",
					"when {C:attention}Blind{} is selected",
					"{C:inactive}(Must have room)"
				},
			},
			v_thac_ceaseless_wheel = {
				name = "Ceaseless Wheel",
				text = {
					"{C:green}#1# in #2#{} chance to create {C:attention}The Wheel of Fortune{}",
					"whenever {C:attention}The Wheel of Fortune{} is used or sold",
					"{C:attention}The Wheel of Fortune{} cards created by this",
					"Voucher or by {C:attention}Wheel of Wheel of Fortune{} have",
					"a {C:green}#1# in #2#{} chance to be {C:dark_edition}Negative{}",
					"{C:inactive}(Must have room if not creating a {C:dark_edition}Negative{C:inactive} card)",
					"{C:inactive}(If a {C:dark_edition}Negative {C:attention}The Wheel of Fortune{C:inactive} is used or sold,",
					"{C:inactive}card creation probability is forced to be {C:green}1 in 4{C:inactive})"
				},
			},
			v_thac_plus_four = {
				name = "+4",
				text = {
					"{C:mult}+#1#{} Mult",
				},
			},
			v_thac_x_four = {
				name = "X4",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
				},
			},
			v_thac_limit_breaker = {
				name = "Limit Breaker",
				text = {
					"{C:attention}+#1#{C:blue} Hand{} and {C:red}Discard{}",
					"selection limits",
				},
			},
			v_thac_transcendant = {
				name = "Transcendant",
				text = {
					"Permanently increases",
					"{C:blue}Hand{} and {C:red}Discard{} selection",
					"limits by {C:attention}#1#{} each",
				}
			},
			v_thac_overscaling = {
				name = "Overscaling",
				text = {
					"{C:attention}Scaling Effects{} can increase {C:attention}Potency{}",
					"by a factor of {C:attention}#1#%{} over {C:attention}Potency Cap",
					"{C:inactive}({X:inactive}#2#%{C:inactive} -> {X:attention,C:white}#3#%{C:inactive})",
				}
			},
			v_thac_hyperscaling = {
				name = "Hyperscaling",
				text = {
					"{C:attention}Scaling Effects{} can increase {C:attention}Potency{}",
					"by a factor of {C:attention}#1#%{} over {C:attention}Potency Cap",
					"{X:inactive}#2#%{C:attention} -> {X:attention,C:white}#3#%",
				}
			},
		},
		Enhanced = {
			m_thac_grass = {
				name = "Grass Card",
				text = {
					'This card permanently gains',
					'{C:chips}+#1#{} chips each hand played',
					'while it stays in hand'
				},
			},
			m_thac_dirt = {
				name = "Dirt Card",
				text = {
					'This card permanently',
					'gains {C:mult}+#1#{} Mult when',
					'it is discarded'
				},
			},
			m_thac_star = {
				name = "Star Card",
				text = {
					'Reduces Blind requirement',
					'by {C:attention}#1#%{} when scored'
				},
			},
			m_thac_bone = {
				name = "Bone Card",
				text = {
					'{C:mult}+#1#{} Mult for each',
					'card in your {C:attention}graveyard{}',
					'{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)',
				},
			},
			m_thac_jewel = {
				name = "Jewel Card",
				text = {
					'Earns {C:money}$#1#{} when scored',
					'no rank or suit',
				},
			},
			m_thac_soulbound = {
				name = "Soulbound Card",
				text = {
					"Returns from your {C:attention}graveyard{}",
					"after each {C:attention}Boss Blind{}",
					"Gains {C:white,X:mult}X#1#{} Mult permanently after",
					"returning from your {C:attention}graveyard{}",
				},
			},
		},
		Edition = {
			e_thac_gilded = {
				name = "Gilded",
				text = {
					"#2# {C:money}$#1#{} of {C:attention}sell value{}#3#",
					"#4#{C:attention}#5#{}#6#"
				},
			},
		},
		Aspect = {
			thac_breath_aspect = {
				name = "Breath",
				text = {
					"This card can be {C:attention}selected beyond {C:blue}Hand{} or",
					"{C:red}Discard{} selection limits and can be {C:attention}played{}",
					"or {C:red}discarded {C:attention}beyond normal limits{}",
					"{C:tarot}Consumables{} that apply to selected cards",
					"can apply to this card {C:attention}beyond normal limits",
				},
			},
			thac_life_aspect = {
				name = "Life",
				text = {
					'{C:green}1 in 3{} chance',
					'to gain {C:blue}+2 Hands{}',
					'when scored'
				},
			},
			thac_light_aspect = {
				name = "Light",
				text = {
					'Earn {C:money}$5{} and each',
					'{C:attention}Joker{} and {C:attention}consumable{}',
					'gains {C:money}$2{} of sell value',
					'when this card scores'
				},
			},
			thac_time_aspect = {
				name = "Time",
				text = {
					'{C:red}+1 Discard{} when',
					'discarded or scored'
				},
			},
			thac_heart_aspect = {
				name = "Heart",
				text = {
					'{X:mult,C:white}X3{C:mult} Mult'
				},
			},
			thac_rage_aspect = {
				name = "Rage",
				text = {
					'{C:chips}+60{} Chips',
					'{C:chips}+300{} Chips instead',
					'on first hand of round',
				},
			},
			thac_blood_aspect = {
				name = "Blood",
				text = {
					'{C:chips}+80 chips{} for each card held',
					'in hand that {C:attention}shares a suit{}',
					'with this card when scored',
					'{C:mult}+25 Mult{} for each card held',
					'in hand that {C:attention}shares a rank{}',
					'with this card when scored',
				},
			},
			thac_doom_aspect = {
				name = "Doom",
				text = {
					'Blind requirement',
					'{C:attention}-25%{} when scored'
				},
			},
			thac_void_aspect = {
				name = "Void",
				text = {
					"Score this card as",
					"if it was {C:attention}played and",
					"{C:attention}scored{} while it is",
					"{C:lordofvoidw}held in hand{}"
				},
			},
			thac_space_aspect = {
				name = "Space",
				text = {
					'{X:mult,C:white}X0.5{} Mult for',
					'each card held in',
					'hand when scored',
					'{C:inactive}(Starts at {X:mult,C:white}X1{C:inactive} Mult)'
				},
			},
			thac_mind_aspect = {
				name = "Mind",
				text = {
					'This card permanently',
					'gains {C:white,X:mult}X0.3{} Mult while',
					'held in hand each',
					'{C:blue}Hand{} played while this',
					'card is held in hand'
				},
			},
			thac_hope_aspect = {
				name = "Hope",
				text = {
					'Retrigger this card',
					'Retriggers {C:attention}3 times instead{}',
					'on the {C:attention}final hand{}'
				},
			},
		},
		Tag = {
			tag_thac_gilded = {
				name = "Gilded Tag",
				text = {
					"makes a gilded joker in shop",
					"todo: care about this description"
				},
			},
			tag_thac_collector = {
				name = "Collector's Tag",
				text = {
					"Create random {C:oddity}Oddities{}",
					"until consumable slots are full",
					"{C:inactive}(Must have room)"
				},
			},
			tag_thac_chaos = {
				name = "Chaos Tag",
				text = {
					"Create {C:attention}#1#{} {C:purple}Tags{}",
					"{C:inactive,s:0.8}({C:attention,s:0.8}Chaos Tag{C:inactive,s:0.8} excluded)",
				},
			},
		},
		Back = {
			b_thac_wheel_of_fortune_deck = {
				name = "Wheel of Fortune Deck",
				text = {
					"Start run with the",
					"{C:tarot}Wheel of Wheel of Fortune{}",
					"voucher and {C:attention}2{} copies of",
					"{C:tarot}The Wheel of Fortune{}"
				},
			},
			b_thac_collectors_deck = {
				name = "Collector's Deck",
				text = {
					"{C:attention}+2{} consumable slots",
					"All {C:attention}consumables{} are {C:attention}replaced{} with {C:oddity}oddities{}",
				},
			},
			b_thac_undying_deck = {
				name = "Undying Deck",
				text = {
					"All cards return from your",
					"{C:attention}graveyard{} after defeating",
					"each {C:attention}Boss Blind{}",
				},
			},
			b_thac_duality = {
				name = "Duality Deck",
				text = {
					"{C:blue}+1{C:attention} Joker{} slot",
					"{C:purple}+1{C:attention} consumable{} slot",
					"{C:red}-1{C:blue} Hand{} and{C:red} Discard",
				},
			},
			b_thac_gambling = {
				name = "Gambling Deck",
				text = {
					"{C:attention}Doubles{} all listed",
					"{C:green}probabilities{}"
				},
			},
			b_thac_purple = {
				name = "Purple Deck",
				text = {
					"{C:attention}+1{C:blue} Hand{} and {C:red}Discard{}",
					"selection limits",
				},
			},
			b_thac_teal = {
				name = "Teal Deck",
				text = {
					"{C:attention}+2{C:blue} Hand{} and {C:red}Discard{}",
					"selection limits",
					"{C:red}-1{C:attention} hand size",
				},
			},
			b_thac_pink = {
				name = "Pink Deck",
				text = {
					"{C:attention}+2{} hand size",
					"{C:red}-1{C:blue} Hand{C:attention} and {C:red}Discard{}",
					"{C:attention}selection limits",
				},
			},
			b_thac_cyan = {
				name = "Cyan Deck",
				text = {
					" ",
				},
			},
			b_thac_fuchsia = {
				name = "Fuchsia Deck",
				text = {
					" ",
				},
			},
			b_thac_orange = {
				name = "Orange Deck",
				text = {
					" ",
				},
			},
			b_thac_lime = {
				name = "Lime Deck",
				text = {
					" ",
				},
			},
			b_thac_violet = {
				name = "Violet Deck",
				text = {
					" ",
				},
			},
			b_thac_grey = {
				name = "Grey Deck",
				text = {
					"{C:inactive}Does nothing",
				},
			},
			b_thac_pale = {
				name = "Pale Deck",
				text = {
					" ",
				},
			},
			b_thac_lavender = {
				name = "Lavender Deck",
				text = {
					"Each starting card is missing",
					"either its {C:attention}suit{} or {C:attention}rank{}",
					"Starting cards with",
					"no {C:attention}rank{} gain {C:mult}+2 Mult",
					"permanently",
				},
			},
		},
		Other = {
			['what_are_you_wearing'] = {
                name = "what are you wearing",
                text = {
                    "{C:knightofheart}what the hell are you wearing???",
                    "{C:witchofmind}uhhhh witch of mind outfit duh",
                    "{C:knightofheart}have you finally figured your classpect out",
                    "{C:witchofmind}y3a :3",
                    "{C:witchofmind}i think",
                    "{C:knightofheart}good grief you are insufferable",
                    "{C:witchofmind}thanks you too",
                    "{C:money}Do you two ever have conversations about",
                    "{C:money}anything relevant without my guidance?",
                    "{C:witchofmind}do w3 with it?",
                }
            },
			['from_me_to_you'] = {
                name = "you want me to stop? hahahaha",
                text = {
                    "{C:autumn}Mindless drone, driven by pursuit",
                    "{C:autumn}of the highest possible number;",
                    "{C:autumn}You know how this story ends,",
                    "{C:autumn}but you continue onwards towards a",
                        "{C:dark_edition}Dark Apotheosis.",
                    "{C:autumn}What is it you hope to accomplish, child?{}",
                }
            },
			['s_lord_retrieve_body'] = {
                name = "[S] Lord: Retrieve Body",
                text = {
                    "{C:money}I am the Lord of Void.",
                    "{C:money}All things discarded...",
                    "{C:money}Cast into the void...",
                    "{C:money}They fall into my domain.",
                    "{C:money}They are mine to claim.",
                    "{C:money}Besides...",
                    "{X:witchofmind,C:lordofvoid}YOU{C:lordofvoid}...",
                    "{C:lordofvoid}HA HA HA HA HA HA HA HA HA!",
                    "{X:witchofmind,C:lordofvoid}YOU{C:lordofvoid} CREATED ONE WITH {X:money,C:lordofvoid}MY{C:lordofvoid} {X:money,C:lordofvoid}NAME{C:lordofvoid} ON IT.",
                }
            },
			['s_lord_witness_victory'] = {
                name = "[S] Lord: Witness Victory",
                text = {
                    "{C:lordofvoid}A future that need not come to pass.",
                    "{C:lordofvoid}...",
                    "{C:lordofvoid}Let us not dwell here.",
                }
            },
			['s_lord_continue'] = {
                name = "[S] Lord: Continue",
                text = {
                    "{C:money}Commendable. You almost won.",
                    "{C:money}Had all my moves predicted, even.",
					"{C:money}Every time I'd make an attack, you'd dodge.",
					"{C:money}Not hard to figure out how.",
					"{C:money}With a power like {C:attention}that{C:money{}...",
					"{C:money}You might have had a chance.",
					"{C:money}Except for one, fatal, flaw.",
					"{C:lordofvoid}I refuse to be determined.",
                }
            },
			prestige_ante_effect = {
				name = "Prestige: Ante",
				text = {
					"{C:dark_edition}-1{} Ante",
				},
			},
			prestige_hand_effect = {
				name = "Prestige: Hand",
				text = {
					"{C:blue}+#1# Hand{} per round",
				},
			},
			prestige_discard_effect = {
				name = "Prestige: Discard",
				text = {
					"{C:red}+#1# Discard{} per round",
				},
			},
			prestige_ascension_effect = {
				name = "Prestige: Ascension",
				text = {
					"All future {C:gold}Ascension Power{} triggers",
					"give {C:gold}+#1#{} more {C:gold}Ascension Power{}",
				},
			},
			prestige_energy_effect = {
				name = "Warped Energy",
				text = {
					"{C:pink}+#1#{} Energy Limit",
				},
			},
			prestige_effect_slots_effect = {
				name = "Prestige: Effect Slots",
				text = {
					"Increases {C:attention}Maximum Effect Slots{}",
					"of {C:attention}Jokers{} by {C:attention}+#1#{}",
				},
			},
			p_thac_option_select = {
				name = "{V:1}Option {V:2}Select",
				text = {
					"Holds {V:1}#1#{} cards which",
					"you may choose {V:2}#2#{} to",
					"decide your {C:dark_edition}fate",
				},
			},
			thac_culmination_sticker = {
                name = 'Culmination Sticker',
                text = {
                    'Used this Joker to',
                    'win {C:gold}The Culmination',
                }
            },
		},
		Blind = {
			bl_thac_jera = {
				name = "Jera",
				text = {
					"1 in 4 chance to","copy played cards",
				},
			},
			bl_thac_thac = {
				name = "Þe Autumn Circus",
				text = {
					"Debuffs each playing card",
					"with a card of matching",
					"rank in your graveyard"
				},
			},
		},
	},
	ExtraEffectTypes = {
		-- Chain: For context.post_trigger effects
		chain = "Chain",
		-- Impulse: For forcetriggering effects
		impulse = "Impulse",
		-- Aura: For multi-Joker effects
		aura = "Aura",
		-- Scaling: For Potency-increasing effects
		-- This is used as a blacklist for these types of effects (probably)
		scaling = "Scaling",
	},
	ExtraEffects = {
		thac_handsel = {
			name = "Dexterity",
            text = {
                "Joker gives {C:blue}+#2# Hand",
				"{C:blue}selection limit",
            },
		},
		thac_discardsel = {
			name = "Clumsiness",
            text = {
                "Joker gives {C:red}+#2# Discard",
				"{C:red}selection limit",
            },
		},
		thac_consumableslot = {
			name = "Collector's Boon",
            text = {
                "Joker gives {C:purple}+#2#",
				"{C:purple}consumable slot#3#",
            },
		},
		thac_horoscopeslot = {
			name = "Horoscope Fanatic",
            text = {
                "Joker gives {C:attention}+#2#",
				"{C:attention}horoscope slot#3#",
            },
		},
		thac_handleveler = {
			name = "Man I Love #2#",
            text = {
                "Level up {C:attention}#2#{} after",
				"this {C:attention}Joker{} triggers {C:attention}#3#{} time#4#,",
				"then {C:attention}increase{} this threshold",
				"by {C:attention}#5#{} trigger#6#{C:inactive} ({C:attention}#7#{C:inactive} left)",
            },
		},
		thac_suitleveler = {
			name = "Apprentice of {V:2}#2#{}",
            text = {
                "Level up {V:2}#2#{} suit after",
				"this {C:attention}Joker{} triggers {C:attention}#3#{} time#4#,",
				"then {C:attention}increase{} this threshold",
				"by {C:attention}#5#{} trigger#6#{C:inactive} ({C:attention}#7#{C:inactive} left)",
            },
		},
        thac_attr_mult = {
            name = "{V:1}#2#{} Synergy M",
            text = {
                "{V:1}#2#{C:attention} Jokers{} give {C:mult}+#1#{} Mult",
            },
        },
        thac_attr_chips = {
            name = "{V:1}#2#{} Synergy C",
            text = {
                "{V:1}#2#{C:attention} Jokers{} give {C:chips}+#1#{} Chips",
            },
        },
        thac_attr_xmult = {
            name = "{V:1}#2#{} Synergy X",
            text = {
                "{V:1}#2#{C:attention} Jokers{} give {X:mult,C:white}X#1#{} Mult",
            },
        },
        thac_attr_asc = {
            name = "{V:1}#2#{} Synergy A",
            text = {
                "{V:1}#2#{C:attention} Jokers{} give","{C:gold}+#1#{} Ascension Power",
            },
        },
        thac_ygotype_mult = {
            name = "{C:joy_normal}#2#{} Synergy M",
            text = {
                "{C:joy_normal}#2#{C:attention} Jokers{} give {C:mult}+#1#{} Mult",
            },
        },
        thac_ygotype_chips = {
            name = "{C:joy_normal}#2#{} Synergy C",
            text = {
                "{C:joy_normal}#2#{C:attention} Jokers{} give {C:chips}+#1#{} Chips",
            },
        },
        thac_ygotype_xmult = {
            name = "{C:joy_normal}#2#{} Synergy X",
            text = {
                "{C:joy_normal}#2#{C:attention} Jokers{} give {X:mult,C:white}X#1#{} Mult",
            },
        },
        thac_ygotype_asc = {
            name = "{C:joy_normal}#2#{} Synergy A",
            text = {
                "{C:joy_normal}#2#{C:attention} Jokers{} give","{C:gold}+#1#{} Ascension Power",
            },
        },
        thac_hand_mult = {
            name = "#2# Synergy M",
            text = {
                "{C:attention}Joker{} gives {C:mult}+#1#{} Mult if {C:blue}Hand{}",
				"contains {C:attention}#2#{}",
            },
        },
        thac_hand_chips = {
            name = "#2# Synergy C",
            text = {
                "{C:attention}Joker{} gives {C:chips}+#1#{} Chips if {C:blue}Hand{}",
				"contains {C:attention}#2#{}",
            },
        },
        thac_hand_xmult = {
            name = "#2# Synergy X",
            text = {
                "{C:attention}Joker{} gives {C:white,X:mult}X#1#{} Mult if {C:blue}Hand{}",
				"contains {C:attention}#2#{}",
            },
        },
        thac_hand_asc = {
            name = "#2# Synergy A",
            text = {
                "{C:attention}Joker{} gives {C:gold}+#1#{} Ascension Power if {C:blue}Hand{}",
				"contains {C:attention}#2#{}",
            },
        },
        thac_small_hands = {
            name = "Small Hands",
            text = {
                "{C:attention}Joker{} gives {C:mult}+#1#{} Mult if {C:blue}Hand{}",
				"contains {C:attention}#2# or fewer{} cards",
            },
        },
        thac_cq_mult = {
            name = "#3# Synergy M",
            text = {
                "Scored {C:attention}#2#{} cards",
                "give {C:mult}+#1#{} Mult",
            },
        },
        thac_cq_chips = {
            name = "#3# Synergy C",
            text = {
                "Scored {C:attention}#2#{} cards",
                "give {C:chips}+#1#{} Chips",
            },
        },
        thac_cq_xmult = {
            name = "#3# Synergy X",
            text = {
                "Scored {C:attention}#2#{} cards",
                "give {C:white,X:mult}X#1#{} Mult",
            },
        },
        thac_cq_asc = {
            name = "#3# Synergy A",
            text = {
                "Scored {C:attention}#2#{} cards",
                "give {C:gold}+#1#{} Ascension Power",
            },
        },
        thac_bj_mult = {
            name = "Blue Jokes M",
            text = {
                "{C:attention}Joker{} gives {C:mult}+#1#{} Mult for",
				"each remaining card in {C:attention}deck",
				"{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)",
            },
        },
        thac_bj_chips = {
            name = "Blue Jokes C",
            text = {
                "{C:attention}Joker{} gives {C:chips}+#1#{} Chips for",
				"each remaining card in {C:attention}deck",
				"{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)",
            },
        },
        thac_bj_xmult = {
            name = "Blue Jokes X",
            text = {
                "{C:attention}Joker{} gives {C:white,X:mult}X#1#{} Mult for",
				"each remaining card in {C:attention}deck",
				"{C:inactive}(Currently: {C:white,X:mult}X#2#{C:inactive} Mult)",
            },
        },
        thac_bj_asc = {
            name = "Blue Jokes A",
            text = {
                "{C:attention}Joker{} gives {C:gold}+#1#{} Ascension Power for",
				"each remaining card in {C:attention}deck",
				"{C:inactive}(Currently: {C:gold}+#2#{C:inactive} Ascension Power)",
            },
        },
        thac_bonus_attr = {
            name = "{V:1}#1#{}-Attuned",
            text = {
                "{C:attention}Joker{} is also {V:1}#1#{}",
            },
        },
        thac_bonus_ygotype = {
            name = "Form of {C:joy_normal}#1#{}",
            text = {
                "{C:attention}Joker{} is also a#2# {C:joy_normal}#1#{}",
            },
        },
        thac_first_cq_mult = {
            name = "#3# First Strike M",
            text = {
                "First scored {C:attention}#2#{}",
                "card gives {C:mult}+#1#{} Mult",
            },
        },
        thac_first_cq_chips = {
            name = "#3# First Strike C",
            text = {
                "First scored {C:attention}#2#{}",
                "card gives {C:chips}+#1#{} Chips",
            },
        },
        thac_first_cq_xmult = {
            name = "#3# First Strike X",
            text = {
                "First scored {C:attention}#2#{}",
                "card gives {C:white,X:mult}X#1#{} Mult",
            },
        },
        thac_first_cq_asc = {
            name = "#3# First Strike A",
            text = {
                "First scored {C:attention}#2#{} card",
                "gives {C:gold}+#1#{} Ascension Power",
            },
        },
        thac_simplicity = {
            name = "Simplicity",
            text = {
                "{C:mult}+#1#{} Mult",
				"Increases the {C:green}denominator{} of",
				"all {C:green}listed probabilities{} by {C:red}#1#",
            },
        },
        thac_more_xchips = {
            name = "More XChips",
            text = {
                "{C:white,X:chips}X#1#{} Chips"
            },
        },
        thac_more_asc = {
            name = "More {C:gold}Ascension Power",
            text = {
                "{C:gold}+#1#{} Ascension Power",
            },
        },
        thac_more_xasc = {
            name = "More {C:gold}XAscension Power",
            text = {
                "{X:gold,C:white}X#1#{} Ascension Power",
            },
        },
        thac_flipside_buff = {
            name = "Flip-Side Buff",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
				"while in the {C:purple}Flip-Side",
            },
        },
        thac_combo_mult = {
            name = "Comedy Combo M",
            text = {
                "{C:mult}+#1#{} Mult when",
				"this {C:attention}Joker{} triggers"
            },
        },
        thac_combo_chips = {
            name = "Comedy Combo C",
            text = {
                "{C:chips}+#1#{} Chips when",
				"this {C:attention}Joker{} triggers"
            },
        },
        thac_combo_xmult = {
            name = "Comedy Combo X",
            text = {
                "{C:white,X:mult}X#1#{} Mult when",
				"this {C:attention}Joker{} triggers"
            },
        },
        thac_combo_asc = {
            name = "Comedy Combo A",
            text = {
                "{C:gold}+#1#{} Ascension Power when",
				"this {C:attention}Joker{} triggers"
            },
        },
        thac_fadeout = {
            name = "Fadeout",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
				"for each card below {C:attention}#2#{} in your {C:attention}full deck",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#3#%{C:inactive} more Chips/Mult)",
            },
        },
        thac_magazine = {
            name = "Magazine",
            text = {
                "Counts as {C:attention}#1#{} Bullet#2#",
            },
        },
        thac_spellcaster = {
            name = "Spellcaster",
            text = {
				"{C:attention}Joker{} casts a {C:purple,E:1}Spell{} based",
				"on the first two cards held",
				"in hand and a#2# {C:attention}#1#{}'s power",
            },
        },
        thac_incrementalist = {
            name = "#1# Incrementalist",
            text = {
                "Creates a#2# {C:attention}#1#{} after",
				"this {C:attention}Joker{} triggers {C:attention}#3#{} times",
				"{C:inactive}(Must have room, {C:attention}#4#{C:inactive} left)",
				
            },
        },
        thac_poketype_mult = {
            name = "{V:1}#2#{}-Type Synergy M",
            text = {
                "{V:1}#2#{}-type{C:attention} Jokers{} give {C:mult}+#1#{} Mult",
            },
        },
        thac_poketype_chips = {
            name = "{V:1}#2#{}-Type Synergy C",
            text = {
                "{V:1}#2#{}-type{C:attention} Jokers{} give {C:chips}+#1#{} Chips",
            },
        },
        thac_poketype_xmult = {
            name = "{V:1}#2#{}-Type Synergy X",
            text = {
                "{V:1}#2#{}-type{C:attention} Jokers{} give {X:mult,C:white}X#1#{} Mult",
            },
        },
        thac_poketype_asc = {
            name = "{V:1}#2#{}-Type Synergy A",
            text = {
                "{V:1}#2#{}-type{C:attention} Jokers{} give","{C:gold}+#1#{} Ascension Power",
            },
        },
        thac_genre_whiplash = {
            name = "Genre Whiplash",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
				"for each {C:attention}unique Genre{} among your {C:attention}Jokers{}",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#2#%{C:inactive} more Chips/Mult)",
            },
        },
        thac_more_dakka = {
            name = "More Dakka",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more",
				"{C:chips}Chips{}/{C:mult}Mult{} for each Bullet",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#2#%{C:inactive} more Chips/Mult)",
            },
        },
        thac_enh_force = {
            name = "#2# Force",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{} for",
				"each {C:attention}#2#{} in your {C:attention}full deck",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#3#%{C:inactive} more Chips/Mult)",
            },
        },
        thac_hang_in_there = {
            name = "Hang In There, \\##2#!",
            text = {
                "Retrigger the {C:attention}#3#{} played card",
				"used in scoring {C:attention}#1#{} time#4#",
            },
        },
        thac_genre_hater = {
            name = "{V:1}#3#{} Hater",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{} for",
				"each non-{V:1}#3# {C:attention}Movie Joker{}",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#2#%{C:inactive} more Chips/Mult)",
            },
        },
        thac_bigger_picture = {
            name = "Bigger Picture",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
				"for each {C:attention}Joker{} card",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#2#%{C:inactive} more Chips/Mult)",
            },
        },
        thac_phasing = {
            name = "Phasing",
            text = {
                "When {C:attention}Blind{} is selected, {C:attention}banish{} this",
				"{C:attention}Joker{} until {C:attention}next Blind{} is selected",
            },
        },
        thac_hardboiled = {
            name = "Hard-Boiled",
            text = {
                "Joker gains {C:money}$#1#{} of {C:attention}sell",
				"{C:attention}value{} at end of round",
            },
        },
        thac_simple_scaling = {
            name = "Simple Scaling",
            text = {
                "Increase the {C:attention}Potency{} of a random {C:attention}Effect",
				"of this Joker by {C:attention}#1#%{} at end of round",
            },
        },
        thac_caino = {
            name = "Canio's Mark: #3#",
            text = {
                "Increase the {C:attention}Potency{} of this",
				"Joker's {C:attention}Effects{} by {C:attention}#1#%{} when",
				"a#4# {C:attention}#2#{} card is destroyed",
            },
        },
        thac_yorick = {
            name = "Essence of Yorick",
            text = {
                "Increase the {C:attention}Potency{} of this",
				"Joker's {C:attention}Effects{} by {C:attention}#1#%{} every",
				"{C:attention}#2#{C:inactive} [#3#]{} cards discarded",
            },
        },
        thac_hiking = {
            name = "Hiking",
            text = {
                "Scored cards permanently",
				"gain {C:chips}+#1#{} Chips when scored",
            },
        },
        thac_lounging = {
            name = "Lounging",
            text = {
                "Cards held in hand permanently",
				"gain {C:chips}+#1#{} Chips when held in hand",
            },
        },
        thac_skulking = {
            name = "Skulking",
            text = {
                "Unscored played cards permanently",
				"gain {C:chips}+#1#{} Chips when unscoring",
            },
        },
        thac_dramatic_entrance = {
            name = "Dramatic Entrance",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
				"on {C:attention}first hand of round",
            },
        },
        thac_grand_finale = {
            name = "Grand Finale",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
				"on {C:attention}final hand of round",
            },
        },
        thac_more_plusmult = {
            name = "More +Mult",
            text = {
                "{C:mult}+#1# +Mult"
            },
        },
        thac_more_xplusmult = {
            name = "More X+Mult",
            text = {
                "{C:white,X:mult}X#1#{C:mult} +Mult"
            },
        },
		thac_colour_by_jokes = {
			name = "Colour-By-Jokes",
            text = {
                "Each held {C:colour}Colour{} card gains",
				"{C:attention}1 round{} after this Joker",
				"triggers {C:attention}#1#{} time#2# {C:inactive}({C:attention}#3#{C:inactive} left)",
            },
		},
		thac_hexing_jesting = {
			name = "Hexing Jesting",
            text = {
				"Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
				"for each {V:1}Hex{} in your {C:attention}full deck{}",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#2#%{C:inactive} more Chips/Mult)",
				"{s:0.15} ",
				"A random card in your {C:attention}full deck",
				"becomes {C:attention}#3#{} at end of round",
            },
		},
        thac_cq_force = {
            name = "#4# Card Force",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{} for",
				"each {C:attention}#3#{} card in your {C:attention}full deck",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#2#%{C:inactive} more Chips/Mult)",
            },
        },
        thac_critical_chance = {
            name = "Critical Chance",
            text = {
                "{C:green}#1#%{} chance for this Joker to",
				"give {X:stck_m_a_c,C:white}#2#%{} more {C:chips}Chips{}/{C:mult}Mult{}",
            },
        },
		thac_conflagration = {
			name = "Conflagration",
            text = {
				"Jokers and played cards with {C:attention}Burn",
				"{C:attention}Counters{} give {X:mult,C:white}X#1#{} Mult when scored",
				"{s:0.15} ",
				"Put a {C:attention}Burn Counter{} on a random card",
				"held in hand after {C:blue}Hand{} is played",
            },
		},
        thac_truant = {
            name = "Truant",
            text = {
				"Put a {C:attention}Stun Counter{} on",
				"this {C:attention}Joker{} after it triggers"
            },
        },
        thac_counter_up = {
            name = "Counter Up",
            text = {
				"If this {C:attention}Joker{} has a {C:attention}Counter{}",
				"on it, it gains {C:attention}#1#{} of that type",
				"of {C:attention}Counter{} at end of round",
            },
        },
        thac_held_counter = {
            name = "#2#holder",
            text = {
				"Distribute #1# {C:attention}#2##3#{}",
				"randomly among cards held",
				"in hand at end of round",
            },
        },
		thac_cq_spawner = {
			name = "#4# Card Printer",
			text = {
				"When round begins, add {C:attention}#1#{} random",
				"{C:attention}#3# card#2#{} to your hand",
			},
		},
        thac_counter_force = {
            name = "#3# Force",
            text = {
                "Joker gives {X:stck_m_a_c,C:white}#1#%{} more {C:chips}Chips{}/{C:mult}Mult{} for each",
				"{C:attention}#3#{} on cards in your {C:attention}full deck",
				"{C:inactive}(Currently: {X:stck_m_a_c,C:white}#2#%{C:inactive} more Chips/Mult)",
            },
        },
	},
}