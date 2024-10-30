// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_command_control(){
	var size = ds_list_size(selected_actor.command_list);
	//var curr_command = selected_actor.hover_command
	var selected_option = ds_list_find_value(selected_actor.command_list, selected_actor.hover_command);
	//move this crap into create event of obj_action_command, don't have obj game do fucking everything, thats not oop
	
	if (keyboard_check_pressed(ord("Z")))
	{
		switch(selected_option)
		{
			case "Wait":
				selected_actor.finish = true;
				break;
			case "Attack":
				hover_attack = 0;
				//for(ii = 1;ii < ds_list_size(selected_actor.attack_list);ii++)
				//{
					
					obj_cursor.x = ds_list_find_value(attack_list,hover_attack)
				//}
	
			
				//scr_attack_range3(id,id.current_node);
				
				//if(hoverNode.attack_node)
				//{
				//	selected_actor.moved = true;
				//	selected_actor.attack_target = hoverNode.occupant;
				//	selected_actor.state = "begin attack";
				//	selected_actor.attack_timer = 10;
				//	selected_actor = noone;
		
				//	scr_wipe_nodes();
				//}
				//moved = true; //clickkk
				//attacked = true;
		
				//
				//selected_actor.finish = true;
				break;
		}
		
		//selected_actor.hover_command ;
	}
	
	if (keyboard_check_pressed(vk_up) and size > 1)
	{
		selected_actor.hover_command --;
		if(selected_actor.hover_command < 0)
		{
			selected_actor.hover_command = size - 1;
		}
	}
	else if (keyboard_check_pressed(vk_down) and size > 1)
	{
		selected_actor.hover_command ++;
		if(selected_actor.hover_command > size - 1)
		{
			selected_actor.hover_command = 0;
		}
	}	
	
	//for(ii = 0;ii < ds_list_size(selected_actor.command_list);ii++)
	//{
		
	//}
	
	if (selected_actor.finish == true)
	{
		//RESET EVERYTHINGGGG
		selected_actor.moved = true;
		selected_actor.attacked = true;
		selected_actor.state = "idle";
		hover_command = noone;
		hover_attack = noone;
		player_state = "select";
		ds_list_clear(selected_actor.command_list);
		ds_list_clear(selected_actor.attack_list);
		//finished = false;
	}
}