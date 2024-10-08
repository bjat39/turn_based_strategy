// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_calculate_dist(){
	var dist1, dist2, dist3, dist4, nearest_attack_square;//, dist5, dist6, dist7, dist8, nearest_attack_square;
	
	nearest_attack_square = instance_nearest(mouse_x,mouse_y,obj_attack_square);
	
	//check to left, right etc of attack square we found
	//trying to find out where attack square is
	if (instance_position(nearest_attack_square.x-global.cell_size,nearest_attack_square.y,obj_move_square)) {dist1 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x-global.cell_size,nearest_attack_square.y);}
	else {dist1 = 10000;}
	if (instance_position(nearest_attack_square.x+global.cell_size,nearest_attack_square.y,obj_move_square)) {dist2 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x+global.cell_size,nearest_attack_square.y);}
	else {dist2 = 10000;}
	if (instance_position(nearest_attack_square.x,nearest_attack_square.y-global.cell_size,obj_move_square)) {dist3 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x,nearest_attack_square.y-global.cell_size);}
	else {dist3 = 10000;}
	if (instance_position(nearest_attack_square.x,nearest_attack_square.y+global.cell_size,obj_move_square)) {dist4 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x,nearest_attack_square.y+global.cell_size);}
	else {dist4 = 10000;}
	//Diagonals
	//if (instance_position(nearest_attack_square.x-32,nearest_attack_square.y-32,obj_move_square)) {dist5 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x-32,nearest_attack_square.y-32);}
	//else {dist5 = 10000;}
	//if (instance_position(nearest_attack_square.x-32,nearest_attack_square.y+32,obj_move_square)) {dist6 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x-32,nearest_attack_square.y+32);}
	//else {dist6 = 10000;}
	//if (instance_position(nearest_attack_square.x+32,nearest_attack_square.y-32,obj_move_square)) {dist7 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x+32,nearest_attack_square.y-32);}
	//else {dist7 = 10000;}
	//if (instance_position(nearest_attack_square.x+32,nearest_attack_square.y+32,obj_move_square)) {dist8 = point_distance(global.selected.x,global.selected.y,nearest_attack_square.x+32,nearest_attack_square.y+32);}
	//else {dist8 = 10000;}
	
	dest = min(dist1,dist2,dist3,dist4)//,dist5,dist6,dist7,dist8); //Picks out the smallest number
	
	if (dest == dist1) //Go here
	{
		global.attack_travel_x = nearest_attack_square.x-global.cell_size;
		global.attack_travel_y = nearest_attack_square.y;
	}
	else if (dest == dist2)
	{
		global.attack_travel_x = nearest_attack_square.x+global.cell_size;
		global.attack_travel_y = nearest_attack_square.y;
	}
	else if (dest == dist3)
	{
		global.attack_travel_x = nearest_attack_square.x;
		global.attack_travel_y = nearest_attack_square.y-global.cell_size;
	}
	else if (dest == dist4)
	{
		global.attack_travel_x = nearest_attack_square.x;
		global.attack_travel_y = nearest_attack_square.y+global.cell_size;
	}
}
//	else if (dest == dist5)
//	{
//		global.attack_travel_x = nearest_attack_square.x-32;
//		global.attack_travel_y = nearest_attack_square.y-32;
//	}
//	else if (dest == dist6)
//	{
//		global.attack_travel_x = nearest_attack_square.x-32;
//		global.attack_travel_y = nearest_attack_square.y+32;
//	}
//	else if (dest == dist7)
//	{
//		global.attack_travel_x = nearest_attack_square.x+32;
//		global.attack_travel_y = nearest_attack_square.y-32;
//	}
//	else if (dest == dist8)
//	{
//		global.attack_travel_x = nearest_attack_square.x+32;
//		global.attack_travel_y = nearest_attack_square.y+32;
//	}
//}