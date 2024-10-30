// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_command_control(){
	var size = ds_list_size(selected_actor.command_list);
	//var curr_command = selected_actor.hover_command
	var selected_option = ds_list_find_value(selected_actor.command_list, selected_actor.hover_command);
	
	
	if (keyboard_check_pressed(ord("Z")))
	{
		switch(selected_option)
		{
			case "Wait":
				selected_actor.finish = true;
				break;
			case "Attack":
				selected_actor.finish = true;
				break;
		}
		
		//selected_actor.hover_command ;
	}
	
	if (keyboard_check_pressed(vk_up) and size > 1)
	{
		selected_actor.hover_command --;
		if(selected_actor.hover_command < 0)
		{
			selected_actor.hover_command = size;
		}
	}
	else if (keyboard_check_pressed(vk_down) and size > 1)
	{
		selected_actor.hover_command ++;
		if(selected_actor.hover_command > size)
		{
			selected_actor.hover_command = 0;
		}
	}	
	
	//for(ii = 0;ii < ds_list_size(selected_actor.command_list);ii++)
	//{
		
	//}
	
	
	//else if(selected_actor != noone and hoverNode.attack_node)
	//	{
	//		selected_actor.moved = true;
	//		selected_actor.attack_target = hoverNode.occupant;
	//		selected_actor.state = "begin attack";
	//		selected_actor.attack_timer = 10;
	//		selected_actor = noone;
		
	//		scr_wipe_nodes();
	//	}
	//	moved = true; //clickkk
	//	attacked = true;
		
	//	scr_attack_range3(id,id.current_node);
	
	if (selected_actor.finish == true)
	{
		//RESET EVERYTHINGGGG
		selected_actor.moved = true;
		selected_actor.attacked = true;
		selected_actor.state = "idle";
		player_state = "select";
		ds_list_clear(selected_actor.command_list);
		ds_list_clear(selected_actor.attack_list);
		//finished = false;
	}
}