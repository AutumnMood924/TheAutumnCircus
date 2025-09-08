local quips = {
    loss = {
        "j_thac_knight_of_heart", j_thac_knight_of_heart = {
            {
				"hah, nice try",
			},
			{
				"maybe next time",
				"maybe never",
			},
			{
				"was that your best shot?",
			},
			{
				"play again",
			},
			{
				"wow. well done.",
			},
			{
				"thanks for painting",
				"the screen red",
			},
        },
		"j_thac_witch_of_mind", j_thac_witch_of_mind = {
			{
				"lolll :333",
			},
			{
				"oh no3s!!!",
			},
			{
				"h3h3h3 gu3ss you gotta",
				"try again :3!!!",
			},
			{
				"dammit i was b3tting",
				"on you, dumbass",
			},
		},
		"j_thac_lord_of_void", j_thac_lord_of_void = {
			{
				"Looks like I have nothing",
				"to be worried about!",
			},
			{
				"All things come to an end.",
				"Eventually.",
			},
			{
				"Oh, how sad.",
			},
			{
				"Were you trying?",
			},
			{
				"Did you miss something?",
			},
			{
				"Guess that's that.",
			},
		},
    },
    win = {
        "j_thac_knight_of_heart", j_thac_knight_of_heart = {
            {
				"interesting...",
			},
            {
				"a good run.",
				"will you continue?",
			},
			{
				"proceed.",
			},
        },
		"j_thac_witch_of_mind", j_thac_witch_of_mind = {
			{
				"oooooooooooo you did it!!!",
			},
			{
				"wowi3!!!",
				"you winn3r3d!!!",
			},
			{
				"proc33d :3",
			},
		},
		"j_thac_lord_of_void", j_thac_lord_of_void = {
			{
				"Impressive.",
			},
			{
				"Interesting.",
			},
			{
				"Fascinating.",
			},
			{
				"Proceed.",
			},
			{
				"Continue. You are",
				"doing quite well.",
			},
			{
				"Are you done?",
				"Or...?",
			},
		},
    }

}

local autumnquipweight = 100

local particles = {
	j_thac_knight_of_heart = {
		G.ARGS.LOC_COLOURS['knightofheart'],
		G.ARGS.LOC_COLOURS['autumn'],
		G.ARGS.LOC_COLOURS['thac_friend1'],
	},
	j_thac_witch_of_mind = {
		G.ARGS.LOC_COLOURS['witchofmind'],
		G.ARGS.LOC_COLOURS['autumn'],
		G.ARGS.LOC_COLOURS['thac_friend2'],
	},
	j_thac_lord_of_void = {
		G.ARGS.LOC_COLOURS['lordofvoid'],
		G.ARGS.LOC_COLOURS['thac_friend1'],
		G.ARGS.LOC_COLOURS['thac_friend2'],
	},
}

local i = 0
for _, joker in ipairs(quips.loss) do
	local list = quips.loss[joker]
    for _, quip in ipairs(list) do
        i = i + 1
        SMODS.JimboQuip {
            type = "loss",
            key = "lq_thac_"..i,
            extra = { center = joker, particle_colours = particles[joker]},
            loc_txt = quip,
			filter = function(self, type)
				return true, { weight = autumnquipweight } 
			end,
        }
    end
end

i = 0
for _, joker in ipairs(quips.win) do
	local list = quips.win[joker]
    for _, quip in ipairs(list) do
        i = i + 1
        SMODS.JimboQuip {
            type = "win",
            key = "wq_thac_"..i,
            extra = { center = joker, particle_colours = particles[joker]},
            loc_txt = quip,
			filter = function(self, type)
				return true, { weight = autumnquipweight } 
			end,
        }
    end
end