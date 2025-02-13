/// @description 
event_inherited();
//var up_key = keyboard_check_pressed(vk_up);
//var down_key = keyboard_check_pressed(vk_down);


////store number of options in current menu
//op_length = array_length(option[menu_level]);

////move thru the menu
//pos += down_key - up_key;

//if (pos >= op_length){pos = 0;}
//if (pos < 0){pos = op_length-1;}

if (obj_game.return_input )
{
	if (menu_level == 1)
	{
		menu_level = 0;
		pos = prev_pos;
	}
	else if(menu_level == 0)
	{
	instance_destroy();
	}
}


//using the options
if (obj_game.accept_input)
{
	
	var start_menu_level = menu_level;
	
	switch(menu_level)
	{
		//pause menu
		case(0):
		switch(pos)
		{
			//status screen
			case(0): break;
		
			//settings
			case(1): prev_pos = pos; menu_level = 1; break;
		
			//suspend game
			case(2): game_end();

			break;
			case(3):
			//with (par_actor)
			//{
			//	if (faction == "neft")
			//	{
			//		unit_state = "finishing";
			//	}
			//}
			scr_end_turn("neft");
			instance_destroy();
			break;
		
		}
		break;
		case(1):
		switch(pos)
		{
			//window size
			case(0): break;
		
			//brighhtness
			case(1): break;
		
			//controls
			case(2): break;
		
		
		}
		break;
	}
	
	//set position back
	if (start_menu_level != menu_level){pos = 0;} //menu level has changed
	
	//correct option length
	op_length = array_length(option[menu_level]);
}