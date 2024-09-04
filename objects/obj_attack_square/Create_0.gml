/// @description 
depth = -1;
//my_owner = instance_nearest(x,y,par_enemy);
//global.enemy = my_owner;


if (global.selected.attacked == false) //if haven't moved
{
	if (instance_position(x,y,par_enemy)) 
	{//avoid duplicate attack squares layered onto one position
		if (!instance_position(x,y,obj_attack_square))
		{
			instance_create_layer(x,y,"Instances",obj_attack_square);
			global.selected.attack_pixel_dist -= global.cell_size;
		}
	}
}