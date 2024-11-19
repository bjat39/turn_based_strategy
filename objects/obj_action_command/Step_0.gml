/// @description 
var up_key = keyboard_check_pressed(vk_up);
var down_key = keyboard_check_pressed(vk_down);
//var accept_key = keyboard_check_pressed(ord("Z"));
//var return_key = keyboard_check_pressed(ord("X"));

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move thru the menu
pos += down_key - up_key;

hover_command = ds_list_find_value(command_list,pos);

if (pos >= op_length){pos = 0;}
if (pos < 0){pos = op_length-1;}

if (menu_level == 1)
{
	obj_cursor.x = ds_list_find_value(attack_list,pos).x + GRID_SIZE / 2;
	obj_cursor.y = ds_list_find_value(attack_list,pos).y + GRID_SIZE / 2;
}


if (obj_game.return_input and menu_level > 0)
{
	menu_level = 0;
	//pos = prev_pos;
}

//using the options
if (obj_game.accept_input)
{
	
	//var start_menu_level = menu_level;
	
	
	switch(menu_level)
	{
		//default command list
		case(0):
		switch(hover_command)
		{
			case("Attack"): var prev_pos = pos; menu_level = 1;  break;
		
			case(1): break;
		
			case("Wait"): curr_actor.finish = true; break;
		
		
		}
		break;
		case(1): //attack list
			with instance_create_layer(x,y,"Instances",obj_battle_manager)
			{
				initiator = curr_actor;
				reciever = option[1,pos]
			}
		break;
	}
	
	//switch(menu_level)
	//{
	//	//pause menu
	//	case(0):
	//	switch(pos)
	//	{
	//		//start game
	//		case(0): break;
		
	//		//settings
	//		case(1): menu_level ++; break;
		
	//		//quit game
	//		case(2): break;
		
		
	//	}
	//	break;
	//	case(1):
	//	switch(pos)
	//	{
	//		//window size
	//		case(0): break;
		
	//		//brighhtness
	//		case(1): break;
		
	//		//controls
	//		case(2): break;
		
		
	//	}
	//	break;
	//}
	
	//set position back
	//if (start_menu_level != menu_level){pos = 0;} //menu level has changed
	
	//correct option length
	op_length = array_length(option[menu_level]);
	
	if (curr_actor.finish == true)
	{
		//RESET EVERYTHINGGGG
		curr_actor.moved = true;
		curr_actor.attacked = true;
		curr_actor.unit_state = "idle";
		obj_game.player_state = "cursor_explore";
		instance_destroy();
		//hover_command = noone;
		//hover_attack = noone;
		//ds_list_clear(selected_actor.command_list);
		//ds_list_clear(selected_actor.attack_list);
		//finished = false;
	}
}