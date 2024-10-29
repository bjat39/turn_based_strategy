// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_player_turn1(){
	//if (current_actor == noone)
	//{
	//Outside bounds
	//obj_cursor.x = mouse_x;
	//obj_cursor.y = mouse_y;
	
	if(selected_actor != noone)
	{
		if (selected_actor.state == "command select")
		{
			player_state = "action command";
		}
	}
	else
	{
		player_state = "select";
	}
	
	switch(player_state)
	{
		case "select": scr_cursor_control(); break;
		case "action_command": scr_action_command_control(); break;
	}
}