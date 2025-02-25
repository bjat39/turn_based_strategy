/// @description 
event_inherited(); //do the parent's inherited create event, then our create event

actor_name = "Funt";

class = "Infantryman";

//Base stats
move = 2;

level = 1;

ds_list_add(inventory_list,global.items[14]);

equipped_weapon = ds_list_find_value(inventory_list,0);


attack_range = 5 * GRID_SIZE;//1 * GRID_SIZE;//skill_stat / 4;
attack_range_real = 5;
attack_target = noone;
attack_timer = 0;
damage_type = "melee" //Weapon triangle

max_hit_points = 20;
current_hit_points = max_hit_points;

strength_stat = 7;
magic_stat = noone; //only for mages, instead of strength
skill_stat = noone; //affects hit rate, useless for melee
speed_stat = 8; //affects evasion, if unit has +5 more speed than enemy, double attack
defence_stat = 3;
resistance_stat = 1; //magic defense
luck_stat = 0; //affect hit and evasion (+1 to percentages)

//Growth rate percentage chance (%) per level up
max_hit_points_growth = 85;
strength_growth = 55;
magic_growth = noone;
skill_growth = noone;
speed_growth = 60;
defence_growth = 45;
resistance_growth = 25; //magic defense
luck_growth = 45;