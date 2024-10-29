// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_command_init(){
	//figure out how many availalbe actions there are
	//called by par_actor
	//var selected_actor = selected_actor;
	
	with(par_actor)
	{
		x_dist = point_distance(x, y, other.x, y); //would have measuring to the center but it dont
		y_dist = point_distance(x, y, x, other.y);
		total_dist = x_dist + y_dist; //
		if (occupant != noone and total_dist <= other.attack_range)//temp_actor.attack_range)
		{
			if (occupant.faction != other.faction)
			{
				map[gridX,gridY].attack_node = true;
				if (ds_list_find_index(other.command_list,"Attack") != -1)
				{
					ds_list_add(other.command_list, "Wait");
				}
				//selected_actor.attack_node = true;
				//scr_colour_attack_node(id);
			}
		}
	}
	
	//obj_game.selected_actor

	ds_list_add(other.command_list, "Wait");
}