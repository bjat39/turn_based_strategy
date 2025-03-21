// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_initialize_grid(){
	with (par_node) //every node
	{
		if (instance_position(x+GRID_SIZE/2,y+GRID_SIZE/2,par_terrain))
		{
			tempTerrain = instance_position(x+GRID_SIZE/2,y+GRID_SIZE/2,par_terrain);
	
			switch(tempTerrain.terrain_type)
			{
				case "wall":
					instance_change(obj_wall1,true); //change to tree, retains information from previous
					terrain_type = "wall";
					sprite_index = spr_wall_1;
					passable = false;
			
					break;
				case "tree":
					instance_change(obj_tree,true); //change to tree, retains information from previous
					terrain_type = "tree";
					sprite_index = spr_tree_1;
					cost = 2;
					terrain_avoid = 20; 
					terrain_defense = 2;
			
					break;
				case "chest":
					instance_change(obj_chest,true); //change to tree, retains information from previous
					terrain_type = "chest";
					sprite_index = chest1;
					passable = false;
			
					break;
			}
	
			with(tempTerrain)
			{
				instance_destroy();
			}
		}
			
		if (instance_position(x+GRID_SIZE/2,y+GRID_SIZE/2,par_actor)) //if we detect an actor at that position
		{
			occupant = instance_position(x+GRID_SIZE/2,y+GRID_SIZE/2,par_actor); //store instance in occupant
			occupant.gridX = gridX; 
			occupant.gridY = gridY;
		}
	}
	
	if (instance_exists(par_neft_faction)) //doesn't fucking work yet because obj_neft doesn't exist or some shit so we repeat this code later
	{
		if (instance_exists(obj_neft))
		{
			ds_list_add(other.neft_list,obj_neft);
		}
		with(par_neft_faction)
		{
			if (object_index != obj_neft)
			{
				ds_list_add(other.neft_list,id);
			}
		}
	}
	if (instance_exists(par_aleneti_faction))
	{
		with(par_aleneti_faction)
		{
			ds_list_add(other.aleneti_list,id)
		}
	}
	if (instance_exists(par_strucia_faction))
	{
		with(par_strucia_faction)
		{
			ds_list_add(other.strucia_list,id)
		}
	}
	if (instance_exists(par_ally_faction))
	{
		with(par_ally_faction)
		{
			ds_list_add(other.ally_list,id)
		}
	}
	
	game_state = ds_list_find_value(round_order,0); //"player";
	
	//instance_create_layer(mouse_x,mouse_y,"Instances", obj_cursor);

	gridX = floor(obj_cursor.x/GRID_SIZE); //where cursor is in relation to grid
	gridY = floor(obj_cursor.y/GRID_SIZE);
}