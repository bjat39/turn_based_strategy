function scr_place_attack_squares(){
	mp_grid_clear_rectangle(global.map_grid,0,0,room_width,room_height); 
	
	
	with (obj_move_square) //Move aaround obstacles
	{
		instance_destroy()
	}
	
	
		with (par_player) //Move aaround obstacles
		{
			if (self.id != global.selected.id) //{mp_grid_add_cell(global.map_grid, round(x/32)-2,round(y/32)-2);}
			{
				mp_grid_add_rectangle(global.map_grid,x,y,x,y) //*replace with an object please
			}
		}
	
		with (par_enemy) //Move aaround obstacles
		{
			//if (self.id != global.selected.id) //{mp_grid_add_cell(global.map_grid, round(x/32)-2,round(y/32)-2);}
			//{
			mp_grid_add_rectangle(global.map_grid,x,y,x,y) //*replace with an object please
			//}
		}
	
	//var move_square_id = instance_place_list()
	//var move_square_num = instance_number(obj_move_square)
	
	//with (par_enemy)
	//{  //130 = five square-ish range
	//	if (distance_to_object(global.selected) <= 130){instance_create_layer(x,y,"Instances",obj_attack_square);}
						
	//	//path_
	//	//scr_navigation(x,y,round(mouse_x / global.cell_size) * global.cell_size,round(mouse_y/global.cell_size)*global.cell_size,pace); //current object's x and y
	//	//pixel_dist -= path_get_length(global.navigate); //Take off distance, might want to remove this
	//}
	
	for (i = 0; i < obj_grid.grid_rows + 1; i++)
	{
		var i_x; //x position we check to check the move node
		i_x = 32 + global.cell_size * i;
		//global.attack_navigate
		
		if (mp_grid_path(global.map_grid,global.navigate,global.selected.cur_node_x,global.selected.cur_node_y,i_x,row,0))
		{//VERY IMPORTANT
			var path_length = path_get_length(global.navigate)
			var total_dist = global.selected.attack_pixel_dist + global.selected.pixel_dist;
			if (path_length <= total_dist and !(path_length <= global.selected.pixel_dist)) 
			{
				instance_create_layer(i_x,row,"Instances",obj_attack_square1);
			}
			
			//with (par_enemy)
			//{
			//	mp_grid_clear_rectangle(global.map_grid,x,y,x,y) //allows pathing to the enemy, unfortunately it repeats every loop, and also might let them path to farther away enemies
			//}
			//with (par_player)
			//{
			//	mp_grid_clear_rectangle(global.map_grid,x,y,x,y) //allows pathing to the enemy, unfortunately it repeats every loop, and also might let them path to farther away enemies
			//}
		}
		//	else
		//	{
		//		mp_grid_add_rectangle(global.map_grid,i_x,row,i_x,row); //*WATCH THIS, may remove for an object over the Instance layer
		//	}
		//}
		//else {mp_grid_add_rectangle(global.map_grid,i_x,row,i_x,row);} //*WATCH THIS, may remove for an object over the Instance layer
		
		if (i_x >= 576) //last row of the grid, then it needs to move down //used to be 576, for 640 width
		{
			i = -1;
			row += global.cell_size;
		}
		
		if (row > 320) //bottom row //used to be 320 , 360 height
		{
			row = 32;
			i = 100000;//20; //stop loop 
		}
	}
}