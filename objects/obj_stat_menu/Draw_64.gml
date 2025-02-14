/// @description 
//Draw menu background
draw_sprite_ext(spr_index,0,0,0,width,height,0,c_white,1);

//Draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length;i++)
{
	var col = c_white;
	if (pos == i){col = c_yellow;}
	draw_text_colour(x+op_border,y+op_border + op_space * i,option[menu_level,i], col, col, col, col, 1);
}