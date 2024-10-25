// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_range(current_actor){ //pass id of selected actor
	with(par_actor)
	{
		temp_actor = current_actor;
		
		if (faction != temp_actor.faction)
		{
			//cardinal direction vector
			//x_dist = distance_to_point(temp_actor.x,y) //would have measuring to the center but it dont
			//y_dist = distance_to_point(x,temp_actor.y)
			x_dist = point_distance(x, y,temp_actor.x, y) //would have measuring to the center but it dont
			y_dist = point_distance(x, y, x,temp_actor.y)
			total_dist = x_dist + y_dist;
			if (total_dist <= temp_actor.attack_range)
			{
				map[gridX,gridY].attack_node = true;
				map[gridX,gridY].colour = c_red;
				//instance_create_layer(x,y,"Instances",obj_attack_square);
			}
		}
	}
}

//need to get all move nodes
//looop through move nodes and colour attack nodes in range
			//var path_length = path_get_length(global.navigate)
			//var total_dist = global.selected.attack_pixel_dist + global.selected.pixel_dist;
			//if (path_length <= total_dist and !(path_length <= global.selected.pixel_dist)) 
			//{
			//	instance_create_layer(i_x,row,"Instances",obj_attack_square1);
			//}