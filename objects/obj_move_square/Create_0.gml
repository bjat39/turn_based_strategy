/// @description Create attack squares, check all around the move square, 32 is distance between move squares
if (global.selected.attacked == false) //if haven't moved
{
	if (instance_position(x+global.cell_size,y,par_enemy)) 
	{//avoid duplicate attack squares layered onto one position
		if (!instance_position(x+global.cell_size,y,obj_attack_square)){instance_create_layer(x+global.cell_size,y,"Instances",obj_attack_square);}
	}
	if (instance_position(x-global.cell_size,y,par_enemy)) 
	{
		if (!instance_position(x-global.cell_size,y,obj_attack_square)){instance_create_layer(x-global.cell_size,y,"Instances",obj_attack_square);}
	}
	if (instance_position(x,y-global.cell_size,par_enemy)) 
	{
		if (!instance_position(x,y-global.cell_size,obj_attack_square)){instance_create_layer(x,y-global.cell_size,"Instances",obj_attack_square);}
	}
	if (instance_position(x,y+global.cell_size,par_enemy)) 
	{
		if (!instance_position(x,y+global.cell_size,obj_attack_square)){instance_create_layer(x,y+global.cell_size,"Instances",obj_attack_square);}
	}
}
//Diagonals
//if (instance_position(x+32,y+32,par_enemy)) {instance_create_layer(x+32,y+32,"Instances",obj_attack_square);}
//if (instance_position(x+32,y-32,par_enemy)) {instance_create_layer(x+32,y-32,"Instances",obj_attack_square);}
//if (instance_position(x-32,y+32,par_enemy)) {instance_create_layer(x-32,y+32,"Instances",obj_attack_square);}
//if (instance_position(x-32,y-32,par_enemy)) {instance_create_layer(x-32,y-32,"Instances",obj_attack_square);}