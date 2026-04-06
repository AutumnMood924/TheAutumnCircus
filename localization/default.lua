return {
	misc = {
		ranks = {
			thac_jester = "Jester",
			thac_wand = "Wand",
			thac_sword = "Sword",
			thac_vessel = "Vessel",
			thac_coin = "Coin",
		},
		dictionary = {
			k_thac_scrapped = "Scrapped!",
			k_thac_partied = "Partied!",
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
			k_thac_minty = "Minty!",
			
			k_thac_option_select = "Option Select",
		},
		v_dictionary = {
			a_thac_handsize = "+#1# Hand Size",
			a_thac_handsize_minus = "-#1# Hand Size",
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
			j_thac_highest_number = {
				name = {
					"The Highest Number",
					"{C:knightofheartw,s:0.5}there's nothing higher...",
				},
				text = {
					"Played {C:attention}9s{} reduce {C:attention}Blind{}",
					"requirement by {C:attention}#1#%{}",
					"This Joker {C:attention}becomes stronger{}",
					"after each {C:attention}Boss Blind{} slain"
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
					"up to {C:attention}#1#{} random card#2# from your",
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
			j_thac_listkeeper = {
				name = {
					"Listkeeper",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"Played {C:attention}List Cards{} earn {C:money}$#1#{} for",
					"each of their {C:attention}written poker{}",
					"{C:attention}hands{}, then {C:red}erase{} those {C:attention}hands"
				},
			},
			j_thac_jimbos_brother = {
				name = {
					"Jimbo's Brother",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:mult}+#1#{} Mult whenever","{C:attention}exactly{C:mult} +4 {}Mult is scored"
				},
			},
			['j_thac_:joker:'] = {
				name = "{f:thac_emoji}🃏{}",
				text = {
					"{C:mult,s:1.1}+#1#{s:1.1} Mult",
				},
			},
			['j_thac_:free:'] = {
				name = "{C:blue,f:thac_emoji}🆓{}",
				text = {
					"{X:blue,s:1.5,C:white}FREE",
				},
			},
		},
		Tarot = {
			c_thac_fool = {
				name = {
					"Þe Fool",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_magician = {
				name = {
					"Þe Magician",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Randomly earn one of:",
					"{C:money}$#1#{}, {C:money}$#2#{}, {C:money}$#3#{}, a {C:tarot}Tarot{}","Card, a {C:class}Class{} Card,","or a {C:spectral}Spectral{} Card"
				},
			},
			c_thac_high_priestess = {
				name = {
					"Þe High Priestess",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
				},
			},
			c_thac_empress = {
				name = {
					"Þe Empress",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
				},
			},
			c_thac_emperor = {
				name = {
					"Þe Emperor",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_hierophant = {
				name = {
					"Þe Hierophant",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Creates up to",
					"{C:attention}#1#{C:class} Class{} cards",
					"{C:inactive}(Must have room)",
				},
			},
			c_thac_lovers = {
				name = {
					"Þe Lovers",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Combine {C:attention}#1#",
					"selected cards",
					"into {C:attention}one{} card"
				},
			},
			c_thac_chariot = {
				name = {
					"Þe Chariot",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_justice = {
				name = {
					"Justice",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
				},
			},
			c_thac_hermit = {
				name = {
					"Þe Hermit",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected card into",
					"a {C:attention}#2#"
				},
			},
			c_thac_wheel_of_fortune = {
				name = {
					"Wheel of Fortune",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Randomize the rank,",
					"suit, and enhancement",
					"of {C:attention}#1#{} selected cards",
				},
			},
			c_thac_strength = {
				name = {
					"StrengÞ",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
				},
			},
			c_thac_hanged_man = {
				name = {
					"Þe Hanged Man",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_death = {
				name = {
					"DeaÞ",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_temperance = {
				name = {
					"Temperance",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Earn {C:attention}${} equal to the",
					"selected cards' {C:attention}summed",
					"{C:attention}suit levels{C:inactive} (Max {C:money}$#1#{C:inactive})",
					"{C:inactive}(Currently {C:money}$#2#{C:inactive})",
				},
			},
			c_thac_devil = {
				name = {
					"Þe Devil",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected card into",
					"a {C:attention}#2#"
				},
			},
			c_thac_tower = {
				name = {
					"Þe Tower",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Destroy {C:attention}#1#{}",
					"random cards in",
					"your full deck",
				},
			},
			c_thac_star = {
				name = {
					"Þe Star",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_mon = {
				name = {
					"Þe Moon",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Creates {C:attention}#1#",
					"{C:attention}Orbital Tag#2#"
				},
			},
			c_thac_sun = {
				name = {
					"Þe Sun",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_judgement = {
				name = {
					"Judgement",
					"{C:autumn,s:0.5}Work in Progress!",
				},
				text = {
					"Creates {C:attention}#1#{} Tags",
				},
			},
			c_thac_world = {
				name = {
					"Þe World",
					"{C:autumn,s:0.5}Work in Progress!",
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
			},
		},
		Planet = {
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
		},
		Spectral = {
		},
		Oddity = {
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
			c_thac_gift_of_the_knight = {
				name = {
					"Gift of the Knight",
					"{C:autumn,s:0.5}Three of...",
				},
				text = {
					"Creates a {C:dark_edition}Polychrome {C:attention}Sword",
					"of {C:hearts}Hearts{} with {C:knightofheart}Heart{C:red} Aspect",
					"and adds it to your hand",
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
			c_thac_mass_reanimation = {
				name = {
					"Mass Reanimation",
					"{C:autumn,s:0.5}Familiar faces surround me",
				},
				text = {
					"Enhances {C:attention}all cards{} in your",
					"{C:attention}graveyard{} to {C:attention}Soulbound Cards",
				},
			},
		},
		Class = {
			c_thac_sylph = {
				name = {
					"The Sylph",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_mage = {
				name = {
					"The Mage",
				},
				text = {
					"Upgrades each of",
					"{C:attention}#1#{} selected cards",
					"to {C:attention}#2#{} rank"
				},
			},
			c_thac_knight = {
				name = {
					"The Knight",
				},
				text = {
					"Upgrades each of",
					"{C:attention}#1#{} selected cards",
					"to {C:attention}#2#{} rank"
				},
			},
			c_thac_thief = {
				name = {
					"The Thief",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected card into",
					"a {C:attention}#2#"
				},
			},
			c_thac_prince = {
				name = {
					"The Prince",
				},
				text = {
					"Destroys up to {C:attention}#1#",
					"selected cards {C:attention}if",
					"they share a {C:attention}suit",
				},
			},
			c_thac_witch = {
				name = {
					"The Witch",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected cards to",
					"{C:attention}#2#s"
				},
			},
			c_thac_lord = {
				name = {
					"The Lord",
				},
				text = {
					"Enhances {C:attention}all",
					"selected cards to",
					"{C:attention}#1#s"
				},
			},
			c_thac_maid = {
				name = {
					"The Maid",
				},
				text = {
					"Creates {C:attention}#1#",
					"{C:attention}Double Tag#2#"
				},
			},
			c_thac_seer = {
				name = {
					"The Seer",
				},
				text = {
					"Creates up to",
					"{C:attention}#1#{C:class} Class{} cards",
					"{C:inactive}(Must have room)",
				},
			},
			c_thac_page = {
				name = {
					"The Page",
				},
				text = {
					"Enhances {C:attention}#1#",
					"selected card into",
					"a {C:attention}#2#"
				},
			},
			c_thac_rogue = {
				name = {
					"The Rogue",
				},
				text = {
					"Upgrades each of",
					"{C:attention}#1#{} selected cards",
					"to {C:attention}#2#{} rank"
				},
			},
			c_thac_bard = {
				name = {
					"The Bard",
				},
				text = {
					"Upgrades each of",
					"{C:attention}#1#{} selected cards",
					"to {C:attention}#2#{} rank"
				},
			},
			c_thac_heir = {
				name = {
					"The Heir",
				},
				text = {
					"Upgrades each of",
					"{C:attention}#1#{} selected cards",
					"to {C:attention}#2#{} rank"
				},
			},
			c_thac_muse = {
				name = {
					"The Muse",
					"{C:autumn,s:0.5}Work In Progress!",
				},
				text = {
					"{C:attention}#1#{} random cards in",
					"hand become copies of",
					"{C:attention}one{} selected card",
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
					'{C:chips}+#1#{} Chips for each',
					'card in your {C:attention}graveyard{}',
					'{C:inactive}(Currently: {C:chips}+#2#{C:inactive} Chips)',
				},
			},
			m_thac_jewel = {
				name = "Jewel Card",
				text = {
					'Earns {C:money}$#1#{} when scored',
					'no rank or suit',
					'always scores',
				},
			},
			m_thac_soulbound = {
				name = "Soulbound Card",
				text = {
					"Returns from your {C:attention}graveyard{}",
					"after completing a {C:attention}Blind{}",
					"Gains {C:mult}+{C:white,X:mult}X#1#{} Mult permanently after",
					"returning from your {C:attention}graveyard{}",
				},
			},
			m_thac_loop = {
				name = "Loop Card",
				text = {
					'Retriggers {C:attention}#1#{} time#2#',
					'when scored',
				},
			},
			m_thac_ruled = {
				name = "List Card",
				text = {
					'{C:attention}Write{} played {C:attention}standard hands{} onto',
					'this card while it is {C:attention}held in hand',
					'{s:0.17} ',
					'This card gives {C:chips}Chips{} and {C:mult}Mult{} equal',
					'to the {C:attention}highest{} base {C:chips}Chips{} and {C:mult}Mult{}',
					'of poker hands {C:attention}written{} on it',
					'{C:inactive}(Currently: {C:chips}+#1#{C:inactive} Chips and {C:mult}+#2#{C:inactive} Mult)',
					'{s:0.17} ',
					'no rank or suit, always scores',
				},
			},
			m_thac_plan = {
				name = "Plan Card",
				text = {
					'Draws another {C:attention}Plan Card{}',
					'to hand when scored'
				},
			},
			m_thac_cardboard = {
				name = "Cardboard Card",
				text = {
					'{C:white,X:chips}X#1#{} Chips if scored','with {C:money}$#2#{} or less'
				},
			},
			m_thac_mist = {
				name = "Mist Card",
				text = {
					'When round begins with this',
					'card in your {C:attention}graveyard{}, create',
					'a {C:dark_edition}Temporary{} copy of this card',
					'and add it to your hand'
				},
			},
			m_thac_tempmist = {
				name = "Mist Copy",
				text = {
					'{C:dark_edition}Temporary',
					'Removed from your deck',
					'at end of round',
					"{C:inactive,s:0.6}Doesn't enter your graveyard"
				},
			},
			m_thac_angel = {
				name = "Angel Card",
				text = {
					'{C:attention}Becomes stronger{}',"{C:inactive}(Currently: {C:purple}+#1#{C:inactive} Score)",'no rank or suit','always scores'
				},
			},
			m_thac_school = {
				name = "Focus Card",
				text = {
					'{C:mult}+#1#{} Mult when scored',
					'Resets when discarded',
					'or unscoring',
					'{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)',
				},
			},
			m_thac_spark = {
				name = "Glitter Card",
				text = {
					'Chips and Mult from {C:attention}suit',
					'{C:attention}level{} increased by {C:white,X:attention}X#1#{}',
				},
			},
			m_thac_mint = {
				name = "Mint Card",
				text = {
					'Gains {C:money}$#1#{C:attention} when scored{} when',
					'held in hand {C:inactive}(Currently: {C:money}$#2#{C:inactive})',
                    "{C:green}#3# in #4#{} chance to {C:red}destroy",
					"this card {C:attention}when it is played",
				},
			},
			m_thac_shadow = {
				name = "Shadow Card",
				text = {
					"While held in hand, gain {C:attention}+#1# hand",
					"{C:attention}size{} this {C:attention}Round{} and {C:red}+#2#% Blind",
					"{C:red}requirement{} each {C:blue}Hand{} played",
				},
			},
			m_thac_ecto = {
				name = "Ecto Card",
				text = {
					"Put {C:attention}#1# cop#2#{} of this",
					"card into {C:attention}your graveyard",
					"when played and scored",
				},
			},
			m_thac_party = {
				name = "Party Card",
				text = {
					"{C:white,X:purple}X#1#{} Score",
					"Convert a random card",
					"in hand into a {C:attention}Party Card",
					"and then remove {C:attention}this card{}'s",
					"enhancement after scoring",
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
					'gains {C:mult}+{C:white,X:mult}X0.3{} Mult while',
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
					'Chips and Mult from {C:attention}suit',
					'{C:attention}level{} increased by {C:white,X:attention}X3{}',
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
            card_mult = {
                text = {
                    "{C:mult}+#1#{} Mult"
                }
            },
            card_levelup = {
                text = {
                    "Level up {V:1}#1#{} when",
					"played and scoring",
                }
            },
            card_handsize = {
                text = {
                    "{C:attention}+#1#{} hand size until end",
					"of round when scored",
                }
            },
            card_sword = {
                text = {
                    "{C:white,X:mult}X#1#{} Mult for",
					"each {V:1}#3#{} level",
					"{C:inactive}(Currently: {C:white,X:mult}X#2#{C:inactive} Mult)"
                }
            },
            card_coin = {
                text = {
                    "Earn {C:money}$#1#{} when scored",
					"for each {V:1}#3#{} level",
					"{C:inactive}(Currently: {C:money}$#2#{C:inactive})"
                }
            },
            thac_jester_info = {
				name = "Jester Rank",
                text = {
                    "{C:mult}+4{} Mult"
                }
            },
            thac_wand_info = {
				name = "Wand Rank",
                text = {
                    "Level up this card's",
					"suit when played",
					"and scoring",
                }
            },
            thac_vessel_info = {
				name = "Vessel Rank",
                text = {
                    "{C:attention}+2{} hand size until end",
					"of round when scored",
                }
            },
            thac_sword_info = {
				name = "Sword Rank",
                text = {
                    "{C:white,X:mult}X0.25{} Mult for",
					"each suit level",
					"{C:inactive}(Starts at {C:white,X:mult}X1{C:inactive} Mult)"
                }
            },
            thac_coin_info = {
				name = "Coin Rank",
                text = {
                    "Earn {C:money}$1{} when scored",
					"for each suit level",
                }
            },
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
			p_thac_option_select = {
				name = "{V:1}Option {V:2}Select",
				text = {
					"Holds {V:1}#1#{} cards which",
					"you may choose {V:2}#2#{} to",
					"decide your {C:dark_edition}fate",
				},
			},
		},
		Blind = {
			bl_thac_fehu = {
				name = "Fehu",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_uruz = {
				name = "Uruz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_Þurisaz = {
				name = "Þurisaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_ansuz = {
				name = "Ansuz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_raido = {
				name = "Raido",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_kaunan = {
				name = "Kaunan",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_gyfu = {
				name = "Gyfu",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_wynn = {
				name = "Wynn",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_hagalaz = {
				name = "Hagalaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_naudiz = {
				name = "Naudiz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_isaz = {
				name = "Isaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_jera = {
				name = "Jera",
				text = {
					"1 in 4 chance to","copy played cards",
				},
			},
			bl_thac_eiwaz = {
				name = "Eiwaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_perthro = {
				name = "Perthro",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_algiz = {
				name = "Algiz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_sowilo = {
				name = "Sowilo",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_teiwaz = {
				name = "Teiwaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_berkanan = {
				name = "Berkanan",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_ehwaz = {
				name = "Ehwaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_mannaz = {
				name = "Mannaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_laguz = {
				name = "Laguz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_ingwaz = {
				name = "Ingwaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_dagaz = {
				name = "Dagaz",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_oÞala = {
				name = "OÞala",
				text = {
					"Work in Progress!",
				},
			},
			bl_thac_angels_wrath = {
				name = "Angel's Wrath",
				text = {
					localize('k_angel')
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
}