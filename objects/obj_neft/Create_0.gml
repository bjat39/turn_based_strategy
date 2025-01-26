/// @description 
event_inherited(); //do the parent's inherited create event, then our create event

actor_name = "Neft";

faction = "neft";
class = "Mage";
description = "That's me.";//\nA distant young girl."

//Base stats
move = 6; //5 or 7? more move means maps over quicker

attack_range = 2 * GRID_SIZE; //placeholder set later in create
attack_target = noone;
attack_timer = 0;
damage_type = "magic"; //Weapon triangle

ds_list_add(ability_list,"Overcharge");//+1 range,+6damage,+20%hitrate

level = 1;

max_hit_points = 16;
current_hit_points = max_hit_points;

strength_stat = 3;
magic_stat = noone; //only for mages, instead of strength
marksman_stat = 2; //affects hit rate, useless for melee
speed_stat = 2; //affects evasion, if unit has +5 more speed than enemy, double attack
defence_stat = 0;
resistance_stat = 2; //magic defense
luck_stat = 8; //affect hit and evasion (+1 to percentages)

//attack_range = 3 * GRID_SIZE;//marksman_stat / 4;

//Growth rate percentage chance (%) per level up
max_hit_points_growth = 85;
strength_growth = 60;
magic_growth = noone;
marksman_growth = 55;
speed_growth = 60;
defence_growth = 45;
resistance_growth = 50; //magic defense
luck_growth = 55;