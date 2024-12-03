// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fade_in_or_out(){//fade_out,spd){
	//var	old_colour = draw_get_colour();
	//var old_alpha = draw_get_alpha();
	
	//draw_set_colour(colour);
	//draw_set_alpha(alpha);
	
	//draw_rectangle(0,0,room_width,room_height,0);
	
	//draw_set_colour(old_colour);
	//draw_set_alpha(old_alpha);
	instance_create_layer(0,0,"Fade",obj_fade1);
}