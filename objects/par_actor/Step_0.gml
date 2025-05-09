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
		if (player_controlled){
			obj_game.player_state = "cursor_menu";}
		break;
	case "moving":
		if (path_index = -1) //path ended
		{
			//clear path
			audio_stop_sound(Rogue_Run_Loop);
			path_clear_points(movement_path);
			
			if (player_controlled)
			{
				unit_state = "idle";
				moved = true;
			
				var new_closed = ds_list_create();
				ds_list_add(new_closed,current_node);

				instance_create_layer(x + GRID_SIZE,y,"Menu",obj_action_command);
			}
			else //////////////////////////////move to start, need to figure out at beginning of turn if
			{
				if (end_path != noone)
				{//change to prioritise kills and shit
					unit_state = "battle";
					selected_attack = noone; //reset attack, no leftover data?
					selected_attack = scr_get_full_attack_info(id, attack_target);
					with instance_create_layer(x + 16,y,"Instances",obj_battle_manager)
					{
						attack_data = other.selected_attack;
						attack_rounds = scr_create_attack_sequence(attack_data.attacker1,attack_data.defender1);
					} 
					//obj_game.current_actor = noone;//remove?
				}
				else
				{
					moved = true;
					unit_state = "finishing";
				}
				
				//unit_state = "find_target"; //"find_move_node"
				
				//if (attack_target != noone)
				//{
				//	unit_state = "battle";
				//	with instance_create_layer(x,y,"Instances",obj_battle_manager)
				//	{
				//		initiator = other;
				//		reciever = attack_target;
				//	} 
				//}
				//obj_game.current_actor = noone;//remove?
			}
			
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
		if(player_controlled == false)
		{
			obj_game.ai_unit_counter ++; //next unit
			obj_game.ai_state = "set_active_unit";
		}
		
		if(death_flag == true)
		{
			unit_state = "initiate_dying";
		}
		else{
			unit_state = "finish";
		}
		
		switch(faction)
		{//check if finished list == size of faction, then end turn
			case"neft":	ds_list_add(obj_game.finished_neft_list,id);
			if (ds_list_size(obj_game.finished_neft_list) >= instance_number(par_neft_faction))
			{
				scr_end_turn("neft");
			}
			break;
			case"ally":	ds_list_add(obj_game.finished_ally_list,id);
			if (ds_list_size(obj_game.finished_ally_list) >= instance_number(par_ally_faction))
			{
				scr_end_turn("ally");
			}
			break;
			case"aleneti":	ds_list_add(obj_game.finished_aleneti_list,id);
			if (ds_list_size(obj_game.finished_aleneti_list) >= instance_number(par_aleneti_faction))
			{
				scr_end_turn("aleneti");
			}			
			break;
			case"strucia":	ds_list_add(obj_game.finished_strucia_list,id);
			if (ds_list_size(obj_game.finished_strucia_list) >= instance_number(par_strucia_faction))
			{
				scr_end_turn("strucia");
			}			
			break;
		}
		
		
		//instance_destroy(obj_action_command);
		
		//hover_command = noone;
		//hover_attack = noone;
		//ds_list_clear(selected_actor.command_list);
		//ds_list_clear(selected_actor.attack_list);
		//finished = false;
		break;
	case ("finish"): break;
	case ("pre_dying_talk"): //player characters talk before dying
		unit_state = "initiate_dying";//speech bubbles probably will just interrupt everything before they're all been gotten through so probably won't need this
	
		break;
	case ("initiate_dying"): unit_state = "dying"; break;
	case ("dying"):
		with (instance_create_layer(x,y,"Instances",obj_corpse))
		{
			sprite_index = other.sprite_index;
			
			//get from obj_battle_manager
			death_weapon_type = "default" //fade out
			death_overkill_damage = 0; //quicker, more violent deaths with more overkill
		}
		scr_kill_unit(id);
			//map[gridX,gridY].occupant = noone;
			//other.state = "finish_battle";
			//initiate exp gain and level up for unit, if there is an opponent
			//instance_destroy();
		//}
	//ai states
	
	break;
	case ("find_target"):
		scr_movement_range_ai1(map[gridX,gridY],move,attack_range);
		unit_state = "find_move_node";
		//scr_ai_find_target();
		
		break;
	case ("find_move_node"):
		scr_ai_find_move_node1();
		scr_wipe_nodes(); //just in case lol
		break;
	
}