// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_rectangle_center(rect_x,rect_y,width,height,outline,colour,alpha){
	var	old_colour = draw_get_colour();
	var old_alpha = draw_get_alpha();
	
	draw_set_colour(colour);
	draw_set_alpha(alpha);
	
	draw_rectangle(rect_x-width/2,rect_y-height/2,rect_x+width/2,rect_y+height/2,outline);
	
	draw_set_colour(old_colour);
	draw_set_alpha(old_alpha);
}