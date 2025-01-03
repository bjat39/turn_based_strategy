// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_end_turn(faction){ //end the turn of all units of a respective faction, move on to next round
	var finish_list, faction_parent;
	switch(faction)
		{
			case"neft":	finish_list = obj_game.finished_neft_list; faction_parent = par_neft_faction;break;
			case"ally":	finish_list = obj_game.finished_ally_list; faction_parent = par_ally_faction;break;
			case"aleneti":	finish_list = obj_game.finished_aleneti_list; faction_parent = par_aleneti_faction;break;
			case"strucia":	finish_list = obj_game.finished_strucia_list; faction_parent = par_strucia_faction;break;
		}
	with(faction_parent)
	{
		unit_state = "finish";
		moved = false;
		attacked = false;
		//ds_list_add(finish_list,id)
	}
	with(obj_game)
		{
		//if (ds_list_size(finish_list) >= ds_list_size(finish_list))
		//{
			ds_list_clear(finish_list)
			round_counter ++;
			
			if (round_counter >= ds_list_size(round_order))
			{
				round_counter = 0;
			}
			
			if (round_counter == 0)
			{
				if (instance_exists(obj_neft))
				{
					obj_cursor.x = obj_neft.x + GRID_SIZE/2;
					obj_cursor.y = obj_neft.y + GRID_SIZE/2;
				}
				else if (instance_exists(obj_talia))
				{
					obj_cursor.x = obj_talia.x + GRID_SIZE/2;
					obj_cursor.y = obj_talia.y + GRID_SIZE/2;
				}
				else if (instance_exists(obj_oriel))
				{
					obj_cursor.x = obj_oriel.x + GRID_SIZE/2;
					obj_cursor.y = obj_oriel.y + GRID_SIZE/2;
				}				
				else
				{
					obj_cursor.x = GRID_SIZE/2;
					obj_cursor.y = GRID_SIZE/2;
				}
			}
			
			with (faction_parent)
			{
				unit_state = "idle";
			}
			game_state = ds_list_find_value(round_order,round_counter);
			ai_state = "initialise";
			//game_state = ds_list_find_index(round_order,round_counter);
		//}
		}
}