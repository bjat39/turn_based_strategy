/// @description Global variables

global.state = STATES.P_TURN;
global.selected = noone; //id of who is selected
global.enemy = noone; //enemy id

global.moving = false;
global.attacking = false;

global.ai_selected = noone; //ai selected
global.ai_id = 1;
global.ai_activated = false; //unit able to move

global.damage_dealt = 0;

//Loops vars - check the entire grid
row = 128;