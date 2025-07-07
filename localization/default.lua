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
					"Played cards are {C:attention}converted{} to {C:hearts}Hearts{}",
					"and this Joker gains the following",
					"depending on the card's {C:attention}original suit{}:",
					"{C:spades}Spades{}: {C:chips}+#1#{} Chips {C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
					"{C:clubs}Clubs{}: {C:mult}+#3#{} Mult {C:inactive}(Currently {C:mult}+#4#{C:inactive} Mult)",
					"{C:diamonds}Diamonds{}: {C:money}+$#5#{} at end of round {C:inactive}(Currently {C:money}$#6#{C:inactive})",
					"{C:attention}Other suits{}: {C:mult}+{X:mult,C:white} X#7# {} Mult {C:inactive}(Currently {X:mult,C:white} X#8# {C:inactive} Mult)"
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
		},
		Tarot = {
		},
		Planet = {
		},
		Spectral = {
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
					"{C:attention}River Cards{} and puts",
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
			c_thac_gift_of_the_knight = {
				name = {
					"Gift of the Knight",
					"{C:autumn,s:0.5}Your indeterminate fate shines within you",
				},
				text = {
					"Creates a random",
					"{C:dark_edition}Polychrome {C:attention}3 of {C:hearts}Hearts{}",
					"with {C:knightofheart}Heart{C:red} Aspect",
					"and adds it to your hand",
				},
			},
			c_thac_dance_with_the_dead = {
				name = {
					"Dance with the Dead",
					"{C:autumn,s:0.5}We all fall down!",
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
					"Gains {C:mult}+#1#{} Mult permanently after",
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
					'{X:chips,C:white} X3 {} chips'
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
					"Scores this card's",
					"{C:chips}Chips{} and {C:mult}Mult{}",
					"values while it is",
					"held in hand"
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
					'gains {C:mult}+5{} Mult while',
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
					" ",
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
		},
		Blind = {
			bl_thac_jera = {
				name = "Jera",
				text = {
					"1 in 4 chance to","copy played cards",
				},
			},
		},
	},
}