// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_colour_move_node(node_id,selected_actor_move){ //node id to colour, selected actor's move,  selected actor's action
	//var node, move, tile_colour;
	//node = node_id;
	//move = selected_actor_move;
	//tile_colour = make_color_rgb(216,145,255); //light purple
	
	instance_create_layer(node_id.x,node_id.y,"Move_square_overlay",obj_ds_move_square);
	
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