// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_find_move_node(){ //basic a* algorithm
	//find move node
	enemy_list_move = ds_priority_create(); //priority of how far they are away from us, first choose the closest (use damage for attacking enemy, second max movement to a seperate point for no enemies)
	
	with(par_actor)
	{
		if (faction != other.faction) //getting heuristic to sort priority list... or are we? don't we need abs()?
		{
			
			x_dist = point_distance(x, y, other.x, y); //would have measuring to the center but it dont
			y_dist = point_distance(x, y, x,other.y);
			total_dist = x_dist + y_dist; //get heuristic
			ds_priority_add(other.enemy_list_move,id,total_dist);
		}
	}
	
	closest_node = noone;
	
	while (closest_node == noone){
		target_unit = ds_priority_delete_min(enemy_list_move); // target enemy
		
		target_node = map[target_unit.gridX,target_unit.gridY]; //V IMPORTANT!
		
		//look for a free node, somewhere we can stand around the enemy
		for (ii = 0; ii < ds_list_size(target_node.neighbours); ii ++)
		{
			current_node = ds_list_find_value(target_node.neighbours,ii);
			if (current_node.occupant == noone and current_node.passable){
				closest_node = current_node;
			}
		}
		
		if (ds_priority_size(enemy_list_move) <= 0) //if all enemy units surrounded
		{
			target_unit = noone;
			unit_state = "idle";
			break;
		}
	}
	
	ds_priority_destroy(enemy_list_move);
	
	if (target_unit != noone) //move as close as possible to targeet
	{
		target_node = closest_node;
		
		//figure out how to get there, a*
		scr_ai_movement(map[gridX,gridY],closest_node); //similar to movement range, bastardised a*
	
		while(closest_node.G > move) //need to move as far as possible, within move range
		{
			closest_node = closest_node.parent_node;
		}
		
		scr_create_path(id,closest_node);
		
		map[gridX,gridY].occupant = noone; //nobody there anymore
		
		gridX = closest_node.gridX;
		gridY = closest_node.gridY;
		
		closest_node.occupant = id;
		
		unit_state = "begin_path";
		
		//if (closest_node.G > move)
		//{
		//	actions -= 2
		//}
		//else
		//{
			
		//}
	}
}