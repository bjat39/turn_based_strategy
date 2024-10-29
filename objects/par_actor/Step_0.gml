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
			
			state = "command_select";
			var new_closed = ds_list_create();
			ds_list_add(new_closed,current_node);
			
			scr_action_command_init();
			
			//instance_create_layer(selected_actor.x + GRID_SIZE,selected_actor.y + (GRID_SIZE/2),"Instances",obj_action_command);
			//obj_game.selected_actor = id;
			//scr_movement_range(map[gridX,gridY],move,actions);
		}
		break;
	case "command_select":
	{
		break;
		
	}
	case "begin_attack":
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
	case "end_attack"://let scr attack handle this
		attack_timer -= 1;
		
		if(attack_timer <= 0)
		{
			attacked = true;
			state = "idle";
		}
		break;
}