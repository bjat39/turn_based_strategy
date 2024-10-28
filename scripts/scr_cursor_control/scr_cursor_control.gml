// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cursor_control(){
	cursor_move_delay --;
	
	var left_boundary = obj_cursor.x - GRID_SIZE > 0; //check if move would go outside the boundary
	var top_boundary = obj_cursor.y - GRID_SIZE > 0;
	var right_boundary = obj_cursor.x + GRID_SIZE < room_width;
	var bottom_boundary = obj_cursor.y + GRID_SIZE < room_height; //heh bottom
	
	//Diagon(al) Alley
	if(keyboard_check(vk_left) and keyboard_check(vk_up) and left_boundary
		 and top_boundary and cursor_move_delay < 0) //up left
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.x -= GRID_SIZE;
		obj_cursor.y -= GRID_SIZE;
	}
	else if(keyboard_check(vk_right) and keyboard_check(vk_up) and right_boundary
		and top_boundary and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.x += GRID_SIZE;
		obj_cursor.y -= GRID_SIZE;
	}
	else if(keyboard_check(vk_down) and keyboard_check(vk_right) and bottom_boundary
		and right_boundary and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.x += GRID_SIZE;
		obj_cursor.y += GRID_SIZE;
	}
	else if(keyboard_check(vk_down) and keyboard_check(vk_left) and bottom_boundary
		and left_boundary and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.x -= GRID_SIZE;
		obj_cursor.y += GRID_SIZE;
	}
	
	//Cardinal directions
	else if(keyboard_check(vk_left) and (obj_cursor.x - GRID_SIZE > 0) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.x -= GRID_SIZE;
	}
	else if(keyboard_check(vk_right) and (obj_cursor.x + GRID_SIZE < room_width) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.x += GRID_SIZE;
	}
	else if(keyboard_check(vk_down) and (obj_cursor.y + GRID_SIZE < room_height) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.y += GRID_SIZE;
	}
	else if(keyboard_check(vk_up) and (obj_cursor.y - GRID_SIZE > 0) and cursor_move_delay < 0)
	{
		//audio_play_sound(sfx_click1,4,0);
		cursor_move_delay = 3;
		obj_cursor.y -= GRID_SIZE;
	}
}