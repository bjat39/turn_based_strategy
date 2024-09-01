///@function scr_navigation(start_x,start_y,end_x,end_y,pace)
function scr_navigation(){ //Finds the path to move
	var start_x = argument0;
	var start_y = argument1;
	var end_x = argument2;
	var end_y = argument3;
	var pace = argument4;
	
	if !(mp_grid_path(global.map_grid,global.navigate,start_x,start_y,end_x,end_y,0)) //if cannot path to
	{
		//WATCH THIS
		show_message("Unable to navigate");
		return false;
	}
	else
	{
		mp_grid_path(global.map_grid,global.navigate,start_x,start_y,end_x,end_y,0)
		path_start(global.navigate,pace,0,false);
		return true;
	}
}