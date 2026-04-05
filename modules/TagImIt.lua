local tags = {
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
								local tag_ = Tag(tag, false, 'Small')
								if tag == "tag_orbital" then
									tag_.ability.orbital_hand = TheAutumnCircus.func.pseudorandom_unlocked_hand()
								end
								add_tag(tag_)
							end
							play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
							play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
							G.E_MANAGER:add_event(Event({
								func = (function()
									  for i = 1, #G.GAME.tags do
										G.GAME.tags[i]:apply_to_run({type = 'immediate'})
										G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'})
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