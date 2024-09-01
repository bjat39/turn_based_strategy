// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_ai_turn(){
	if (instance_number(par_player) < 1){global.state = STATES.FAIL_STATE} //game over
	
	if (global.ai_selected == noone)
	{
		if (global.ai_activated == false)
		{
			ai_active = instance_number(par_enemy) - global.ai_id; //gets how many enemies there are - ai_id
			global.ai_selected = instance_find(par_enemy,ai_active); //selects the ai_active
			
			scr_place_move_squares_ai(); //might remove? or make transparent
			global.ai_activated = true;
		}
	}
	
	with (global.ai_selected)
	{//go to unit and attack if possible
		if (global.ai_activated == true)
		{
			nearest_target = instance_nearest(x,y,par_player); //find closest target
			nearest_move = instance_nearest(nearest_target.x,nearest_target.y,obj_move_square_ai);
			nearest_attack = instance_nearest(x,y,obj_attack_square_ai);
			
			if (type == 1) //melee
			{
				if (moved == false)
				{
					sprite_index = run_anim;
					scr_navigation(x,y,round(nearest_move.x/global.cell_size)*global.cell_size,round(nearest_move.y/32)*32,pace); //rounding, div and times gives cell as whole number
				}
				if (path_index == -1)//if path is finished
				{
					if (moved == false){sprite_index = idle_anim}
					moved = true;
					if (instance_exists(obj_attack_square_ai)){global.enemy = instance_position(nearest_attack.x,nearest_attack.y,par_player);}
					if (global.enemy != noone){scr_melee_attack_ai();}
					else {attacked = true} //even if we didn't attack we're still setting it to true
					with (obj_move_square_ai){instance_destroy();} //delete all move squares
					cur_node_x = round(x/global.cell_size)*global.cell_size;
					cur_node_y = round(y/global.cell_size)*global.cell_size;
					
					if (attacked == true && moved == true) //go to next ai
					{
						global.enemy = noone;
						global.ai_id += 1;
						global.ai_selected = noone;
						global.ai_activated = false;
					}
				}
			}
			else if (type == 2)
			{
				if (acquired_targets == false)
				{
					with (par_player)
					{
						if (distance_to_object(global.ai_selected) <= 130) {instance_create_layer(x,y,"Instances",obj_attack_square_ai);}
					}
					nearest_attack = instance_nearest(x,y,obj_attack_square_ai);
					acquired_targets = true;
				}
				if (instance_exists(obj_attack_square_ai))
				{
					global.enemy = instance_position(nearest_attack.x,nearest_attack.y,par_player); //player under attack will be the global.enemy
					sprite_index = attack_anim;
					moved = true; //hasn't moved yet but needs to move to next character
					scr_ranged_attack_ai();
				}
				else if (!instance_exists(obj_attack_square_ai))
				{
					attacked = true; //didn't attack but need to fufill criteria to next character
					if (moved == false)
					{
						sprite_index = run_anim;
						scr_navigation(x,y,round(nearest_move.x/global.cell_size)*global.cell_size,round(nearest_move.y/global.cell_size)*global.cell_size,pace);
					}
				}
				if (path_index == -1)//if path is finished, find path
				{
					if (moved == false){sprite_index = idle_anim}
					moved = true;
					cur_node_x = round(x/global.cell_size)*global.cell_size;
					cur_node_y = round(y/global.cell_size)*global.cell_size;
					with (obj_move_square_ai){instance_destroy();} //delete all move squares
					
					if (attacked == true && moved == true) //go to next ai
					{
						global.enemy = noone;
						global.ai_id += 1;
						global.ai_selected = noone;
						global.ai_activated = false;
					}
				}
			}
		}
	}
	
	if (global.ai_id > instance_number(par_enemy))
	{
		global.state = STATES.P_TURN;
		global.ai_selected = noone;
		global.ai_id = 1;
		with (par_enemy)
		{
			attacked = false;
			moved = false;
			aquired_targets = false;
		}
	}
}