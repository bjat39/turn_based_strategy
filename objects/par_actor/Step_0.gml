/// @description 
switch(state)
{
	case "idle": break;
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
			var new_closed = ds_list_create();
			ds_list_add(new_closed,current_node);
			
			moved = true;
			if (!attacked)
			{
				scr_attack_range3(id,id.current_node);
			}
			//obj_game.selected_actor = id;
			//scr_movement_range(map[gridX,gridY],move,actions);
		}
		break;
	case "begin attack":
		//before attack animation
		attack_timer -= 1;
		if (attack_timer <= 0)
		{
			state = "attack";
		}
		
		break;
	case "attack":
			scr_attack_enemy();
			break;
		//}
		//break;
	case "end attack":
		attack_timer -= 1;
		
		if(attack_timer <= 0)
		{
			attacked = true;
			state = "idle";
		}
		break;
}