// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_command_control(){
	if (keyboard_check_pressed(ord("Z")))
	{
		selected_actor.moved = true;
		selected_actor.attacked = true;
		selected_actor.state = "idle";
		player_state = "select";
		//selected_actor.hover_command ;
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
}