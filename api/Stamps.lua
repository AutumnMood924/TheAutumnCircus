
G.C.SECONDARY_SET.Stamps = HEX("FFB43D")

SMODS.Stamps = {}
SMODS.Stamp = SMODS.GameObject:extend {
    obj_table = SMODS.Stamps,
    obj_buffer = {},
    rng_buffer = {  },
    reverse_lookup = {},
    --prefix = "stamp",
    set = 'Stamp',
    atlas = 'JokerStamps',
    discovered = false,
    colour = HEX('FFFFFF'),
    required_params = {
        'key',
        'pos',
        'loc_txt'
    },
    inject = function(self)
        G.P_CENTER_POOLS[self.set] = G.P_CENTER_POOLS[self.set] or {}
        
		--print(self.key)
        G.P_SEALS[self.key] = self
        G.shared_seals[self.key] = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS[self.atlas] or G.ASSET_ATLAS['centers'], self.pos)
        self.reverse_lookup[self.key:lower()..'_stamp'] = self.key
        SMODS.insert_pool(G.P_CENTER_POOLS[self.set], self)
        self.rng_buffer[#self.rng_buffer + 1] = self.key
    end,
    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.descriptions.Other, self.key:lower() .. '_stamp', self.loc_txt,
            'description')
        SMODS.process_loc_text(G.localization.misc.labels, self.key:lower() .. '_stamp', self.loc_txt, 'label')
    end,
    get_obj = function(self, key) return G.P_SEALS[key] end
}



G.FUNCS.your_collection_stamps = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu{
      definition = create_UIBox_your_collection_stamps(),
    }
end

function create_UIBox_your_collection_stamps(exit)
    local deck_tables = {}
  
    local size = G.P_CENTER_POOLS['Stamp'] and #G.P_CENTER_POOLS['Stamp'] or 1

    G.your_collection = CardArea(
        G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
        5.3*G.CARD_W,
        1.03*G.CARD_H,
        {card_limit = size, type = 'title', highlight_limit = 0})
      table.insert(deck_tables, 
      {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
        {n=G.UIT.O, config={object = G.your_collection}}
      }}
      )
  
    for k, v in ipairs(G.P_CENTER_POOLS['Stamp']) do
      local center = G.P_CENTERS.j_joker
      --sendDebugMessage(inspect(SMODS.Stamps))
      local card = Card(G.your_collection.T.x + G.your_collection.T.w/2, G.your_collection.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
      card:set_seal(v.key, true)
      G.your_collection:emplace(card)
    end
    
    local t = create_UIBox_generic_options({ infotip = localize('ml_stamp_explanation'), back_func = exit or 'your_collection', snap_back = true, contents = {
              {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
            }})
    return t
end