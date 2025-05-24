/// @description 
var vertical_position = sin(current_time / 300);
if (obj_game.hoverNode != noone)
{
	if(obj_game.hoverNode.occupant != noone)
	{
		draw_sprite(spr_cursor_5,0,x,y-8 + vertical_position);
	}
	else
	{
		draw_sprite(spr_cursor_5,0,x,y - 3 + vertical_position); //-2
	}
}
else
{
	if (obj_game.selected_actor != noone)
	{
		if (obj_game.selected_actor.unit_state == "selected")
		{
			draw_sprite(spr_cursor_5,0,x,y);}
		else{
		draw_sprite(spr_cursor_5,0,x,y - 3 + vertical_position)}
	}
	else{draw_sprite(spr_cursor_5,0,x,y - 3 + vertical_position)}
}
//draw_self();
