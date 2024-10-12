/// @description 
state = "idle";

gridX = 0;
gridY = 0;

actor_name = "error";

//character statistics

move = 5;

actions = 2; //get rid of this eventually?

//variables related to pathing
//create path data structure
movement_path = path_add(); //FUCK YES I REALISE I CAN REUSE SOME mp_grid CODEEEEEE
path_set_kind(movement_path,2); //type 2 is straight line path, type 1 is curved lines
path_set_closed(movement_path,false); //determines whether a path is open/closed, closed would go to each point and return to beginning, good for patrols but we don't want that

move_speed = 8; //how fast unit moves between squares