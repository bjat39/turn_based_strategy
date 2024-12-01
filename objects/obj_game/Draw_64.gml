/// @description 
if (hoverNode != noone)
{	
	tempCoords = string(gridX) + " / " + string(gridY) //+ " = ";
	draw_set_color(c_black);
	draw_rectangle(0,0,string_width(tempCoords),string_height(tempCoords),false);
	
	draw_set_color(c_white);
	draw_text(0,0,tempCoords);
	
	if (hoverNode.G != noone)
	{
		tempG = string_width(hoverNode.G);
		draw_set_color(c_black);
		draw_rectangle(0,60,string_width(tempG),60+ string_height(tempG),false);
	
		draw_set_color(c_white);
		draw_text(0,60,hoverNode.G);
	}
	
	//debug
	draw_set_color(c_red);
	draw_text(0,220,"player_state: " + player_state);
	
}

draw_self();


if (selected_actor == noone)
{
	if (hoverNode != noone)
	{	
		if (hoverNode.occupant != noone)
		{
			//tempCoords += hoverNode.occupant.actor_name;
			tempText = hoverNode.occupant.actor_name;
	
			temp_hit_points = "HP: " + string(hoverNode.occupant.current_hit_points) + "/" + string(hoverNode.occupant.max_hit_points);
	
			draw_set_color(c_black);
			draw_rectangle(0,20,string_width(tempText),20+ string_height(tempText),false)
			draw_rectangle(0,20 + string_height(tempText),string_width(temp_hit_points),20+ string_height(tempText) + string_height(temp_hit_points),false)
	
			draw_set_color(c_white);
			draw_text(0,20,tempText);
			draw_text(0,20 + string_height(tempText),temp_hit_points);
			//draw_rectangle(0,room_height,string_width(tempText),room_height-string_height(tempText),false)
			
			
			//draw_text(0,room_height - string_height(tempText),tempText);
		}
		//else
		//{
		//	tempCoords += "noone";
		//}
		
		//draw_set_color(c_black);
		//draw_rectangle(0,0,string_width(tempCoords),string_height(tempCoords),false);
	
		//draw_set_color(c_white);
		//draw_text(0,0,tempCoords);
		
		tempText = hoverNode.terrain_type;
	
		if (hoverNode.passable)
		{
			tempText += ", passable, " + "cost = " + string(hoverNode.cost);
		}
	
		draw_set_color(c_black);
		cam_height = camera_get_view_height(obj_camera1.camera);
		draw_rectangle(0,cam_height - 20,string_width(tempText),cam_height - 20 + string_height(tempText),false);
	
		draw_set_color(c_white);
		draw_text(0,cam_height - 20,tempText);
	
		//tempText = "Avo: " + hoverNode.terrain_avoid + ", " + "Def: " + hoverNode.terrain_defense;
	}
}

if (hoverNode != noone)
	{	
		if (hoverNode.occupant != noone)
		{
			draw_set_color(c_red);
			//debug info
			draw_text(0,100,"unit_state: " + hoverNode.occupant.unit_state);
			draw_text(0,120,"moved: " + string(hoverNode.occupant.moved));
			draw_text(0,140,"gridX: " + string(hoverNode.occupant.gridX));
			draw_text(0,160,"gridY: " + string(hoverNode.occupant.gridY));
			draw_text(0,180,"current_node: " + string(hoverNode.occupant.current_node));
			draw_text(0,200,"orig_node: " + string(hoverNode.occupant.orig_node));
			
			draw_set_color(c_white);
		}
	}