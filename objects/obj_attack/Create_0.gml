/// @description  Rework into a script
//miss hit //or crit or kill?
status = "miss";

//damage and damage type
damage = 0;
damage_type = "melee"

//who the attack is targeting
target = noone;

//who made the attack
owner = noone;

//path info
movement_path = path_add();
path_set_closed(movement_path,false);
path_set_kind(movement_path,2);