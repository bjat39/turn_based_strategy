/// @description 
obj_game.player_state = "cursor_menu";
//attacker = noone;
//defender = noone;

attack_data = noone;

attack_timer = 30;

attack = noone;

state = "initialise";//"begin_attack";

attack_rounds = [];

current_round = 0;

kill_confirm = noone;

zoom_blur = layer_get_fx("Zoom_blur");

zoom_mult = 0;
//zoom_blur = fx_create("filter_zoom_blur");

//obj_cursor.visible = false;
//obj_cursor_back.visible = false;

//obj_cursor.x = (attack_data.attacker1.x + attack_data.defender1.x)/2;
//obj_cursor.y = (attack_data.attacker1.y + attack_data.defender1.y)/2;