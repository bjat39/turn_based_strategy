// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_vis_char(obj){
	char = asset_get_index(obj[0]);
	if (object_get_visible(char) == true)
	{
		//object_set_visible(char, false);
		char.visible = false;
	}
	else
	{
		//object_set_visible(char, true);
		char.visible = true;
	}
}