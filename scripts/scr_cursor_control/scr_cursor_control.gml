// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cursor_control(){
	scr_cursor_move();
	
	gridX = floor(obj_cursor.x/GRID_SIZE);
	gridY = floor(obj_cursor.y/GRID_SIZE);
	
	if (gridX < 0 or gridY < 0 or gridX >= room_width/GRID_SIZE or gridY >= room_height/GRID_SIZE) //outside bounds
	{
		hoverNode = noone;
	}
	else
	{
		hoverNode = map[gridX,gridY];
		if (hoverNode.occupant != noone and cursor_move_occupant == false)
		{
			cursor_move_occupant = true;
		}
	}

	//Select unit
	if (obj_game.accept_input)//(mouse_check_button_pressed(mb_left)) //switch with z
	{
		//confirm move
		if (selected_actor != noone and hoverNode.move_node)//hoverNode.occupant == noone and hoverNode.passable)
		{
			if (selected_actor.ai_type == "player")//hoverNode.occupant == noone and hoverNode.passable)
			{
				current_node = hoverNode; //new variable
		
				//create priority queue
				path = ds_priority_create();
		
				//add current node to queue
				ds_priority_add(path,current_node,current_node.G);
		
				//step through each node, parent to parent, until done
				while(current_node.parent_node != noone)
				{
					//add parent node to queue. priority equal to parent's g score
					ds_priority_add(path, current_node.parent_node,current_node.parent_node.G);
			
					//set current_node to equal to current node's parent, ready to go again!
					current_node = current_node.parent_node;
				}
				do
				{
					//delete lowest priority node (closest to actors) store id in actors
					current_node = ds_priority_delete_min(path);
			
					//add current node's sprite coordinates to selected actor's path
					path_add_point(selected_actor.movement_path,current_node.x,current_node.y,100); //100% of movement cost
			
				}until(ds_priority_empty(path))
		
				//clean up queue
				ds_priority_destroy(path);
		
				//first clear node of selected actor
				map[selected_actor.gridX,selected_actor.gridY].occupant = noone;
		
				//update selected actor's appropriate grid coords
				selected_actor.gridX = gridX;
				selected_actor.gridY = gridY;
		
				//update selected actor's future node
				hoverNode.occupant = selected_actor;
		
				//send selected actor on its way
				selected_actor.unit_state =	"begin_path";
		
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
				scr_wipe_nodes();
				selected_actor = hoverNode.occupant;
				//selected_actor.actions = 2;
				scr_movement_range(hoverNode,
					selected_actor.move,selected_actor.attack_range,selected_actor); //first arg can also be: map[selected_actor.gridX,selected_actor.gridY]
				//scr_attack_range(selected_actor);
			}
		}
		else
		{
			selected_actor = noone;
			scr_wipe_nodes();
		}
		
		//else //click on invalid node
		//{
		//	selected_actor = noone;
		//	scr_wipe_nodes();
		//}
		
	}


	if (obj_game.return_input) //mouse_check_button_pressed(mb_right))
	{
		
	}
	
	if (obj_game.neft_input) //return to neft, mc
	{
		audio_play_sound(sfx_click1,3,0);
		if (instance_exists(obj_neft))
		{
			obj_cursor.x = obj_neft.x;
			obj_cursor.y = obj_neft.y
		}
	}
}