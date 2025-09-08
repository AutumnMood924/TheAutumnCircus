local tags = {
	"gilded", gilded = {
		config = {type = "store_joker_modify"},
		pos = {x = 0, y = 2},
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
	},
	"chaos", chaos = {
		config = {type = "immediate"},
		pos = {x = 0, y = 0},
		discovered = false,
		apply = function(self, tag, context)
			--print("yo")
			if context.type == 'immediate' then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				tag:yep('+', G.C.PURPLE,function() 
					local tagpool = get_current_pool('Tag')
					local tagset = {}
					for i = 1, 3 do
						local tag = pseudorandom_element(tagpool, pseudoseed('chaos_tag'))
						while tag == 'UNAVAILABLE' or tag == 'tag_thac_chaos' do
							tag = pseudorandom_element(tagpool, pseudoseed('chaos_tag'))
						end
						tagset[i] = tag
					end
					G.E_MANAGER:add_event(Event({
						func = (function()
							for _, tag in pairs(tagset) do
								add_tag(Tag(tag, false, 'Small'))
							end
							play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
							play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
							G.E_MANAGER:add_event(Event({
								func = (function()
									  for i = 1, #G.GAME.tags do
										G.GAME.tags[i]:apply_to_run({type = 'immediate'})
									  end
									return true
								end)
							}))
							return true
						end)
					}))
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				tag.triggered = true
				return true
			end
		end,
		loc_vars = function() return {vars = {3}} end,
	},
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