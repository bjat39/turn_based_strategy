/// @description State control
switch(global.state)
{
	case STATES.P_TURN: scr_state_player_turn(); break;
	case STATES.AI_TURN: scr_state_ai_turn(); break;
}

if (keyboard_check_pressed(ord("R")))
{
	with (par_player)
	{
		pixel_dist = orig_pixel_dist;
		attacked = false;
	}
	global.state = STATES.AI_TURN
	//if(instance_number(par_enemy > 0)) {global.state = STATES.AI_TURN;} //remove later
}