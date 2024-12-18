// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai(){
	//take the current node the target is standing on, go through the neighbour list to check every node adjacent
	//if there is anybody not our faction, that's our target, we'll move on to attacking
	with (obj_enemy) //finding enemy is handled by each enemy at a time, not obj_game, randomized list
	{
		attack_target = noone;
		node = map[gridX,gridY];
		
		for(ii = 0; ii < ds_list_size(node.neighbours);ii ++)
		{
			neighbour = ds_list_find_value(node.neighbours,ii);
			
			if (neighbour != noone) //if occupied
			{
				if (neighbour.occupant.faction != faction) //if not my faction
				{
					attack_target = neighbour.occupant;
				}
			}
		}
	
		if (attack_target != noone)
		{
			
			//unit_state = "begin_path";
		}
		else
		{
			unit_state = "idle";
		}
	}
}