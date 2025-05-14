// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cursor_control(){
	if (player_state == "cursor_explore")//exploring map
	{  
		scr_cursor_move_explore();
	}
	else if (player_state == "cursor_selected") //selected character
	{
		scr_cursor_move_selected()
	}
	else if (player_state == "cursor_menu")
	{
		return;
	}
	
	gridX = floor(obj_cursor.x/GRID_SIZE);
	gridY = floor(obj_cursor.y/GRID_SIZE);
	
	if (gridX < 0 or gridY < 0 or gridX >= room_width/GRID_SIZE or gridY >= room_height/GRID_SIZE) //outside bounds
	{
		hoverNode = noone;
	}
	else
	{
		hoverNode = map[gridX,gridY];
	}

	//Select unit
	if (obj_game.accept_input)//(mouse_check_button_pressed(mb_left)) //switch with z
	{
		//confirm moving unit
		if (selected_actor != noone and hoverNode.move_node)//hoverNode.occupant == noone and hoverNode.passable)
		{
			if (selected_actor.ai_type == "player")//hoverNode.occupant == noone and hoverNode.passable)
			{
				scr_play_sound(_066_Equip_06,3,0,obj_game.sfx_gain);
				current_node = hoverNode; //node we want to end up at
		
				scr_create_path(selected_actor,current_node);
				
				//first clear node of selected actor
				map[selected_actor.gridX,selected_actor.gridY].occupant = noone;
		
				//update selected actor's appropriate grid coords
				selected_actor.gridX = gridX;
				selected_actor.gridY = gridY;
		
				//update selected actor's future node
				hoverNode.occupant = selected_actor;
		
				//send selected actor on its way
				selected_actor.unit_state =	"begin_path";
				//selected_actor.end_path = "ready"; //if u wanna attack or smth
		
				scr_wipe_nodes();
			}
			else //click anywhere else
			{
				//selected_actor.actions = 2;
				selected_actor = noone;
				scr_wipe_nodes();
			}
		}
		//turn_counter ++;
		//}
		else if (hoverNode.occupant != noone)//select unit
		{
			if (hoverNode.occupant.moved == false)
			{
				scr_play_sound(_066_Equip_06,3,0,obj_game.sfx_gain);
				scr_wipe_nodes();
				selected_actor = hoverNode.occupant;
				selected_actor.unit_state =	"selected";
				//selected_actor.actions = 2;
				if(selected_actor.damage_type == "bow")
				{
					scr_movement_range_1(hoverNode,
					selected_actor.move,selected_actor.attack_range_real,selected_actor);
				}
				else{
				scr_movement_range_1(hoverNode,
					selected_actor.move,selected_actor.attack_range_real,selected_actor); //first arg can also be: map[selected_actor.gridX,selected_actor.gridY]
				}
				//scr_attack_range(selected_actor);
			}
		}
		else if (selected_actor != noone and selected_actor.ai_type != "player"){
			scr_play_sound(sfx_return_book1,3,0,obj_game.sfx_gain);
			selected_actor.unit_state =	"idle";
			selected_actor = noone;

			scr_wipe_nodes();
		}
		else
		{
			//selected_actor = noone;
			//scr_wipe_nodes();
			scr_play_sound(_066_Equip_06,3,0,obj_game.sfx_gain);
			instance_create_layer(60,60,"Menu",obj_pause_menu);
		}
		
		//else //click on invalid node
		//{
		//	selected_actor = noone;
		//	scr_wipe_nodes();
		//}
		
	}


	if (obj_game.return_input) //mouse_check_button_pressed(mb_right))
	{
		if (selected_actor != noone)
		{
			if (selected_actor.ai_type == "player")
			{
				scr_play_sound(sfx_return_book1,3,0,obj_game.sfx_gain);
				selected_actor.unit_state =	"idle";
				obj_cursor.x = selected_actor.x + GRID_SIZE/2;
				obj_cursor.y = selected_actor.y + GRID_SIZE/2;
				selected_actor = noone;
			
				player_state = "cursor_explore"; //unit state moved?
				scr_wipe_nodes();
			}
			else{ //click enemy
				scr_play_sound(sfx_return_book1,3,0,obj_game.sfx_gain);
				selected_actor.unit_state =	"idle";
				selected_actor = noone;

				scr_wipe_nodes();
			}
		}
	}
	
	if (obj_game.stat_input)
	{
		if (hoverNode.occupant != noone)
		{
			player_state = "cursor_explore";
			scr_play_sound(_066_Equip_06,3,0,obj_game.sfx_gain);
			instance_create_layer(60,60,"Menu",obj_stat_menu);
		}
	}
	
	if (obj_game.neft_input) //return to neft, mc
	{
		var neft_unit;
		scr_play_sound(sfx_return_book1,3,0,obj_game.sfx_gain);
		if (hoverNode.occupant != noone)
		{
			if (hoverNode.occupant.faction == "neft")
			{
				if (neft_input_counter + 1 < ds_list_size(neft_list)){
					neft_input_counter ++;
				}
				else{
					neft_input_counter = 0;
				}
				neft_unit = ds_list_find_value(neft_list,neft_input_counter);
				obj_cursor.x = neft_unit.x + GRID_SIZE/2;
				obj_cursor.y = neft_unit.y + GRID_SIZE/2;
			}
			else if (hoverNode.occupant.faction == "aleneti")
			{
				neft_input_counter = ds_list_find_index(aleneti_list, hoverNode.occupant);
				if (neft_input_counter + 1 < ds_list_size(aleneti_list)){
					neft_input_counter ++;
				}
				else{
					neft_input_counter = 0;
				}
				neft_unit = ds_list_find_value(aleneti_list,neft_input_counter);
				obj_cursor.x = neft_unit.x + GRID_SIZE/2;
				obj_cursor.y = neft_unit.y + GRID_SIZE/2;
			}
			else if (hoverNode.occupant.faction == "strucia")
			{
				neft_input_counter = ds_list_find_index(strucia_list, hoverNode.occupant);
				if (neft_input_counter + 1 < ds_list_size(strucia_list)){
					neft_input_counter ++;
				}
				else{
					neft_input_counter = 0;
				}
				neft_unit = ds_list_find_value(strucia_list,neft_input_counter);
				obj_cursor.x = neft_unit.x + GRID_SIZE/2;
				obj_cursor.y = neft_unit.y + GRID_SIZE/2;
			}
			else if (hoverNode.occupant.faction == "ally")
			{
				neft_input_counter = ds_list_find_index(ally_list, hoverNode.occupant);
				if (neft_input_counter + 1 < ds_list_size(ally_list)){
					neft_input_counter ++;
				}
				else{
					neft_input_counter = 0;
				}
				neft_unit = ds_list_find_value(ally_list,neft_input_counter);
				obj_cursor.x = neft_unit.x + GRID_SIZE/2;
				obj_cursor.y = neft_unit.y + GRID_SIZE/2;
			}
		}
		else
		{
			if (instance_exists(par_neft_faction))
			{
				neft_input_counter = 0;
				neft_unit = ds_list_find_value(obj_game.neft_list,neft_input_counter);
				obj_cursor.x = neft_unit.x + GRID_SIZE/2;
				obj_cursor.y = neft_unit.y + GRID_SIZE/2;
			}
		}
	}
}