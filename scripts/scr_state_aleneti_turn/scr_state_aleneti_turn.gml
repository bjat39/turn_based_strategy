// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_aleneti_turn(){
	with(par_aleneti_faction)
	{
		

		unit_state = "finish";
		ds_list_add(obj_game.finished_aleneti_list,id)
		
		
		
		if (ds_list_size(obj_game.finished_aleneti_list) >= ds_list_size(obj_game.aleneti_list))
		{
			ds_list_clear(obj_game.finished_aleneti_list)
		}
	}
}