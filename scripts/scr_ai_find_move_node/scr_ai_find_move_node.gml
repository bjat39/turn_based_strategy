// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_find_move_node(){ //basic a* algorithm
	enemy_list_move = ds_priority_create(); //priority of how far they are away from us, first choose the closest (use damage for attacking enemy, second max movement to a seperate point for no enemies)
	
	with(par_actor)
	{
		if (faction != other.faction)
		{
			
			x_dist = point_distance(x, y, other.x, y); //would have measuring to the center but it dont
			y_dist = point_distance(x, y, x,other.y);
			total_dist = x_dist + y_dist; //heuristic
			ds_priority_add(other.enemy_list_move,id,total_dist);
		}
	}
	
	closest_node = noone;
	
	while (closest_node == noone){
		target_unit = ds_priority_delete_min(enemy_list_move);
		
		target_node = map[target_unit.gridX,target_unit.gridY];
		
		//look for a free node, somewhere we can stand around the enemy
		for (ii = 0; ii < ds_list_size(target_node.neighbours); ii ++))
		{
			current_node = ds_list_find_value(target_node.neighbours,ii);
			if (current_node.occupant == noone and current_node == passable){
				closest_node = current_node;
			}
		}
		
		if (ds_priority_size(enemy_list_move) <= 0)
		{
			
		}
	}
}