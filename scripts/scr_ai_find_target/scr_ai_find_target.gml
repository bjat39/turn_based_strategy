// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_find_target(){
	//find target
	
	//take the current node the target is standing on, go through the neighbour list to check every node adjacent
	//if there is anybody not our faction, that's our target, we'll move on to attacking
	with (obj_enemy) //finding enemy is handled by each enemy at a time, not obj_game, randomized list
	{
		attack_target = noone;
		node = map[gridX,gridY];
		//make this priority list eventually
		enemy_list = ds_list_create();//ds_priority_create(); //list of enemies on map, ai
		
		//var move_nodes = scr_movement_range_ai1(node,
		//			move,attack_range,id);
		//scr_attack_range4_ai(move_nodes,id);
		
		//just checking immediate surroundings
		for(ii = 0; ii < ds_list_size(node.neighbours);ii ++) //only checking neighbours
		{
			neighbour = ds_list_find_value(node.neighbours,ii);
			
			if (neighbour.occupant != noone) //if occupied
			{
				if (neighbour.occupant.faction != faction) //if not my faction
				{
					ds_list_add(enemy_list,neighbour.occupant);
					attack_target = neighbour.occupant;
				}
			}
		}
		
		
		if (ds_list_size(enemy_list) > 0)
		{
			attack_target = ds_list_find_value(enemy_list, 0);
			for (i = 0; i < ds_list_size(enemy_list);i++)
			{//temp until i make a damage calc script //prioritise kills, then most damage, then move
				var current = ds_list_find_value(enemy_list, i);
				if (current.defence_stat < attack_target.defence_stat)
				{
					attack_target = current;//irandom_range(0,ds_list_size(enemy_list) - 1));
				}
			}
		}
	
		//if (attack_target != noone)
		//{
		//	unit_state = "battle";
		//	with instance_create_layer(x,y,"Instances",obj_battle_manager)
		//	{
		//		initiator = other;
		//		reciever = other.attack_target;
		//	}  
		//	//unit_state = "begin_path";
		//}
		//else //if attack_target == noone
		if (attack_target == noone)
		{
			//unit_state = "finishing";
			//unit_state = "idle";
			unit_state = "find_move_node";
		}
		else
		{
			end_path = "attack";
		}
		ds_list_destroy(enemy_list);
	}
}