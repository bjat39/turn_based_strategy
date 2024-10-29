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
					sprite_index = spr_wall;
					passable = false;
			
					break;
				case "tree":
					instance_change(obj_tree,true); //change to tree, retains information from previous
					terrain_type = "tree";
					sprite_index = spr_tree;
					cost = 2;
					terrain_avoid = 40; //trees work more like ranged cover than in fire emblem
					terrain_defense = 2;
			
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
	
	//instance_create_layer(mouse_x,mouse_y,"Instances", obj_cursor);

	gridX = floor(obj_cursor.x/GRID_SIZE); //where cursor is in relation to grid
	gridY = floor(obj_cursor.y/GRID_SIZE);
}