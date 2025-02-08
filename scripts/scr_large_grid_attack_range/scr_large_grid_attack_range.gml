// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_large_grid_attack_range(move_list, selected_actor){
//function scr_movement_range(origin_node,move_range,attack_range,selected_actor){ //pathfinding, get nodes for movements
	//selected_actor has been added later for scr_attack_range
	//Reset all node data
	//scr_wipe_nodes();
	
	var open, closed;//, closed list for attack nodes; //node lists,
	var start_node, current_node, curr_neighbour; //holds instance ids, start_node node, current node
	
	var temp_G, range;
	
	//Declare relevant variables from arguments
	start_node = selected_actor.current_node;
	range = selected_actor.attack_range_real; //current number of nodes out we're going for
	
	var curr_move_node = start_node;
	
	//Create data structures
	open = ds_priority_create(); //list with a numerical priority attatched to each item, instance ids of nodes
	//puts in nodes with priority equal to its g score, and we grab the lowest until there's nothing left
	closed = ds_list_create();
	
	for (jj = 0; jj < ds_list_size(move_list);jj++)
	{
		curr_move_node = ds_list_find_value(move_list, jj);
		
		//add starting node to open list
		ds_priority_add(open,curr_move_node,curr_move_node.attack_G); //lowest score, since it's origin
		
		//while open queue is not empty, repeat the following until all nodes have been looked at
		while(ds_priority_size(open) > 0){
			//remove node with lowest g score from open
			current_node = ds_priority_delete_min(open); //remove from open, put in current
		
			//add node to closed list so we don't look at it again
			if (current_node != curr_move_node)
			{ds_list_add(closed,current_node);}
		
			//step through all of current's neighbours
			for(ii = 0; ii < ds_list_size(current_node.neighbours); ii ++)
			{
				//store current neighbour in neighbour variable
				curr_neighbour = ds_list_find_value(current_node.neighbours, ii)
		
				//add neighbour to open list if qualifies:
				//neighbour's projected g score is less than movement range
				//neighbour isn't already on the closed list (culls many nodes)
				//neighbour isn't on list of move squares
			
				//attack cost?
				 //if neighbour isn't on closed list, return -1
				if //(ds_list_find_index(closed, curr_neighbour) < 0 and ds_list_find_index(move_list, curr_neighbour) < 0
				( current_node.attack_G + 1 <= range)
				{//only calculate new G for neighbour if it hasn't already been calculaated
					if (ds_priority_find_priority(open,curr_neighbour) == 0 or ds_priority_find_priority(open,curr_neighbour) == undefined) 
					{
						//give neighbour the appropriate parent
						curr_neighbour.attack_parent_node = current_node;
					 
						 //there would be diagonal movement code here changing ccost mod but i removed it
					 
						//calculate attack g, 1 for each space
						curr_neighbour.attack_G = current_node.attack_G + 1;
						
						//add neighbour to open list so it can be checked out too
						ds_priority_add(open,curr_neighbour,curr_neighbour.attack_G);
					}
					else //if neighbour's score has already been calculated for the open list
					{
						//figure out if the neighbour's score would be LOWER if found from the current node
						
						temp_G = current_node.attack_G + 1;
					
						//check if G score would be lower 
						if (temp_G < curr_neighbour.attack_G)
						{
							curr_neighbour.attack_parent_node = current_node;
							curr_neighbour.attack_G = temp_G;
							ds_priority_change_priority(open,curr_neighbour,curr_neighbour.attack_G);
						} 
					}
				}
			}
		}
	}
	
	//Destroy open list
	ds_priority_destroy(open); //destroy so it doesn't create a new open list each time, memory leak. handle data structures properly
	
	//scr_attack_range1();
	
	//Colour ATTACK nodes, then destroy the closed list as well
	for(ii = 0; ii < ds_list_size(closed);ii++)
	{
		current_node = ds_list_find_value(closed, ii);

		scr_colour_attack_node(current_node);
	}
	
	//search entire grid again, not very efficient but I'M FUCKING STUPID DOK
	//should put it in previous for loop somewhere, just check each square and mark as attack square
	//scr_attack_range2(closed,selected_actor);
	
	//DESTROY closed list!!!!!
	ds_list_destroy(closed);
}
//function scr_attack_range(current_actor){ //pass id of selected actor
//	with(par_actor)
//	{
//		temp_actor = current_actor;
		
//		if (faction != temp_actor.faction)
//		{
//			//cardinal direction vector
//			//x_dist = distance_to_point(temp_actor.x,y) //would have measuring to the center but it dont
//			//y_dist = distance_to_point(x,temp_actor.y)
//			x_dist = point_distance(x, y,temp_actor.x, y) //would have measuring to the center but it dont
//			y_dist = point_distance(x, y, x,temp_actor.y)
//			total_dist = x_dist + y_dist;
//			if (total_dist <= temp_actor.attack_range)
//			{
//				map[gridX,gridY].attack_node = true;
//				map[gridX,gridY].colour = c_red;
//				//instance_create_layer(x,y,"Instances",obj_attack_square);
//			}
//		}
//	}
//