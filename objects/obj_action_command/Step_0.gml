/// @description 
event_inherited();

if (menu_level == 1)
{
	obj_cursor.x = ds_list_find_value(attack_list,pos).x + GRID_SIZE / 2;
	obj_cursor.y = ds_list_find_value(attack_list,pos).y + GRID_SIZE / 2;
}
//else if (menu_level == 0 and hover_command == "Attack")
//{
//	scr_attack_range3(curr_actor,curr_actor.current_node);
//}

if ((hover_command == "Attack" or menu_level == 1) and attack_square_spawn == false)
{
	attack_square_spawn = true;
	scr_attack_range3(curr_actor,curr_actor.current_node);
}
else if ((hover_command != "Attack" and menu_level != 1) and attack_square_spawn == true)
{
	attack_square_spawn = false;
	scr_wipe_nodes();
}

if (obj_game.return_input)
{
	if (menu_level == 1)
	{
		//scr_wipe_nodes();
		menu_level = 0;
		pos = prev_pos;
	}
	else if (menu_level == 0) //return to original position
	{	
		//first clear node of selected actor
		map[curr_actor.gridX,curr_actor.gridY].occupant = noone;
		
		//update selected actor's appropriate grid coords
		curr_actor.gridX = curr_actor.orig_node.gridX;
		curr_actor.gridY = curr_actor.orig_node.gridY;
		
		//update selected actor's future node
		curr_actor.orig_node.occupant = curr_actor;
	
		curr_actor.current_node = curr_actor.orig_node;
		//var curr_node = curr_actor.current_node;
		//curr_actor.gridX = curr_node.gridX;
		//curr_actor.gridY = curr_node.gridY;
		curr_actor.x = curr_actor.current_node.x;
		curr_actor.y = curr_actor.current_node.y;
		curr_actor.moved = false; //change moved to unit state
	
		//first clear node of selected actor
		//map[selected_actor.gridX,selected_actor.gridY].occupant = noone;
		
		////update selected actor's appropriate grid coords
		//selected_actor.gridX = gridX;
		//selected_actor.gridY = gridY;
		
		////update selected actor's future node
		//hoverNode.occupant = selected_actor;
	
		//obj_cursor.x = curr_actor.x + GRID_SIZE/2;
		//obj_cursor.y = curr_actor.y + GRID_SIZE/2;
		scr_play_sound(_066_Equip_06,3,0,obj_game.sfx_gain);
		scr_wipe_nodes();
		curr_actor.unit_state =	"selected";
				//selected_actor.actions = 2;
		scr_movement_range(curr_actor.current_node,
			curr_actor.move,curr_actor.attack_range_real,curr_actor);
		//obj_game.selected_actor = noone;
		obj_game.player_state = "cursor_selected"; //unit state moved?
		instance_destroy();
	}
}


//using the options
if (obj_game.accept_input)
{
	
	//var start_menu_level = menu_level;
	
	
	switch(menu_level)
	{
		//default command list
		case(0):
		switch(hover_command)
		{
			case("Attack"): prev_pos = pos; menu_level = 1;break;//varprev_pos = pos; menu_level = 1;break;//scr_attack_range3(curr_actor,curr_actor.current_node);  break;
		
			case(1): break;
		
			case("Wait"): curr_actor.unit_state = "finishing"; delete_box = true; break;
		
		
		}
		break;
		case(1): //attack list
			curr_actor.unit_state = "battle";
			with instance_create_layer(x,y,"Instances",obj_battle_manager)
			{
				initiator = other.curr_actor;
				var node = other.option[1,other.pos];
				reciever = node.occupant;
			}  
			instance_destroy();
		break;
	}
	
	//switch(menu_level)
	//{
	//	//pause menu
	//	case(0):
	//	switch(pos)
	//	{
	//		//start game
	//		case(0): break;
		
	//		//settings
	//		case(1): menu_level ++; break;
		
	//		//quit game
	//		case(2): break;
		
		
	//	}
	//	break;
	//	case(1):
	//	switch(pos)
	//	{
	//		//window size
	//		case(0): break;
		
	//		//brighhtness
	//		case(1): break;
		
	//		//controls
	//		case(2): break;
		
		
	//	}
	//	break;
	//}
	
	//set position back
	//if (start_menu_level != menu_level){pos = 0;} //menu level has changed
	
	//correct option length
	op_length = array_length(option[menu_level]);
	
	
	if (delete_box == true)
	{
		curr_actor.orig_node = curr_actor.current_node;
		obj_game.selected_actor = noone;
		obj_game.player_state = "cursor_explore";
		with (obj_action_command)
		{
			instance_destroy();
		}
	}

}