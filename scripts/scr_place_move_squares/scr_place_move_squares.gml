function scr_place_move_squares(){
	mp_grid_clear_rectangle(global.map_grid,0,0,640,360); 
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
	
	for (i = 0; i < 18; i++)
	{
		var i_x; //x position we check to check the move node
		i_x = 64 + global.cell_size * i;

		if (mp_grid_path(global.map_grid,global.navigate,global.selected.cur_node_x,global.selected.cur_node_y,i_x,row,0))
		{
			if (path_get_length(global.navigate) <= global.selected.pixel_dist)
			{
				instance_create_layer(i_x,row,"Instances",obj_move_square);
			}
			else
			{
				mp_grid_add_rectangle(global.map_grid,i_x,row,i_x,row); //*WATCH THIS, may remove for an object over the Instance layer
			}
		}
		else {mp_grid_add_rectangle(global.map_grid,i_x,row,i_x,row);} //*WATCH THIS, may remove for an object over the Instance layer
		
		if (i_x >= 576) //last row of the grid, then it needs to move down
		{
			i = -1;
			row += global.cell_size;
		}
		
		if (row > 320) //bottom row
		{
			row = 128;
			i = 20; //stop loop 
		}
	}
}