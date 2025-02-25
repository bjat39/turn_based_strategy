/// @description 
if (menu_level == 2)
{
	draw_set_font(fnt_courier_5);
	scr_draw_txt_border(30,30 + op_space * 1, selected_attack.attacker1.actor_name,c_black,c_light_purple);
	scr_draw_txt_border(30,30 + op_space * 2, selected_attack.attacker_hp,c_black,c_light_purple);
	scr_draw_txt_border(30,30 + op_space * 3, selected_attack.attacker_damage,c_black,c_light_purple);
	scr_draw_txt_border(30,30 + op_space * 4, selected_attack.attacker_hit,c_black,c_light_purple);
	scr_draw_txt_border(30,30 + op_space * 5 , selected_attack.attacker_crit,c_black,c_light_purple);
}