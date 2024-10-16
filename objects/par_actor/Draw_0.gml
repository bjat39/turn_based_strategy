/// @description
//if cursor is hovering over a different node other than actors
if (obj_cursor.hoverNode != noone and obj_cursor.hoverNode != map[gridX,gridY])
{
	current_node = obj_cursor.hoverNode;
	
	//step through every node, parent to parent, until we reach the actor's node
	while(current_node.parent_node != noone)
	{
		draw_line_width_colour(current_node.x + (GRID_SIZE / 2),current_node.y + (GRID_SIZE / 2),current_node.parent_node.x + (GRID_SIZE / 2),current_node.parent_node.y + (GRID_SIZE / 2),4,c_lime,c_lime);
		
		current_node = current_node.parent_node;
	}

}

draw_self();