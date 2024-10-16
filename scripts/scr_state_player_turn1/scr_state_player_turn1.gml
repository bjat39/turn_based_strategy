// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_player_turn1(){
	if (current_actor == noone)
	{
		if (mouse_check_button_pressed(mb_left)) //switch with z
		{
			if (obj_cursor.hoverNode.occupant != noone)
			{
				selected_actor = obj_cursor.hoverNode.occupant;
				selected_actor.actions = 2;
				scr_movement_range(hoverNode,
					selected_actor.move,selected_actor.actions); //first arg can also be: map[selected_actor.gridX,selected_actor.gridY]
			}
			else
			{
				selected_actor = noone;
				scr_wipe_nodes();
			}
		}
		
		//turn_counter ++;
	}
}