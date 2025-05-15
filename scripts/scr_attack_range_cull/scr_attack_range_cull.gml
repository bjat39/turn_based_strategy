// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_range_cull(origin_node,move_range,attack_range,selected_actor,move_list){ //pathfinding, get nodes for movements
	//ATTACK one
	//selected_actor has been added later for scr_attack_range
	//Reset all node data
	//scr_wipe_nodes();
	
	var open, closed;//, closed; //node lists,
	var start_node, current_node, curr_neighbour, current_move_node; //holds instance ids, start_node node, current node
	var temp_G, range, full_attack_range, cost_mod;
	
	//Declare relevant variables from arguments
	start_node = origin_node;
	range = move_range; //current number of nodes out we're going for
	full_attack_range = range + attack_range;
	
	//Create data structures
	open = ds_priority_create(); //list with a numerical priority attatched to each item, instance ids of nodes
	//puts in nodes with priority equal to its g score, and we grab the lowest until there's nothing left
	closed = ds_list_create();
	
	var attack_closed = ds_list_create();
	
	//add starting node to open list
	ds_priority_add(open,start_node,start_node.attack_G); //lowest score, since it's origin
	
	//while open queue is not empty, repeat the following until all nodes have been looked at
	while(ds_priority_size(open) > 0){
		//remove node with lowest g score from open
		current_node = ds_priority_delete_min(open); //remove from open, put in current
		//add node to closed list so we don't look at it again
		ds_list_add(closed,current_node);
			
		//step through all of current's neighbours
		for(ii = 0; ii < ds_list_size(current_node.neighbours); ii ++)
		{
			//store current neighbour in neighbour variable
			curr_neighbour = ds_list_find_value(current_node.neighbours, ii)
			
			//add neighbour to open list if qualifies:
			//neighbour is passable
			//neighbour has no occupant
			//neighbour's projected g score is less than movement range
			//neighbour isn't already on the closed list (culls many nodes)
			
			 //if neighbour isn't on closed list, return -1
			if (ds_list_find_index(closed, curr_neighbour) < 0 and 1 + current_node.attack_G <= full_attack_range)
			{//only calculate new G for neighbour if it hasn't already been calculaated
				if (ds_priority_find_priority(open,curr_neighbour) == 0 or ds_priority_find_priority(open,curr_neighbour) == undefined) 
				{
					curr_neighbour.attack_node = true;
					//give neighbour the appropriate parent
					curr_neighbour.attack_parent_node = current_node;
					 
					//calculate G score of neighbour, with cost_mod in place
					curr_neighbour.attack_G = current_node.attack_G + 1;
					
					//curr_neighbour.attack_node = true;
					
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
						curr_neighbour.attack_node = true;
						curr_neighbour.attack_parent_node = current_node;
						curr_neighbour.attack_G = temp_G;
						//curr_neighbour.attack_node = true;
						ds_priority_change_priority(open,curr_neighbour,curr_neighbour.attack_G);
					}
					
				}
			} //attack node range
		}
	}
	
	//round down all G scores for movement calculations, used for diagonals but ig its important
	//with(oNode)
	//{
	//	G = floor(G);
	//}
	
	//Destroy open list
	ds_priority_destroy(open); //destroy so it doesn't create a new open list each time, memory leak. handle data structures properly
	
	//scr_attack_range1();
	
	////Colour move nodes, then destroy the closed list as well
	//pare through attack nodes
	var attack_list_size = ds_list_size(closed);
	
	for(ii = 0; ii < attack_list_size;ii++)
	{
		current_node = ds_list_find_value(closed, ii);
		//	if (current_node.gridX == 6 and current_node.gridY == 18){
		//pusdy=3}
		if (current_node == undefined){
			pussy = 5;
		}

		if (current_node.move_node == true)
		{
			current_node.attack_node = false;
			//ds_list_delete(closed,ds_list_find_index(closed,current_node))
		}
		else
		{
			for(jj = 0; jj < ds_list_size(move_list);jj++)
			{	
				current_move_node = ds_list_find_value(move_list, jj);
				

				//if ((current_node.gridX - current_move_node.gridX) 
				//+ (current_node.gridY - current_move_node.gridY) <= attack_range)
				x_dist = point_distance(
				current_node.x, current_node.y, current_move_node.x, current_node.y); //would have measuring to the center but it dont
				y_dist = point_distance(
				current_node.x, current_node.y, current_node.x,current_move_node.y);
				total_dist = x_dist + y_dist; //
				if (total_dist <= selected_actor.attack_range)
				{
					current_node.attack_node = true;
					break;
				}
				if(jj >= ds_list_size(move_list) - 1) //reached the end, remove it
				{
					current_node.attack_node = false;
					//ds_list_delete(closed,ds_list_find_index(closed,current_node))
				}
			}
		}
		
		//attack shit
		//x_dist = distance_to_point(temp_actor.x,y) //would have measuring to the center but it dont
		//y_dist = distance_to_point(x,temp_actor.y)
		//total_dist = x_dist + y_dist;
		//if (total_dist <= temp_actor.attack_range + temp_actor){}
	}
	for(ii = 0; ii < ds_list_size(closed);ii++)
	{
		current_node = ds_list_find_value(closed, ii);
		if (current_node.attack_node == true){
		scr_colour_attack_node(current_node);}
	}
	//we got the attack nodes, ok get the move nodes
	
	//should put it in previous for loop somewhere, just check each square and mark as attack square
	//scr_large_grid_attack_range(closed,selected_actor);
	
	//DESTROY closed list!!!!!
	ds_list_destroy(closed);
	
}