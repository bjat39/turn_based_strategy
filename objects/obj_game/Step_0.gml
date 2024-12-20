/// @description 

switch(game_state)
{//would be funny if turns went strucia, aleneti, neft, ally :D
	case "initialising": scr_state_initialize_grid(); break;
	case "neft_faction_turn": scr_state_player_turn1(); break;
	case "ally_faction_turn": break;
	case "aleneti_faction_turn": scr_state_aleneti_turn() break;//scr_state_ai_turn(); break;
	case "strucian_faction_turn": break;
}

if (keyboard_check_pressed(ord("R")))
{
	//ADD END TURN HERE
	scr_end_turn("neft");
	//round_counter ++;
	//game_state = ds_list_find_value(round_order,round_counter);
	
	
	//with (par_neft_faction)
	//{
	//	moved = false; //neccessary?
	//	attacked = false;
	//	unit_state = "idle";
	//	//unit_state = UNIT_STATE.READY;
		
	//}
	//global.state = STATES.AI_TURN
	//if(instance_number(par_enemy > 0)) {global.state = STATES.AI_TURN;} //remove later
}