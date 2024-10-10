/// @description 
x = mouse_x;
y = mouse_y;

gridX = floor(x/GRID_SIZE);
gridY = floor(y/GRID_SIZE);

if (gridX < 0 or gridY < 0 or gridX >= room_width/GRID_SIZE or gridY >= room_height/GRID_SIZE) //outside bounds
{
	hoverNode = noone;
}
else
{
	hoverNode = map[gridX,gridY];
}


if (mouse_check_button_pressed(mb_left)) //switch with z
{
	if (hoverNode.occupant != noone)
	{
		selected_actor = hoverNode.occupant;
		selected_actor.actions = 2;
		scr_movement_range(hoverNode,
			selected_actor.move,selected_actor.actions); //first arg can also be: map[selected_actor.gridX,selected_actor.gridY]
	}
	else
	{
		selected_actor = noone;
		scr_wipe_nodes();
	}
}

if (mouse_check_button_pressed(mb_right))
{
	if (selected_actor != noone and hoverNode.move_node)//hoverNode.occupant == noone and hoverNode.passable)
	{
		//first clear the node of selected actor
		map[selected_actor.gridX,selected_actor.gridY].occupant = noone;
		
		//update selected_actor position and info
		selected_actor.gridX = gridX;
		selected_actor.gridY = gridY;
		selected_actor.x = hoverNode.x;
		selected_actor.y = hoverNode.y;
		
		//update new node's occupant status
		hoverNode.occupant = selected_actor;
		
		//if selected_actor performed double move, deselect. otherwise, decrement actions and reselect
		if (hoverNode.G > selected_actor.move)
		{
			selected_actor = noone;
			scr_wipe_nodes();
		}
		else //have actions
		{
			selected_actor.actions --;
			
			//get rid of
			if (selected_actor.actions > 0)
			{
				scr_movement_range(hoverNode,selected_actor.move,selected_actor.actions);
			}
			else
			{
				selected_actor = noone;
				scr_wipe_nodes();
			}
		}
	}
	else //click on invalid node
	{
		selected_actor = noone;
		scr_wipe_nodes();
	}
}