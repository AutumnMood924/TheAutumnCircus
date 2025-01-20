local tags = {
	"gilded", gilded = {
		name = "Gilded Tag",
		config = {type = "store_joker_modify"},
		pos = {x = 0, y = 0},
		text = {
			"makes a gilded joker in shop",
			"todo: care about this description"
		},
		discovered = false,
		apply = function(self, tag, context)
			--print("yo")
			if context.type == 'store_joker_modify' then
				local _applied = nil
				if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
					local lock = tag.ID
					G.CONTROLLER.locks[lock] = true
					context.card.temp_edition = true
					tag:yep('+', G.C.DARK_EDITION,function() 
						context.card:set_edition({thac_gilded = true}, true)
						context.card.ability.couponed = true
						context.card:set_cost()
						context.card.temp_edition = nil
						G.CONTROLLER.locks[lock] = nil
						return true
					end)
					_applied = true
					tag.triggered = true
				end
				return applied
			end
		end,
		loc_vars = function() return {vars = {}} end,
	}
}

SMODS.Atlas{
	key = "TagImIt",
	path = "TagImIt.png",
	px = 34,
	py = 34,
}

--tags
for _, k in ipairs(tags) do
	local v = tags[k]
	TheAutumnCircus.data.buffer_insert("Tags", v, {key = k, atlas = "TagImIt"})
end