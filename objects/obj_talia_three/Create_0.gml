/// @description 
event_inherited(); //do the parent's inherited create event, then our create event

actor_name = "Talia Three";

faction = "neft";//"player"; //what side they are affliliated with, affects turn order
description = "An antisocial Alenetian old man.\nHas a nasty disease.";

//Base stats
move = 6;

level = 1;

max_hit_points = 20;
current_hit_points = max_hit_points;

strength_stat = 7;
magic_stat = noone; //only for mages, instead of strength
marksman_stat = noone; //affects hit rate, useless for melee
speed_stat = 8; //affects evasion, if unit has +5 more speed than enemy, double attack
defence_stat = 7;
resistance_stat = 1; //magic defense
luck_stat = 0; //affect hit and evasion (+1 to percentages)

attack_range = 8;//marksman_stat / 4;

//Growth rate percentage chance (%) per level up
max_hit_points_growth = 85;
strength_growth = 55;
magic_growth = noone;
marksman_growth = noone;
speed_growth = 60;
defence_growth = 45;
resistance_growth = 25; //magic defense
luck_growth = 45;