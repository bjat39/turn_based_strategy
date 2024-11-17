// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_player_turn1(){
	//Get inputs
	vert_input = scr_vert_input();
	hori_input = scr_hori_input();
	accept_input = keyboard_check_pressed(ord("Z"));
	return_input = keyboard_check_pressed(ord("X"));
	stat_input = keyboard_check_pressed(ord("C"));
	neft_input = keyboard_check_pressed(vk_lcontrol);
	
	//Cursor state
	//switch(player_state) //change for player state, not cursor state
	//{
	//	case "select": scr_cursor_control(); break;
	//	case "no_select": break;
	//	//case "action_command": scr_action_command_control(); break;
	//}
	if (player_state == "cursor_explore" or player_state == "cursor_move") 
	{scr_cursor_control();}
}