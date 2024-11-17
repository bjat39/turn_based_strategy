// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_hori_input(){
	var right_key = keyboard_check_pressed(vk_right);
	var left_key = keyboard_check_pressed(vk_left);

	//move thru the menu
	var input = right_key - left_key;
	
	return input;
}