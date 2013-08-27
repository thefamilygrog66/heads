-- if you add new heads, you should change headnumber value accordingly

headnumber = 13

-- register head nodes

for i = 1, headnumber do

	local x = i + 1
	if x > headnumber then x = 1 end

	minetest.register_node("heads:head_"..i, {
	    description = "Head Number "..i,
	    drawtype = "nodebox",
	    tiles = {
	        "heads_"..i.."_top.png",
	        "heads_"..i.."_bottom.png",
	        "heads_"..i.."_left.png",
	        "heads_"..i.."_right.png",
	        "heads_"..i.."_back.png",
	        "heads_"..i.."_face.png",
	    },	    
	    paramtype = "light",
	    paramtype2 = "facedir",
	    node_box = {
	        type = "fixed",
	        fixed = {       
	            { -0.25, -0.5, -0.25, 0.25, 0.0, 0.25, },   			
	        },
	    },
	    sunlight_propagates = true,
	    walkable = true,
	    selection_box = {
	        type = "fixed",
	        fixed = { -0.25, -0.5, -0.25, 0.25, 0.0, 0.25, },
	    },
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	    drop = "heads:head_"..i,
	    on_rightclick = function(pos, node, clicker)
	        node.name = "heads:head_"..x
	        minetest.env:set_node(pos, node)
	    end,
	})
	
end

-- register head craft

minetest.register_craft({
	output = "heads:head_1",
	recipe = {
		{"bones:bones"}
	}
})
