/// @description Edit par_actor so it's more generic, can have enemies use it
state = "idle";

gridX = 0;
gridY = 0;

actor_name = "error";

//actions = 2; //get rid of this eventually? slowly phase out

//proper action variables
moved = false;
attacked = false; //only attack once a turn

//variables related to pathing
//create path data structure
movement_path = path_add(); //FUCK YES I REALISE I CAN REUSE SOME mp_grid CODEEEEEE
path_set_kind(movement_path,2); //type 2 is straight line path, type 1 is curved lines
path_set_closed(movement_path,false); //determines whether a path is open/closed, closed would go to each point and return to beginning, good for patrols but we don't want that

move_speed = 8; //how fast unit moves between squares

current_node = obj_game.hoverNode;

//character statistics

ai_type = "player";

faction = "neft";//"player"; //what side they are affliliated with, affects turn order
class = "Healer Woman";
description = "Fuggedaboutit";

command_list = ds_list_create(); //after move, unit commands
hover_command = 0;

attack_list = ds_list_create(); //list of viable attack nodes to attack

//Base stats
move = 5;

attack_range = 0 * GRID_SIZE; //placeholder set later in create. in pixels
attack_target = noone;
attack_timer = 0;
damage_type = "melee"; //Weapon triangle

level = 1;
experience_points = 0;

max_hit_points = 1;
current_hit_points = max_hit_points;

strength_stat = 0;
magic_stat = 0; //only for mages, instead of strength
marksman_stat = 0; //affects hit rate, useless for melee (used to be skill) (range? how much range until it falls off.) 
//(+3 points = 1 tile can be hit for sure? but i kind of want accuracy to fall off slowly tho) (total range stat to make it easy to see? make it hard to get one tile of guarantee) (so +4 to get one tile?)
speed_stat = 0; //affects evasion, if unit has +5 more speed than enemy, double attack
defence_stat = 0;
resistance_stat = 0; //magic defense
luck_stat = 0; //affect hit and evasion (+1 to percentages)

attack_range = 2 * GRID_SIZE;//marksman_stat / 4;

//Growth rate percentage chance (%) per level up
max_hit_points_growth = 100;
strength_growth = 100;
magic_growth = 0;
marksman_growth = 0;
speed_growth = 50;
defence_growth = 85;
resistance_growth = 0; //magic defense
luck_growth = 0;