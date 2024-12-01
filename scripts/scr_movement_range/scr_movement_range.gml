// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_movement_range(origin_node,move_range,attack_range,selected_actor){ //pathfinding, get nodes for movements
	//selected_actor has been added later for scr_attack_range
	//Reset all node data
	//scr_wipe_nodes();
	
	var open, closed;//, closed; //node lists,
	var start_node, current_node, curr_neighbour; //holds instance ids, start_node node, current node
	var temp_G, range, cost_mod;
	
	//Declare relevant variables from arguments
	start_node = origin_node;
	range = move_range; //current number of nodes out we're going for
	
	//Create data structures
	open = ds_priority_create(); //list with a numerical priority attatched to each item, instance ids of nodes
	//puts in nodes with priority equal to its g score, and we grab the lowest until there's nothing left
	closed = ds_list_create();
	
	//add starting node to open list
	ds_priority_add(open,start_node,start_node.G); //lowest score, since it's origin
	
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
			if (ds_list_find_index(closed, curr_neighbour) < 0 and curr_neighbour.passable and 
			curr_neighbour.occupant == noone and curr_neighbour.cost + current_node.G <= range)
			{//only calculate new G for neighbour if it hasn't already been calculaated
				if (ds_priority_find_priority(open,curr_neighbour) == 0 or ds_priority_find_priority(open,curr_neighbour) == undefined) 
				{
					cost_mod = 1;
					
					//give neighbour the appropriate parent
					curr_neighbour.parent_node = current_node;
					 
					 //there would be diagonal movement code here changing ccost mod but i removed it
					 
					//calculate G score of neighbour, with cost_mod in place
					curr_neighbour.G = current_node.G + (curr_neighbour.cost * cost_mod);
					
					//add neighbour to open list so it can be checked out too
					ds_priority_add(open,curr_neighbour,curr_neighbour.G);
				}
				else //if neighbour's score has already been calculated for the open list
				{
					//figure out if the neighbour's score would be LOWER if found from the current node
					cost_mod = 1;
					
					//there would be diagonal movement code here changing ccost mod but i removed it
					
					temp_G = current_node.G + (curr_neighbour.cost + cost_mod);
					
					//check if G score would be lower 
					if (temp_G < curr_neighbour.G)
					{
						curr_neighbour.parent_node = current_node;
						curr_neighbour.G = temp_G;
						ds_priority_change_priority(open,curr_neighbour,curr_neighbour.G);
					}
					
				}
			}
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
	
	//Colour move nodes, then destroy the closed list as well
	for(ii = 0; ii < ds_list_size(closed);ii++)
	{
		current_node = ds_list_find_value(closed, ii);
		current_node.move_node = true;
		//current_node.attack_node = true;
		
		scr_colour_move_node(current_node,move_range);
		
		
		//attack shit
		//x_dist = distance_to_point(temp_actor.x,y) //would have measuring to the center but it dont
		//y_dist = distance_to_point(x,temp_actor.y)
		//total_dist = x_dist + y_dist;
		//if (total_dist <= temp_actor.attack_range + temp_actor){}
	}
	scr_attack_range2(closed,selected_actor);
	
	//DESTROY closed list!!!!!
	ds_list_destroy(closed);
	
}