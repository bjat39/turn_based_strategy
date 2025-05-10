/// @description 
//Dynamically get width and height of menu, resize
var new_w = 0; //new width
if (menu_level == 1)
{
	for (var i = 0; i < op_length;i++)
	{
		var op_w = string_width(option[menu_level,i].defender_name);
		new_w = max(new_w,op_w);
	}
}
else
{
	for (var i = 0; i < op_length;i++)
	{
		var op_w = string_width(option[menu_level,i]);
		new_w = max(new_w,op_w);
	}	
}

width = new_w + op_border * 2;
height = op_border * 2 + string_height(option[0,0]) + (op_length - 1) * op_space;

//Draw menu background
if (menu_level != 2){
draw_sprite_ext(spr_index,0,x,y,width/sprite_get_width(spr_index),height/sprite_get_height(spr_index),0,c_white,1);
}

//Draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (menu_level == 0)
{
	for (var i = 0; i < op_length;i++)
	{
		var col = c_white;
		if (pos == i){col = c_yellow;}
		scr_draw_txt_border(x+op_border,y+op_border + op_space * i,option[menu_level,i],c_black,col)
	}
}
else if (menu_level == 1)
{
	for (var i = 0; i < op_length;i++)
	{
		var col = c_white;
		if (pos == i){col = c_yellow;}
		scr_draw_txt_border(x+op_border,y+op_border + op_space * i,option[1,i].defender1.actor_name,c_black,col);
		//draw_text_colour(x+op_border,y+op_border + op_space * i,option[1,i].defender1.actor_name, col, col, col, col, 1);
	}
}
//else if (menu_level == 2)
//{
//	for (var i = 0; i < op_length;i++)
//	{
//		var col = c_white;
//		draw_text_colour(x+op_border,y+op_border + op_space * i,selected_attack.attacker_damage, col, col, col, col, 1);
//		if (pos == i){col = c_yellow;}
//		//draw_text_colour(x+op_border,y+op_border + op_space * i,selected_attack.attacker_damage, col, col, col, col, 1);
//	}
//	//scr_draw_txt_border(x+op_border,y+op_border + op_space * 1 - forecast_box_displacement, selected_attack.attacker1.actor_name,c_light_purple,c_black);
//	//scr_draw_txt_border(x+op_border,y+op_border + op_space * 1 - forecast_box_displacement, selected_attack.attacker1.actor_name,c_black,c_light_purple);
//	//scr_draw_txt_border(x+op_border,y+op_border + op_space * 2 - forecast_box_displacement, selected_attack.attacker_hp,c_black,c_light_purple);
//	//scr_draw_txt_border(x+op_border,y+op_border + op_space * 3 - forecast_box_displacement, selected_attack.attacker_damage,c_black,c_light_purple);
//	//scr_draw_txt_border(x+op_border,y+op_border + op_space * 4 - forecast_box_displacement, selected_attack.attacker_hit,c_black,c_light_purple);
//	//scr_draw_txt_border(x+op_border,y+op_border + op_space * 5 - forecast_box_displacement, selected_attack.attacker_crit,c_black,c_light_purple);
//	scr_draw_txt_border(30,30 + op_space * 1, selected_attack.attacker1.actor_name,c_black,c_light_purple);
//	scr_draw_txt_border(x+op_border,y+op_border + op_space * 2 - forecast_box_displacement, selected_attack.attacker_hp,c_black,c_light_purple);
//	scr_draw_txt_border(x+op_border,y+op_border + op_space * 3 - forecast_box_displacement, selected_attack.attacker_damage,c_black,c_light_purple);
//	scr_draw_txt_border(x+op_border,y+op_border + op_space * 4 - forecast_box_displacement, selected_attack.attacker_hit,c_black,c_light_purple);
//	scr_draw_txt_border(x+op_border,y+op_border + op_space * 5 - forecast_box_displacement, selected_attack.attacker_crit,c_black,c_light_purple);
//}