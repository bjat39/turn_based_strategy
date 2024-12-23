// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_movement(start_node,goal_node){
	//A* algo
	//not very good a star
	//arg0 = start node
	//arg1 = goal node
	
	with (par_node)
	{
		parent_node = noone;
		G = 0;
	}
	
	open = ds_priority_create();
	closed = ds_list_create(); //closed is the nodes we've already checked
	
	ds_priority_add(open, start_node, 0); //first node
	
	ds_list_add(closed,start_node);
	
	while(ds_priority_size(open) > 0)
	{
		current_node = ds_priority_delete_min(open); //lowest to highest priority
		
		if (current_node == goal_node){break;}
		
		for (ii = 0; ii < ds_list_size(current_node.neighbours);ii++)//go through all neighbours
		{
			neighbour = ds_list_find_value(current_node.neighbours,ii);
			
			if (neighbour.occupant == noone and neighbour.passable)
			{
				cost_mod = 1;
				//diagonal check
				//if (neighbour.x != current_node.x and neighbour.y != current.y){}
				temp_cost = neighbour.cost; //* cost_mod;
				temp_cost += current_node.G;
				
				//if not already on the closed list, or etc etc
				if (ds_list_find_index(closed,neighbour) < 0 || temp_cost < neighbour.G){
					neighbour.G = temp_cost; //additive G score
					//predict that shit
					priority = temp_cost + scr_heuristic(goal_node,neighbour); //f score
					
					ds_priority_add(open,neighbour,priority); //explore in that direction
					
					neighbour.parent_node = current_node;
					ds_list_add(closed,neighbour);
				}
			}
		}
	}
	
	while (ds_priority_size(open) > 0)//if we break out bc of goal, we keep going anyway to finish calculating everything else
	{//giving everything a once over, no longer expanding open list
		current_node = ds_priority_delete_min(open);
		
		for(ii = 0;ii < ds_list_size(current_node.neighbours);ii++)
		{
			neighbour = ds_list_find_value(current_node.neighbours,ii);
			
			if (neighbour.occupant == noone and neighbour.passable){
				temp_cost = neighbour.cost; // * cost_mod;
				temp_cost  += current_node.G;
				
				if(ds_list_find_index(closed,neighbour) < 0 || temp_cost < neighbour.G) //returns -1 if it can't find neighbour on list
				{
					neighbour.G = temp_cost;
					
					neighbour.parent_node = current_node;
					
					ds_list_add(closed, neighbour);
				}
			}
		}
	}
}