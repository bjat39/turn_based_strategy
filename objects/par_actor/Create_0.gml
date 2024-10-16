/// @description Edit par_actor so it's more generic, can have enemies use it
state = "idle";

gridX = 0;
gridY = 0;

actor_name = "error";

//character statistics

move = 5;

actions = 2; //get rid of this eventually? slowly phase out

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