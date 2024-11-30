/// @description
if (obj_game.selected_actor == id and obj_game.selected_actor.ai_type == "player") //only the actor who's turn it is will draw a line
{ //
	//if cursor is hovering over a different node other than actors
	if (obj_game.hoverNode != noone and obj_game.hoverNode != map[gridX,gridY])
	{
		current_node = obj_game.hoverNode;
	
		//step through every node, parent to parent, until we reach the actor's node
		while(current_node.parent_node != noone)
		{
			draw_line_width_colour(current_node.x + (GRID_SIZE / 2),current_node.y + (GRID_SIZE / 2),current_node.parent_node.x + (GRID_SIZE / 2),current_node.parent_node.y + (GRID_SIZE / 2),4,c_purple,c_purple);
		
			current_node = current_node.parent_node;
		}

	}
}

//if (pos != noone)//hover_command != noone)
//{
//	draw_text(x+ 32,y + 16, ds_list_find_value(command_list,hover_command));
//}

if (unit_state == "finish")
{
	shader_set(sha_grayscale)
	draw_self()
	shader_reset()
}
else
{
	draw_self();
}

//draw health
if (current_hit_points > 0)
{
	draw_healthbar(x,y+GRID_SIZE-1,x+GRID_SIZE,y+GRID_SIZE,current_hit_points/max_hit_points * 100,c_black,c_red,c_yellow,0,true,true);
}