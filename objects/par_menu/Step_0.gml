/// @description 
var down_key = obj_game.down_input;
var up_key = obj_game.up_input;
if down_key or up_key
{
	scr_play_sound(sfx_confirm_book1,3,0,obj_game.sfx_gain);
}

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move thru the menu
pos += down_key - up_key;

hover_command = ds_list_find_value(command_list,pos);

if (pos >= op_length){pos = 0;}
if (pos < 0){pos = op_length-1;}