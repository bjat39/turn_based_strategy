/// @description 
if (menu_level == 2)
{
	draw_set_color(c_very_light_yellow);
	draw_rectangle(50,50,97,134,0);
	draw_set_color(c_gray);
	draw_set_alpha(0.75);
	draw_roundrect(85,14+op_space*1,105,14+op_space*3,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_sprite(attack_forecast1,0,44,44);
	
	draw_set_font(fnt_courier_6);
	draw_set_halign(fa_center);
	scr_draw_txt_border(95,14 + op_space * 1, selected_attack.defender1.actor_name,c_black,c_white);
	scr_draw_txt_border(80,14 + op_space * 2, selected_attack.defender_weapon.name1,c_black,c_white);
	
	//defender enemy, right side
	draw_set_halign(fa_left);
	draw_set_font(fnt_courier_5);
	scr_draw_txt_border(95,14 + op_space * 3, selected_attack.defender_hp,c_black,c_light_purple);
	scr_draw_txt_border(95,14 + op_space * 4, selected_attack.defender_damage,c_black,c_light_purple);
	scr_draw_txt_border(95,14 + op_space * 5, selected_attack.defender_hit,c_black,c_light_purple);
	scr_draw_txt_border(95,14 + op_space * 6 , selected_attack.defender_crit,c_black,c_light_purple);
	
	draw_set_font(fnt_courier_6);
	//hit, crit etc
	draw_set_halign(fa_center);
	scr_draw_txt_border(80,18 + op_space * 3, "HP",c_black,c_light_yellow);
	scr_draw_txt_border(80,18 + op_space * 4, "Mt",c_black,c_light_yellow);
	scr_draw_txt_border(80,18 + op_space * 5, "Hit",c_black,c_light_yellow);
	scr_draw_txt_border(80,18 + op_space * 6 , "Crit",c_black,c_light_yellow);
	

	//attacker, generally neft, generally left
	draw_set_halign(fa_right);
	draw_set_font(fnt_courier_5);
	scr_draw_txt_border(65,14 + op_space * 3, selected_attack.attacker_hp,c_black,c_light_purple);
	scr_draw_txt_border(65,14 + op_space * 4, selected_attack.attacker_damage,c_black,c_light_purple);
	scr_draw_txt_border(65,14 + op_space * 5, selected_attack.attacker_hit,c_black,c_light_purple);
	scr_draw_txt_border(65,14 + op_space * 6 , selected_attack.attacker_crit,c_black,c_light_purple);
	draw_set_halign(fa_center);
	draw_set_font(fnt_courier_6);
	scr_draw_txt_border(80,18 + op_space * 7, selected_attack.attacker_weapon.name1,c_black,c_white);
	scr_draw_txt_border(55,18 + op_space * 8, selected_attack.attacker1.actor_name,c_black,c_white);
	
	draw_set_halign(fa_left);
	draw_set_font(fnt_courier_5);
	if (selected_attack.defender_advantage_mult == 1)
	{
		draw_sprite_ext(weaponadv,0,112,36,0.5,0.5,0,c_white,1);
	}
	else if (selected_attack.defender_advantage_mult == -1)
	{
		draw_sprite_ext(weapondisadv,0,112,36,0.5,0.5,0,c_white,1);
	}
	if (selected_attack.attacker_advantage_mult == 1)
	{
		draw_sprite_ext(weaponadv,0,107,134,0.5,0.5,0,c_white,1);
	}
	else if (selected_attack.attacker_advantage_mult == -1)
	{
		draw_sprite_ext(weapondisadv,0,107,134,0.5,0.5,0,c_white,1);
	}
	
	//double	
	//draw_set_font(fnt_courier_6);
	if (selected_attack.attacker_double == true)
	{
		draw_set_halign(fa_left);
		scr_draw_txt_border(88 + (sin((current_time+500) /300 )*3),14 + op_space * 4 + (sin(current_time /300 )*2), "x2",c_black,c_red);
	}
	if (selected_attack.defender_double == true)
	{
		draw_set_halign(fa_left);
		scr_draw_txt_border(106 + (sin((current_time+500) /300 )*3),14 + op_space * 4 + (sin(current_time /300 )*2), "x2",c_black,c_red);
	}
	draw_set_halign(fa_left);
}