/// @description 

switch(game_state)
{
	case "initialising":
		with (obj_node) //every node
		{
			if (instance_position(x+GRID_SIZE/2,y+GRID_SIZE/2,par_terrain))
			{
				tempTerrain = instance_position(x+GRID_SIZE/2,y+GRID_SIZE/2,par_terrain);
	
				switch(tempTerrain.terrain_type)
				{
					case "wall":
						terrain_type = "wall";
						sprite_index = spr_wall;
						passable = false;
			
						break;
					case "tree":
						terrain_type = "tree";
						sprite_index = spr_tree;
						cost = 2;
			
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
	game_state = ds_list_find_value(turn_order,0); //"player";
	instance_create_layer(mouse_x,mouse_y,"Instances", obj_cursor);
	break;
	

	case "neft_faction_turn": scr_state_player_turn1(); break;
	case "aleneti_faction_turn": break;//scr_state_ai_turn(); break;
}

if (keyboard_check_pressed(ord("R")))
{
	with (par_neft_faction)
	{
		pixel_dist = orig_pixel_dist;
		attacked = false;
		//unit_state = UNIT_STATE.READY;
		
	}
	//global.state = STATES.AI_TURN
	//if(instance_number(par_enemy > 0)) {global.state = STATES.AI_TURN;} //remove later
}