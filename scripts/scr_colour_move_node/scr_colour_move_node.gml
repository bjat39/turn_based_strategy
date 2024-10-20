// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_colour_move_node(node_id,selected_actor_move){ //node id to colour, selected actor's move,  selected actor's action
	var node, move;
	node = node_id;
	move = selected_actor_move;
	
	node.colour = c_yellow;
	
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