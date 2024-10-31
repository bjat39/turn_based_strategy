/// @description 
width = 124;
height = 104;

op_border = 16; //border between text and edge
op_space = 16; //y distance between options

pos = 0; //select option

//with(par_actor)
//{
//	x_dist = point_distance(x, y, other.x, y); //would have measuring to the center but it dont
//	y_dist = point_distance(x, y, x, other.y);
//	total_dist = x_dist + y_dist; //
//	if (total_dist <= other.attack_range)//temp_actor.attack_range)
//	{
//		if (other.faction != faction)
//		{
//			map[gridX,gridY].attack_node = true;
//			//if (ds_list_find_index(other.command_list,"Attack") == noone)
//			//{
//				ds_list_add(other.command_list, "Attack");
//				ds_list_add(other.attack_list,map[gridX,gridY]);
//			//}
//			//selected_actor.attack_node = true;
//			scr_colour_attack_node(id);
//		}
//	}
//}
	
////obj_game.selected_actor

//ds_list_add(other.command_list, "Wait");



//two dimensional array for sub menus, which set of options
//Pause menu
option[0, 0] = "Start Game";
option[0, 1] = "Settings";
option[0, 2] = "Quit Game";

//settings menu, sub menu
option[1, 0] = "Window Size";
option[1, 1] = "Brightness";
option[1, 2] = "Controls";

op_length = 0;
menu_level = 0;