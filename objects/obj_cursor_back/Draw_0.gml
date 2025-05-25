/// @description 
if (obj_game.hoverNode != noone)
{
	if(obj_game.hoverNode.occupant != noone)
	{
		draw_sprite(spr_selected_3,0,x,y);
	}
	else
	{
		draw_self()
	}
}
//else
//{
//	if (obj_game.selected_actor != noone)
//	{
//		if (obj_game.selected_actor.unit_state == "selected")
//		{
//			draw_sprite(spr_cursor_5,0,x,y);}
//		else{
//		draw_sprite(spr_cursor_5,0,x,y - 3 + vertical_position)}
//	}
//	else{draw_sprite(spr_cursor_5,0,x,y - 3 + vertical_position)}
//}
//draw_self();

