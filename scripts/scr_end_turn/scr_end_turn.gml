// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_end_turn(faction){
	with(par_aleneti_faction)
	{
		unit_state = "finish";
		
		ds_list_add(obj_game.finished_aleneti_list,id)
		
		with(obj_game)
		{
			if (ds_list_size(finished_aleneti_list) >= ds_list_size(aleneti_list))
			{
				ds_list_clear(finished_aleneti_list)
				round_counter ++;
			
				if (round_counter >= ds_list_size(round_order))
				{
					round_counter = 0;
				}
				
				with (par_aleneti_faction)
				{
					unit_state = "idle";
				}
				game_state = ds_list_find_value(round_order,round_counter);
				//game_state = ds_list_find_index(round_order,round_counter);
			}
		}
	}
	
}