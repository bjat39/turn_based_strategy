// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_movement_range_ai1_closest(origin_node,move_range,attack_range){ //pathfinding, get nodes for movements
	//checking entire grid for the closest enemy actor
	//called by ai actor?
	///uses less efficient dijkstras :(
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
	
	//closest target used for if out of range of any enemies, pick closest
	//closest_target = noone;
	move_target = noone;
	attack_target = noone; //update move if searching and found a person lower g score, attack target at end, look at find_target (move target and attack target)
	end_path = noone;
	
	var enemy_list_move = ds_list_create();
	
	with(par_actor)
	{
		if (faction != other.faction)
		{
			ds_list_add(enemy_list_move,par_actor); //add all enemies to Santa's wish list of death
		}
	}
	
	var found_enemy = false;
	//move_and_attack_list = ds_list_create();
	
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
			 
			 //gotten rid of range limit, maybe that'll check the whole map for units?
			 //Check entire grid. could use a* to find a proper move node, but i'm tired
			 //doesn't take into account units, which could lead to bugs with many units on field?
			if (ds_list_find_index(closed, curr_neighbour) < 0)
			{//if passable or occupied
				if ((curr_neighbour.passable and curr_neighbour.occupant == noone)
					or (curr_neighbour.occupant != noone and curr_neighbour.occupant.faction != faction))
				//curr_neighbour.occupant == noone)// and curr_neighbour.cost + current_node.G <= range)
				{//only calculate new G for neighbour if it hasn't already been calculaated
					if (ds_priority_find_priority(open,curr_neighbour) == 0 or ds_priority_find_priority(open,curr_neighbour) == undefined) 
					{
						if (curr_neighbour.occupant != noone and curr_neighbour.occupant.faction != faction)
						{
							found_enemy = true;} //check if we've pathed to an enemy successfully
						
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
	}
	
	
	
	//put this checking each actor
	
	//setting move target to closest enemy
	if (found_enemy) //set move node to enemy
	{
		for(ii = 0; ii < ds_list_size(enemy_list_move); ii ++)
		{
			var curr_enemy = ds_list_find_value(enemy_list_move, ii); //current node
			//checking the closest actor and the closest move node to them
			{ //if there is any enemy on the map, we need to know, in order to find the closest enemy to move to
			//add total dist, found_path
				if (move_target == noone)// and map[other.move_target.gridX,other.move_target.gridY].G != 0) //checking we can path
				{//if can't path to enemy, choose the closest node not by g but by pixel distance
					//attack_target = curr_neighbour.occupant;
					move_target = map[curr_enemy.gridX,curr_enemy.gridY];
					end_path = noone;
				}//if node is closer
				//could do dijkstra's algorithm and check g scores for more accurate distance check, because out of range nodes don't get checked
				else if (found_enemy and (map[gridX,gridY].G < map[other.move_target.gridX,other.move_target.gridY].G)) 
				{
					//attack_target = curr_neighbour.occupant;
					move_target = map[curr_enemy.gridX,curr_enemy.gridY];//id
					end_path = noone;
					//closest_target = curr_neighbour;
				}
			}
		}
	}
	else //can't path to enemy? find the closest move node to an enemy that we can path to
	{
		min_dist = 10000000000;
		for(ii = 0; ii < ds_list_size(closed); ii ++)
		{
			var c_node = ds_list_find_value(closed, ii) //current node
			//checking the closest actor and the closest move node to them
			{
				for(jj = 0; jj < ds_list_size(enemy_list_move); jj ++)
				{
					var curr_enemy = ds_list_find_value(enemy_list_move, jj);
					x_dist = point_distance(curr_enemy.x, curr_enemy.y, c_node.x, curr_enemy.y);
					y_dist = point_distance(curr_enemy.x, curr_enemy.y, curr_enemy.x, c_node.y);
					total_dist = x_dist + y_dist;
					if (total_dist < min_dist)//temp_actor.attack_range)
					{
						min_dist = total_dist;
						move_target = c_node;
					}								
				}
			}
		}
	}

	
	
	
	
	if(move_target != noone)
	{
		obj_closest_node.x = move_target.x;
		obj_closest_node.y = move_target.y;
	}
	
	
	//round down all G scores for movement calculations, used for diagonals but ig its important
	//with(oNode)
	//{
	//	G = floor(G);
	//}
	
	ds_list_destroy(enemy_list_move);
	
	//Destroy open list
	ds_priority_destroy(open); //destroy so it doesn't create a new open list each time, memory leak. handle data structures properly
	
	//scr_attack_range1();
	
	//Colour move nodes, then destroy the closed list as well
	
	//return closed;
	//DESTROY closed list!!!!!
	ds_list_destroy(closed);
	
}