/// @description 
switch(state)
{
	case "begin_path":
		//begin moving along path
		path_start(movement_path,move_speed,0,true);
		
		state = "moving";
		break;
	case "moving":
		if (path_index = -1) //path ended
		{
			//clear path
			path_clear_points(movement_path);
			
			state = "idle";
			
			moved = true;
			if (!attacked)
			{
				scr_attack_range(id);
			}
			//obj_game.selected_actor = id;
			//scr_movement_range(map[gridX,gridY],move,actions);
		}
		break;
}