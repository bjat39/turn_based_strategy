// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_colour_attack_node(node_id){ //node id to colour, selected actor's move,  selected actor's action
	instance_create_layer(node_id.x,node_id.y,"Move_square_overlay",obj_ds_attack_square);
	
	//var node, move, tile_colour;
	//node = node_id;
	//tile_colour = make_color_rgb(216,0,0); //light purple
	
	//node.colour = tile_colour;
	
	//if (attacked == false) //attacked == false (default 2 actions, if we have two actions)
	//{
	//	if (node.G > move) //if further than move range
	//	{
	//		node.colour = c_yellow;
	//	}
	//	else
	//	{
	//		node.colour = c_aqua;
	//	}
	//}
	//else
	//{
	//	node.colour = c_yellow;
	//}
}