/// @description 
depth = -y;
switch(unit_state)
{
	case "idle": break;
	case "selected": 
		if(ai_type == "player")
		{
			obj_game.player_state = "cursor_selected";
		}
		break;
	case "begin_path":
		//begin moving along path
		scr_play_sound(Rogue_Run_Loop,3,1,obj_game.sfx_gain);
		path_start(movement_path,move_speed,0,true);
		
		orig_node = current_node;
		
		unit_state = "moving";
		obj_game.player_state = "cursor_menu";
		break;
	case "moving":
		if (path_index = -1) //path ended
		{
			//clear path
			audio_stop_sound(Rogue_Run_Loop);
			path_clear_points(movement_path);
			
			unit_state = "idle";
			moved = true;
			
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
	case ("finishing"):
		//RESET EVERYTHINGGGG
		moved = true;
		attacked = true;
		switch(faction)
		{
			case"neft":	ds_list_add(obj_game.finished_neft_list,id);break;
			case"ally":	ds_list_add(obj_game.finished_ally_list,id);break;
			case"aleneti":	ds_list_add(obj_game.finished_aleneti_list,id);break;
			case"strucia":	ds_list_add(obj_game.finished_strucia_list,id);break;
		}
		unit_state = "finish";
		//instance_destroy(obj_action_command);
		
		//hover_command = noone;
		//hover_attack = noone;
		//ds_list_clear(selected_actor.command_list);
		//ds_list_clear(selected_actor.attack_list);
		//finished = false;
		break;
	case ("finish"):

		break;
	case ("dying"):
	
		break;
}