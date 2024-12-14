// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_vert_input(){
	var up_key = keyboard_check(obj_game.up_key);
	var down_key = keyboard_check(obj_game.down_key);
	//move thru the menu
	var input = down_key - up_key;
	
	return input;
}