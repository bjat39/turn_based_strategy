/// @description 
switch(unit_state)
{
	case "idle": break;
	case "begin_path":
		//begin moving along path
		path_start(movement_path,move_speed,0,true);
		
		unit_state = "moving";
		break;
	case "moving":
		if (path_index = -1) //path ended
		{
			//clear path
			path_clear_points(movement_path);
			
			unit_state = "idle";
			obj_game.player_state = "cursor_menu";
			
			var new_closed = ds_list_create();
			ds_list_add(new_closed,current_node);
			
			instance_create_layer(x + GRID_SIZE,y,"Menu",obj_action_command);
			
			//scr_action_command_init();
			
			//instance_create_layer(selected_actor.x + GRID_SIZE,selected_actor.y + (GRID_SIZE/2),"Instances",obj_action_command);
			//obj_game.selected_actor = id;
			//scr_movement_range(map[gridX,gridY],move,actions);
		}
		break;
	case ("battle"):
	
		break;
		
	
}

if (finish == true)
{
	//RESET EVERYTHINGGGG
	moved = true;
	attacked = true;
	unit_state = "idle";
	obj_game.player_state = "cursor_explore";
	//instance_destroy(obj_action_command);
	
	//hover_command = noone;
	//hover_attack = noone;
	//ds_list_clear(selected_actor.command_list);
	//ds_list_clear(selected_actor.attack_list);
	//finished = false;
}