/// @description 
width = 124;
height = 104;

op_border = 16; //border between text and edge
op_space = 16; //y distance between options

pos = 0; //select option
prev_pos_1 = pos;
prev_pos_2 = prev_pos_1;
command_list = ds_list_create(); //after move, unit commands

curr_actor = obj_game.selected_actor;
delete_box = false;
soft_reset = false; //if player cancels, still can move unit
attack_square_spawn = false;

hover_command = ds_list_find_value(command_list,pos);

attack_list = ds_list_create(); //list of viable attack nodes to attack

skip_enemy_select = false;

forecast_box_displacement = 75;

attack_pos = 0;
attack_command = false;

selected_attack = noone;

c_light_purple = make_color_rgb(237,201,239);
c_light_yellow = make_color_rgb(239,239,151);

if(curr_actor.damage_type == "bow") //BOWMAN CAN'T SHOOT TWO SPACES BEFORE HIM
{
	with(par_actor)
	{
		x_dist = point_distance(x, y, other.curr_actor.x, y); //would have measuring to the center but it dont
		y_dist = point_distance(x, y, x, other.curr_actor.y);
		total_dist = x_dist + y_dist; //
		if (total_dist <= other.curr_actor.attack_range and total_dist > 2 * GRID_SIZE)//temp_actor.attack_range)
		{
			if (other.curr_actor.faction != faction)
			{
				//map[gridX,gridY].attack_node = true;
				//if (ds_list_find_index(other.command_list,"Attack") == noone)
				//{
				if (other.attack_command == false)
				{
					ds_list_add(other.command_list, "Attack");
					other.attack_command = true;
				}
				var attack = scr_get_full_attack_info(other.curr_actor, map[gridX,gridY].occupant)
				ds_list_add(other.attack_list,attack);
				//}
				//selected_actor.attack_node = true;
				scr_colour_attack_node(id);
			}
		}
	}
}
else
{
	with(par_actor)
	{
		x_dist = point_distance(x, y, other.curr_actor.x, y); //would have measuring to the center but it dont
		y_dist = point_distance(x, y, x, other.curr_actor.y);
		total_dist = x_dist + y_dist; //
		if (total_dist <= other.curr_actor.attack_range)//temp_actor.attack_range)
		{
			if (other.curr_actor.faction != faction)
			{
				//map[gridX,gridY].attack_node = true;
				//if (ds_list_find_index(other.command_list,"Attack") == noone)
				//{
				if (other.attack_command == false)
				{
					ds_list_add(other.command_list, "Attack");
					other.attack_command = true;
				}
				var attack = scr_get_full_attack_info(other.curr_actor,map[gridX,gridY].occupant)
				ds_list_add(other.attack_list,attack);
				//}
				//selected_actor.attack_node = true;
				scr_colour_attack_node(id);
			}
		}
	}
}
	
//obj_game.selected_actor

ds_list_add(other.command_list, "Wait");



//two dimensional array for sub menus, which set of options
//Pause menu
for(ii = 0; ii < ds_list_size(command_list);ii++)
{
	switch(ds_list_find_value(command_list,ii))
	{
		case("Attack"):
		option[0, ii] = "Attack";
		for(jj = 0; jj < ds_list_size(attack_list);jj++)
		{
			option[1, jj] = ds_list_find_value(attack_list,jj);
		}
		
		break;
		case("Wait"):
		option[0, ii] = "Wait";
		break;
	}
}

for(ii = 0; ii < ds_list_size(command_list);ii++)
{
	option[2, 0] = curr_actor.equipped_weapon;
}

////settings menu, sub menu
//option[1, 0] = "Window Size";
//option[1, 1] = "Brightness";
//option[1, 2] = "Controls";

op_length = 0; //option length
menu_level = 0; //how deep we are in sub menus