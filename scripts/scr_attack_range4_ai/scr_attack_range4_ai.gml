// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_range4_ai(closed, selected_actor){ //selected actor is initiator
	//Preliminary attack range, while moving
	
	//for (xx = 0; xx < map_width; xx += 1) //does the x column first
	//{
	//	for (yy = 0; yy < map_height; yy += 1)
	//	{
	//		while ()
	//		for(ii = 0; ii < ds_list_size(closed);ii++)
	//		{
	//		var path_length = path_get_length(global.navigate)
	//		var total_dist = global.selected.attack_pixel_dist + global.selected.pixel_dist;
	//		if (path_length <= total_dist and !(path_length <= global.selected.pixel_dist)) 
	//		{
	//		map[xx,yy] = instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE, "Nodes", par_node);
	//		map[xx,yy].gridX = xx; //lets the nodes know where they are in the grid
	//		map[xx,yy].gridY = yy;
	//	}
	//}
	with(par_actor) //reciever
	{
		if (faction != other.faction)
		{
			for(ii = 0; ii < ds_list_size(closed);ii++) //list of movement squares
			{
				curr_node = ds_list_find_value(closed,ii);
				x_dist = point_distance(x, y, curr_node.x, y); //would have measuring to the center but it dont
				y_dist = point_distance(x, y, x,curr_node.y);
				total_dist = x_dist + y_dist; //
				if (move_node == false and total_dist <= selected_actor.attack_range){
					ds_priority_add(enemy_list,curr_node,0);
					break;
				}
			}
		}
	}
	
	//if(selected_actor.damage_type == "bow") //BOWMAN CAN'T SHOOT TWO SPACES BEFORE HIM
	//{
	//	with(par_node)
	//	{
	//		//if (id.move_node == true)
	//		//{
	//		//	faux_attack_node = true;
	//		//}
	//		curr_node = ds_list_find_value(closed,ii);
	//		x_dist = point_distance(x, y, selected_actor.x, y); //would have measuring to the center but it dont
	//		y_dist = point_distance(x, y, x, selected_actor.y);
	//		total_dist = x_dist + y_dist; //
	//		if (occupant != noone and total_dist <= selected_actor.attack_range and total_dist > 2 * GRID_SIZE)//temp_actor.attack_range)
	//		{
	//			if (occupant.faction != selected_actor.faction)
	//			{
	//				map[gridX,gridY].attack_node = true;
	//				//selected_actor.attack_node = true;
	//				scr_colour_attack_node(id);
	//			}
	//		}
	//		else if (total_dist <= selected_actor.attack_range and total_dist > 2 * GRID_SIZE){
	//			scr_colour_attack_node(id);
	//		}
	//	}
	//}
	//else
	//{
	//	with(par_node)
	//	{
	//		//if (id.move_node == true)
	//		//{
	//		//	faux_attack_node = true;
	//		//}
		
	//		x_dist = point_distance(x, y, selected_actor.x, y); //would have measuring to the center but it dont
	//		y_dist = point_distance(x, y, x, selected_actor.y);
	//		total_dist = x_dist + y_dist; //
	//		if (occupant != noone and total_dist <= selected_actor.attack_range)//temp_actor.attack_range)
	//		{
	//			if (occupant.faction != selected_actor.faction)
	//			{
	//				map[gridX,gridY].attack_node = true;
	//				//selected_actor.attack_node = true;
	//				scr_colour_attack_node(id);
	//			}
	//		}
	//		else if (total_dist <= selected_actor.attack_range){
	//			scr_colour_attack_node(id);
	//		}
	//	}
	//}
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