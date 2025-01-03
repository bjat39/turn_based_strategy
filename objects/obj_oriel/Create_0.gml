/// @description 
event_inherited(); //do the parent's inherited create event, then our create event

actor_name = "Oriel";

faction = "neft";//"player"; //what side they are affliliated with, affects turn order
class = "Crossbowman";
description = "An asocial Alenetian old man.\nHas a nasty disease.";

//Base stats
move = 8//6;

attack_range = 8 * GRID_SIZE; //placeholder set later in create
attack_target = noone;
attack_timer = 0;
damage_type = "bow" //Weapon triangle

level = 1;

max_hit_points = 30;
current_hit_points = max_hit_points;

strength_stat = 28; //20
magic_stat = noone; //only for mages, instead of strength
marksman_stat = 18; //affects hit rate, useless for melee
speed_stat = 13; //affects evasion, if unit has +5 more speed than enemy, double attack
defence_stat = 18;
resistance_stat = 9; //magic defense
luck_stat = 14; //affect hit and evasion (+1 to percentages)

//attack_range = 8 * GRID_SIZE;//marksman_stat / 4;

//Growth rate percentage chance (%) per level up
max_hit_points_growth = 85;
strength_growth = 55;
magic_growth = noone;
marksman_growth = 40;
speed_growth = 45;
defence_growth = 40;
resistance_growth = 25; //magic defense
luck_growth = 45;