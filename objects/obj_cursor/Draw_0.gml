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
}

if (selected_actor != noone)
{
	tempText = selected_actor.actor_name;
	
	draw_set_color(c_black);
	draw_rectangle(0,room_height,string_width(tempText),room_height-string_height(tempText),false)
	
	draw_set_color(c_white);
	draw_text(0,room_height - string_height(tempText),tempText);
}