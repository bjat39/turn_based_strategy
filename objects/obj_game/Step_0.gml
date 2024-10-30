/// @description 

switch(game_state)
{
	case "initialising": scr_state_initialize_grid(); break;
	case "neft_faction_turn": scr_state_player_turn1(); break;
	case "aleneti_faction_turn": break;//scr_state_ai_turn(); break;
}

if (keyboard_check_pressed(ord("R")))
{
	with (par_neft_faction)
	{
		moved = false; //neccessary?
		attacked = false;
		finish = false;
		//unit_state = UNIT_STATE.READY;
		
	}
	//global.state = STATES.AI_TURN
	//if(instance_number(par_enemy > 0)) {global.state = STATES.AI_TURN;} //remove later
}