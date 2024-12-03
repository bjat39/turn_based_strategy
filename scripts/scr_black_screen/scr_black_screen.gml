// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_black_screen(){
	if (!instance_exists(obj_fade))
	{
		instance_create_layer(0,0,"Fade",obj_fade)
	}
	else
	{
		instance_destroy(obj_fade)
	}
}