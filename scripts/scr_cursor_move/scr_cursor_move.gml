// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cursor_move(){
	cursor_move_delay --;
	//redo how it does characters, and the default thing.
	//no slow move when attacking?
	//delay resets when new direction?
	var left_boundary = obj_cursor.x - GRID_SIZE > 0; //check if move would go outside the boundary
	var top_boundary = obj_cursor.y - GRID_SIZE > 0;
	var right_boundary = obj_cursor.x + GRID_SIZE < room_width;
	var bottom_boundary = obj_cursor.y + GRID_SIZE < room_height; //heh bottom
	
	var left_key = keyboard_check(vk_left);
	var up_key = keyboard_check(vk_up);
	var right_key = keyboard_check(vk_right);
	var down_key = keyboard_check(vk_down);
	
	//if (keyboard_check_released(vk_left) or keyboard_check_released(vk_right)
	//	or keyboard_check_released(vk_up) or keyboard_check_released(vk_down))
	if (!left_key and !right_key and !up_key and !down_key)
	{
		cursor_move_slow_initial = 0;
	}
	
	if ((cursor_move_slow_initial < 3) and (left_key or up_key or right_key or down_key))
	{
		cursor_move_delay_default = 12;
		cursor_move_slow_initial ++;
	}
	else if (cursor_move_occupant == true)
	{
		cursor_move_delay_default = 20;
		cursor_move_occupant = false;
	}
	else
	{
		cursor_move_delay_default = 2;
	}
	
	//Diagon(al) Alley
	if(left_key and up_key and left_boundary
		 and top_boundary and cursor_move_delay < 0) //up left
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_slow_initial ++;
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.x -= GRID_SIZE;
		obj_cursor.y -= GRID_SIZE;
	}
	else if(right_key and up_key and right_boundary
		and top_boundary and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_slow_initial ++;
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.x += GRID_SIZE;
		obj_cursor.y -= GRID_SIZE;
	}
	else if(down_key and right_key and bottom_boundary
		and right_boundary and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_slow_initial ++;
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.x += GRID_SIZE;
		obj_cursor.y += GRID_SIZE;
	}
	else if(down_key and left_key and bottom_boundary
		and left_boundary and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.x -= GRID_SIZE;
		obj_cursor.y += GRID_SIZE;
	}
	
	//Cardinal directions
	else if(left_key and (obj_cursor.x - GRID_SIZE > 0) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_slow_initial ++;
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.x -= GRID_SIZE;
	}
	else if(right_key and (obj_cursor.x + GRID_SIZE < room_width) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_slow_initial ++;
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.x += GRID_SIZE;
	}
	else if(down_key and (obj_cursor.y + GRID_SIZE < room_height) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_slow_initial ++;
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.y += GRID_SIZE;
	}
	else if(up_key and (obj_cursor.y - GRID_SIZE > 0) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_slow_initial ++;
		cursor_move_delay = cursor_move_delay_default;
		obj_cursor.y -= GRID_SIZE;
	}
	

}