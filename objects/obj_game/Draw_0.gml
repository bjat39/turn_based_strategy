/// @description 
if (hoverNode != noone)
{	
	draw_sprite(spr_selected,0,gridX*GRID_SIZE,gridY*GRID_SIZE);
}

draw_self();

if (hoverNode != noone)
{	
	tempText = string(gridX) + " / " + string(gridY) + " = ";
	
	if (hoverNode.occupant != noone)
	{
		tempText += hoverNode.occupant.actor_name;
	}
	else
	{
		tempText += "noone";
	}
	
	draw_set_color(c_black);
	draw_rectangle(0,0,string_width(tempText),string_height(tempText),false);
	
	draw_set_color(c_white);
	draw_text(0,0,tempText);
	
	tempText = hoverNode.terrain_type;
	
	if (hoverNode.passable)
	{
		tempText += ", passable, " + "cost = " + string(hoverNode.cost);
	}
	
	draw_set_color(c_black);
	draw_rectangle(0,20,string_width(tempText),20+string_height(tempText),false);
	
	draw_set_color(c_white);
	draw_text(0,20,tempText);
	
	//tempText = "Avo: " + hoverNode.terrain_avoid + ", " + "Def: " + hoverNode.terrain_defense;
}

if (selected_actor != noone)
{
	tempText = selected_actor.actor_name;
	
	temp_hit_points = "HP: " + string(selected_actor.current_hit_points) + " / " + string(selected_actor.max_hit_points);
	
	draw_set_color(c_black);
	draw_rectangle(0,room_height,string_width(tempText),room_height-string_height(tempText),false)
	
	draw_set_color(c_white);
	draw_text(0,room_height - string_height(tempText),tempText);
}