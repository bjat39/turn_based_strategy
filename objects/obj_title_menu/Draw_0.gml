/// @description 
//Dynamically get width and height of menu, resize
var new_w = 0; //new width
for (var i = 0; i < op_length;i++)
{
	var op_w = string_width(option[menu_level,i]);
	new_w = max(new_w,op_w);
}

width = new_w + op_border * 2;
height = op_border * 2 + string_height(option[0,0]) + (op_length - 1) * op_space;

//Draw menu background
draw_sprite_ext(sprite_index,image_index,x,y,width/sprite_width,height/sprite_height,0,c_white,1);

//Draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length;i++)
{
	var col = c_white;
	if (pos == i){col = c_yellow;}
	draw_text_colour(x+op_border,y+op_border + op_space * i,option[menu_level,i], col, col, col, col, 1);
}