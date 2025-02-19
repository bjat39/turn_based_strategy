/// @description 
//Draw menu background
//var new_w = 0; //new width
//for (var i = 0; i < op_length;i++)
//{
//	var op_w = string_width(option[menu_level,i]);
//	new_w = max(new_w,op_w);
//}

//width = new_w + op_border * 2;
//height = op_border * 2 + string_height(option[0,0]) + (op_length - 1) * op_space;

draw_sprite_ext(stat_screen_back,0,background_x_1,0,1,1,0,c_white,1);
draw_sprite_ext(stat_screen_back,0,background_x_2,0,1,1,0,c_white,1);

//stat box
draw_sprite_ext(spr_index,0,40,45,4.25,0.75,0,c_white,1);
//ability and trait box
draw_sprite_ext(spr_index,0,40,80,4.25,0.75,0,c_white,1);
//inventory box
draw_sprite_ext(spr_index,0,40,120,4.25,1,0,c_white,1); 
//portrait box
draw_sprite_ext(spr_index,0,225,60,1.75,2.5,0,c_white,1);

draw_sprite_ext(por,0,260,159,1,1,0,c_white,1);

draw_sprite_ext(curr_actor.hover_anim,0,250,43,-1,1,0,c_white,1);

draw_healthbar(220,20,290,30,curr_actor.current_hit_points/curr_actor.max_hit_points * 100,c_black,c_red,c_yellow,1,true,true);

scr_draw_txt_border(230,20,"HP: " + string(curr_actor.current_hit_points) + " / " + string(curr_actor.max_hit_points),c_black,c_white);
scr_draw_txt_border(260,31,"Lvl: " + string(curr_actor.level_bar),c_black,c_white);
scr_draw_txt_border(258,42,"Exp: " + string(curr_actor.experience_points),c_black,c_white);

scr_draw_txt_border(245,65,string(curr_actor.actor_name),c_black,c_light_yellow);


draw_set_font(fnt_newfont);
scr_draw_txt_border(35,15,"Personal Information",c_black,c_yellow);
//draw_text_colour(50,15,"Personal Information", c_white, c_white, c_white, c_white, 1);
//draw_text_colour(50,65,"Inventory", c_white, c_white, c_white, c_white, 1);

draw_set_font(fnt_courier);
if (curr_actor.damage_type != "magic")
{
	scr_draw_txt_border(155,50,"Str: ",c_black,c_light_yellow);
	scr_draw_txt_border(190,50,string(curr_actor.strength_stat),c_black,c_white);
}
else{
	scr_draw_txt_border(155,50,"Mag: ",c_black,c_light_yellow);
	scr_draw_txt_border(190,50,string(curr_actor.magic_stat),c_black,c_white);
}
scr_draw_txt_border(155,61,"Lck: ",c_black,c_light_yellow);
scr_draw_txt_border(190,61,string(curr_actor.luck_stat),c_black,c_white);
scr_draw_txt_border(98,50,"Skill: ",c_black,c_light_yellow);
scr_draw_txt_border(133,50,string(curr_actor.skill_stat),c_black,c_white);
scr_draw_txt_border(98,61,"Spd: ",c_black,c_light_yellow);
scr_draw_txt_border(133,61,string(curr_actor.skill_stat),c_black,c_white);
scr_draw_txt_border(50,50,"Def: ",c_black,c_light_yellow);
scr_draw_txt_border(75,50,string(curr_actor.defence_stat),c_black,c_white);
scr_draw_txt_border(50,61,"Res: ",c_black,c_light_yellow);
scr_draw_txt_border(75,61,string(curr_actor.resistance_stat),c_black,c_white);

for (ii = 0; ii < ds_list_size(curr_actor.ability_list);ii++){
scr_draw_txt_border(50,85 + ii * 4,ds_list_find_value(curr_actor.ability_list,ii),c_black,c_purple);}

for (ii = 0; ii < ds_list_size(curr_actor.trait_list);ii++){
draw_sprite_ext(empty_icon,0,220 + ii * 4,45,1,1,0,c_white,1);}
//draw_text_colour(55,50,"Str: " + string(curr_actor.strength_stat), c_white, c_white, c_white, c_white, 1);
//draw_text_colour(55,60,"Mag: " + string(curr_actor.magic_stat), c_white, c_white, c_white, c_white, 1);

//Draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//for (var i = 0; i < op_length;i++)
//{
//	var col = c_white;
//	if (pos == i){col = c_yellow;}
//	draw_text_colour(x+op_border,y+op_border + op_space * i,option[menu_level,i], col, col, col, col, 1);
//}