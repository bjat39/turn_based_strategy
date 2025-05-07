// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_kill_unit(unit){
	map[unit.gridX,unit.gridY].occupant = noone;
	
	switch(unit.faction)
	{
		case"neft":
		ds_list_delete(obj_game.neft_list,ds_list_find_index(obj_game.neft_list,unit))
		
		if (ds_list_find_index(obj_game.finished_neft_list,unit) >= 0) //is on list
		{
			ds_list_delete(obj_game.finished_neft_list,ds_list_find_index(obj_game.neft_list,unit))
		}
		
		if (ds_list_size(obj_game.neft_list) <= 0)
		{
			obj_game.game_state = "game_over"
		}
		break;
		case"ally":
		ds_list_delete(obj_game.ally_list,ds_list_find_index(obj_game.ally_list,unit))
		
		if (ds_list_find_index(obj_game.finished_ally_list,unit) >= 0) //is on list
		{
			ds_list_delete(obj_game.finished_ally_list,ds_list_find_index(obj_game.ally_list,unit))
		}
		break;
		case"aleneti":
		ds_list_delete(obj_game.aleneti_list,ds_list_find_index(obj_game.aleneti_list,unit))
		
		if (ds_list_find_index(obj_game.finished_aleneti_list,unit) >= 0) //is on list
		{
			ds_list_delete(obj_game.finished_aleneti_list,ds_list_find_index(obj_game.aleneti_list,unit))
		}
		break;
		case"strucia":	
		ds_list_delete(obj_game.strucia_list,ds_list_find_index(obj_game.strucia_list,unit))
		
		if (ds_list_find_index(obj_game.finished_strucia_list,unit) >= 0) //is on list
		{
			ds_list_delete(obj_game.finished_strucia_list,ds_list_find_index(obj_game.strucia_list,unit))
		}
		break;
	}
	
	instance_destroy(unit);
}