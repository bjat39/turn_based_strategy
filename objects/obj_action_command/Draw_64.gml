/// @description 
if (menu_level == 2)
{
	draw_set_font(fnt_courier_5);
	
	draw_set_halign(fa_left);
	scr_draw_txt_border(90,30 + op_space * 1, selected_attack.defender1.actor_name,c_black,c_light_purple);
	scr_draw_txt_border(90,30 + op_space * 2, selected_attack.defender_weapon.name1,c_black,c_light_purple);
	scr_draw_txt_border(90,30 + op_space * 3, selected_attack.defender_hp,c_black,c_light_purple);
	scr_draw_txt_border(90,30 + op_space * 4, selected_attack.defender_damage,c_black,c_light_purple);
	scr_draw_txt_border(90,30 + op_space * 5, selected_attack.defender_hit,c_black,c_light_purple);
	scr_draw_txt_border(90,30 + op_space * 6 , selected_attack.defender_crit,c_black,c_light_purple);
	
	draw_set_halign(fa_right);
	scr_draw_txt_border(80,30 + op_space * 1, selected_attack.attacker1.actor_name,c_black,c_light_purple);
	scr_draw_txt_border(80,30 + op_space * 2, selected_attack.attacker_weapon.name1,c_black,c_light_purple);
	scr_draw_txt_border(80,30 + op_space * 3, selected_attack.attacker_hp,c_black,c_light_purple);
	scr_draw_txt_border(80,30 + op_space * 4, selected_attack.attacker_damage,c_black,c_light_purple);
	scr_draw_txt_border(80,30 + op_space * 5, selected_attack.attacker_hit,c_black,c_light_purple);
	scr_draw_txt_border(80,30 + op_space * 6 , selected_attack.attacker_crit,c_black,c_light_purple);
	
	draw_set_halign(fa_center);
	
	if (selected_attack.attacker_advantage_mult == 1)
	{
		draw_sprite_ext(weaponadv,0,50,60,0.5,0.5,0,c_white,1);
	}
}