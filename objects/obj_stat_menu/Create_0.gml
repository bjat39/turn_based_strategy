/// @description 
event_inherited();
width = obj_camera1.camW;
height = obj_camera1.camH;

curr_actor = obj_game.hoverNode.occupant;
por = curr_actor.portrait;

spr_index = spr_nine_slice;

op_border = 16; //border between text and edge
op_space = 16; //y distance between options

pos = 0; //select option
prev_pos = pos;
	
//two dimensional array for sub menus, which set of options
//Pause menu
option[0, 0] = "Status";
option[0, 1] = "Settings";
option[0, 2] = "Suspend Game";
option[0, 3] = "End Turn";

//settings menu, sub menu
option[1, 0] = "Window Size";
option[1, 1] = "Brightness";
option[1, 2] = "Controls";

op_length = 0;
menu_level = 0;