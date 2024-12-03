// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_vis_background(){
var lay_id_1 = layer_get_id("Background_1");
var back_id_1 = layer_background_get_id(lay_id_1);
var lay_id_2 = layer_get_id("Background_2");
var back_id_2 = layer_background_get_id(lay_id_2);
	if (layer_background_get_visible(back_id_1) == false)
	{
		layer_background_visible(back_id_1, true);
	}
	else
	{
		layer_background_visible(back_id_1, false);
	}
	
	if (layer_background_get_visible(back_id_2) == false)
	{
		layer_background_visible(back_id_2, true);
	}
	else
	{
		layer_background_visible(back_id_2, false);
	}
}