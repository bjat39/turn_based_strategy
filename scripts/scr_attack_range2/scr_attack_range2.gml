// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_range2(closed, selected_actor){
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
	with(par_node)
	{
		//if (id.move_node == true)
		//{
		//	faux_attack_node = true;
		//}
		for(ii = 0; ii < ds_list_size(closed);ii++)
		{
			curr_node = ds_list_find_value(closed,ii);
			x_dist = point_distance(id.x, id.y, curr_node.x, id.y); //would have measuring to the center but it dont
			y_dist = point_distance(id.x, id.y, id.x,curr_node.y);
			total_dist = x_dist + y_dist;
			if (total_dist <= selected_actor.attack_range)//temp_actor.attack_range)
			{
				selected_actor.faux_attack_node = true;
				scr_colour_attack_node(id);
				break;
			}
		}
	}
}