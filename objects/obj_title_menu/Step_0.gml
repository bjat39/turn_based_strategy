/// @description 
var up_key = keyboard_check_pressed(vk_up);
var down_key = keyboard_check_pressed(vk_down);
var accept_key = keyboard_check_pressed(ord("Z"));
var return_key = keyboard_check_pressed(ord("X"));

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move thru the menu
pos += down_key - up_key;

if (pos >= op_length){pos = 0;}
if (pos < 0){pos = op_length-1;}

if (return_key and menu_level > 0)
{
	menu_level --;
}

//using the options
if (accept_key)
{
	
	var start_menu_level = menu_level;
	
	switch(menu_level)
	{
		//pause menu
		case(0):
		switch(pos)
		{
			//start game
			case(0): break;
		
			//settings
			case(1): menu_level ++; break;
		
			//quit game
			case(2): break;
		
		
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