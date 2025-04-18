// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_aleneti_turn(){
	
	switch(ai_state)
	{
		//case ("not_turn"): break; //shouldn't happen but just for posterity
		case ("initialise"):
		//go thru all alenetians, see their ai type, actually just have everybody attack sraight on for now
		ds_list_clear(aleneti_list);
		ai_unit_counter = 0;
		with (par_aleneti_faction)
		{
			ds_list_add(other.aleneti_list,id);
			//unit_state = "find_target";//"find_move_node";
			//ai_type = "seek_and_destroy"
		}
		//organise priorities of units
		//aleneti_state = "not_turn"; //not_turn, initialise (sort units? do this after every move?), move units
		//aleneti_list
		//finished_aleneti_list
		ai_state = "set_active_unit";
		break;
		case("set_active_unit"):
		if (ai_unit_counter > ds_list_size(aleneti_list))
		{
			ai_state = "finish_turn";
		}
		else{
			with(ds_list_find_value(aleneti_list,ai_unit_counter))
			{
				unit_state = "find_target";
			}
			ai_state = "not_finished";
		}
		break;
		case("not_finished"):
		break;
		case("finish_turn"):
		scr_end_turn("aleneti");
		break;
		//case("find_target"):
		case ("check_priorities"):
		break;
		case ("move_unit"): //move unit(s?)
		
		break;
		
	}
	//scr_ai_find_target();
	
	
	//with(par_aleneti_faction)
	//{
	//	unit_state = "finish";
		
	//	ds_list_add(obj_game.finished_aleneti_list,id)
		
	//	with(obj_game)
	//	{
	//		if (ds_list_size(finished_aleneti_list) >= ds_list_size(aleneti_list))
	//		{
	//			ds_list_clear(finished_aleneti_list)
	//			round_counter ++;
			
	//			if (round_counter >= ds_list_size(round_order))
	//			{
	//				round_counter = 0;
	//			}
				
	//			with (par_aleneti_faction)
	//			{
	//				unit_state = "idle";
	//			}
	//			game_state = ds_list_find_value(round_order,round_counter);
	//			//game_state = ds_list_find_index(round_order,round_counter);
	//		}
	//	}
	//}
}