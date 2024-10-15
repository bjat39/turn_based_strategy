// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_wipe_nodes(){
	//reset data of all nodes
	with(obj_node)
	{
		move_node = false;
		G = 0;
		parent_node = noone;
		colour = c_white;
	}
}