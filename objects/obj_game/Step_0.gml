/// @description 

switch(state)
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
	state = "ready";
	instance_create_layer(mouse_x,mouse_y,"Instances", obj_cursor);
	break;
}