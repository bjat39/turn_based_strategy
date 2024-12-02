/// @description 
event_inherited(); //do the parent's inherited create event, then our create event

actor_name = "Talia";

faction = "neft"
class = "Healer Woman";
description = "A spirited Alenetian woman.\nA bit of a doormat, somehow.";

//Base stats
move = 5;

attack_range = 1 * GRID_SIZE; //placeholder set later in create
attack_target = noone;
attack_timer = 0;
damage_type = "melee" //Weapon triangle

level = 1;

max_hit_points = 20;
current_hit_points = max_hit_points;

strength_stat = 7;
magic_stat = noone; //only for mages, instead of strength
marksman_stat = 2; //affects hit rate, useless for melee
speed_stat = 3; //affects evasion, if unit has +5 more speed than enemy, double attack
defence_stat = 4;
resistance_stat = 1; //magic defense
luck_stat = 1; //affect hit and evasion (+1 to percentages)

//attack_range = 1 * GRID_SIZE;//marksman_stat / 4;

//Growth rate percentage chance (%) per level up
max_hit_points_growth = 85;
strength_growth = 55;
magic_growth = noone;
marksman_growth = noone;
speed_growth = 60;
defence_growth = 55;
resistance_growth = 25; //magic defense
luck_growth = 45;