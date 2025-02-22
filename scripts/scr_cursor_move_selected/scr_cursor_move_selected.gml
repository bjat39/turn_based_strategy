// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cursor_move_selected(){
	//explore = slow down if unit in front, slow delay on start
	//move = stop if enemy/attack square/wall, no slow delay on start
	
	//need to implement the delay reseting upon hitting a wall, and the cursor passing over actors within move range, and getting past the move range limit if within one tile
	
	cursor_move_delay --;
	//redo how it does characters, and the default thing.
	//no slow move when attacking?
	//delay resets when new direction?
	var left_boundary = obj_cursor.x - GRID_SIZE > 0; //check if move would go outside the boundary
	var top_boundary = obj_cursor.y - GRID_SIZE > 0;
	var right_boundary = obj_cursor.x + GRID_SIZE < room_width;
	var bottom_boundary = obj_cursor.y + GRID_SIZE < room_height; //heh bottom
	
	//check each actor to see if we would need to slow down for them
	
	//if (keyboard_check_released(vk_left) or keyboard_check_released(vk_right)
	//	or keyboard_check_released(vk_up) or keyboard_check_released(vk_down))
	if (vert_input == 0 and hori_input == 0)
	{
		cursor_move_slow_initial = 0;
	}
	
	if ((cursor_move_slow_initial < 3) and (vert_input != 0 or hori_input != 0))
	{
		cursor_move_delay_default = 12;
		cursor_move_slow_initial ++;
	}
	//else if (cursor_move_occupant == true)
	//{
	//	cursor_move_delay_default = 20;
	//	cursor_move_occupant = false;
	//}
	else
	{
		cursor_move_delay_default = 2;
	}
	
	//Diagon(al) Alley
	//up left
	if(vert_input == -1 and hori_input == -1 and left_boundary
		 and top_boundary and cursor_move_delay < 0) //up left
	{
		//audio_play_sound(sfx_click1,4,0);
		//if (instance_position(obj_cursor.x - GRID_SIZE,obj_cursor.y - GRID_SIZE,par_actor))
		//	{cursor_move_delay_default = cursor_move_slow_actor_default;}
		if (!map[gridX-1,gridY-1].move_node == false) //outside range?
		{
			scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.x -= GRID_SIZE;
			obj_cursor.y -= GRID_SIZE;
		}
	}//up right
	else if(vert_input == -1 and hori_input == 1 and right_boundary
		and top_boundary and cursor_move_delay < 0)
	{
		if (!map[gridX+1,gridY-1].move_node == false) //implement if not one tile away before moving into attack square, then block moving. else, move through attack square, so you can look at enemies stats
		{
			scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.x += GRID_SIZE;
			obj_cursor.y -= GRID_SIZE;
		}

	}//down right
	else if(vert_input == 1 and hori_input == 1 and bottom_boundary
		and right_boundary and cursor_move_delay < 0)
	{
		if (!map[gridX+1,gridY+1].move_node == false) //implement if not one tile away before moving into attack square, then block moving. else, move through attack square, so you can look at enemies stats
		{
			scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.x += GRID_SIZE;
			obj_cursor.y += GRID_SIZE;
		}
	}//down left
	else if(vert_input == 1 and hori_input == -1 and bottom_boundary
		and left_boundary and cursor_move_delay < 0)
	{
		if (!map[gridX-1,gridY+1].move_node == false) //implement if not one tile away before moving into attack square, then block moving. else, move through attack square, so you can look at enemies stats
		{
			scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.x -= GRID_SIZE;
			obj_cursor.y += GRID_SIZE;
		}
	}
	
	//Cardinal directions
	//left
	else if(hori_input == -1 and left_boundary and cursor_move_delay < 0)
	{
		if (!map[gridX-1,gridY].move_node == false) //implement if not one tile away before moving into attack square, then block moving. else, move through attack square, so you can look at enemies stats
		{
			scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.x -= GRID_SIZE;
		}

	}//right
	else if(hori_input == 1 and right_boundary and cursor_move_delay < 0)
	{
		if (!map[gridX+1,gridY].move_node == false) //implement if not one tile away before moving into attack square, then block moving. else, move through attack square, so you can look at enemies stats
		{
			scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.x += GRID_SIZE;
		}
	}//down
	else if(vert_input == 1 and bottom_boundary and cursor_move_delay < 0)
	{

		if (!map[gridX,gridY+1].move_node == false) //implement if not one tile away before moving into attack square, then block moving. else, move through attack square, so you can look at enemies stats
		{
			scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.y += GRID_SIZE;
		}
	}//upp
	else if(vert_input == -1 and top_boundary and cursor_move_delay < 0)
	{
		//scr_play_sound(_05_hover,3,0,obj_game.sfx_gain);
		if (!map[gridX,gridY-1].move_node == false) //implement if not one tile away before moving into attack square, then block moving. else, move through attack square, so you can look at enemies stats
		{
			cursor_move_slow_initial ++;
			cursor_move_delay = cursor_move_delay_default;
			obj_cursor.y -= GRID_SIZE;
		}
	}
	
}