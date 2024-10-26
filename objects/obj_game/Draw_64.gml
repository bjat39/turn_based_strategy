/// @description 
if (hoverNode != noone)
{	
	tempCoords = string(gridX) + " / " + string(gridY) //+ " = ";
	draw_set_color(c_black);
	draw_rectangle(0,0,string_width(tempCoords),string_height(tempCoords),false);
	
	draw_set_color(c_white);
	draw_text(0,0,tempCoords);
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
	
			//draw_set_color(c_white);
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