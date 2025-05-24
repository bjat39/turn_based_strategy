/// @description 
event_inherited(); //do the parent's inherited create event, then our create event

actor_name = "Talia";

faction = "neft"
class = "Healer Woman";
description = "Boring";

//Base stats
move = 5; //5

//PLACEHOLDER NO ABILITIES YET
ds_list_add(inventory_list,global.items[0]);

equipped_weapon = ds_list_find_value(inventory_list,0); //placeholder

attack_range = equipped_weapon.upperrange * GRID_SIZE; //placeholder set later in create
attack_range_real = equipped_weapon.upperrange;

attack_target = noone;
attack_timer = 0;
damage_type = "melee" //Weapon triangle

idle_anim = spr_echo_talia;
hover_anim = spr_echo_talia;
run_anim = spr_echo_talia;
attack_anim = spr_talia_attack;
defend_anim = spr_echo_talia;
crit_anim = spr_echo_talia;

portrait = neft_pixel;

level = 1;

max_hit_points = 20;
current_hit_points = max_hit_points;

strength_stat = 7;
magic_stat = noone; //only for mages, instead of strength
skill_stat = 2; //affects hit rate, useless for melee
speed_stat = 3; //affects evasion, if unit has +5 more speed than enemy, double attack
defence_stat = 4;
resistance_stat = 1; //magic defense
luck_stat = 1; //affect hit and evasion (+1 to percentages)

//attack_range = 1 * GRID_SIZE;//skill_stat / 4;

//Growth rate percentage chance (%) per level up
max_hit_points_growth = 85;
strength_growth = 55;
magic_growth = noone;
skill_growth = noone;
speed_growth = 60;
defence_growth = 55;
resistance_growth = 25; //magic defense
luck_growth = 45;