/// @description 
if (obj_game.hoverNode != noone)
{
	if(obj_game.hoverNode.occupant != noone)
	{
		draw_sprite(spr_cursor_5,0,x,y-4);
	}
}
else
{
	draw_sprite(spr_cursor_5,0,x,y);
}
//draw_self();
