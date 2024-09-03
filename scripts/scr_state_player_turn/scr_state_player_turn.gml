// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_player_turn(){
	if (instance_position(mouse_x,mouse_y,par_player) && mouse_check_button_pressed(mb_left))
	{
		if (global.moving == false && global.attacking == false) //checks if player is not clicking while in attack anim
		{
			var player;
			player = instance_nearest(mouse_x,mouse_y,par_player);
		
			global.selected = player;
			
			orig_node_x = x; //remember original position
			orig_node_y = y;
		
			with (obj_move_square){instance_destroy();}
			with (obj_attack_square) {instance_destroy();}
		
			if (player.type = 2)
			{
				if (player.attacked == false)
				{
					with (par_enemy)
					{  //130 = five square-ish range
						if (distance_to_object(global.selected) <= 130){instance_create_layer(x,y,"Instances",obj_attack_square);}
						
						//path_
						//scr_navigation(x,y,round(mouse_x / global.cell_size) * global.cell_size,round(mouse_y/global.cell_size)*global.cell_size,pace); //current object's x and y
						//pixel_dist -= path_get_length(global.navigate); //Take off distance, might want to remove this
					}
				}
			}
			
			scr_place_attack_squares();
			scr_place_move_squares();

		}
	}
	else if (instance_position(mouse_x,mouse_y,par_player) && mouse_check_button_pressed(mb_left))
	{
		if (global.moving == false && global.attacking == false) //checks if player is not clicking while in attack anim
		{
			global.selected = noone;
			with (obj_move_square) {instance_destroy();}
			with (obj_attack_square) {instance_destroy();}
		}
	}
	
	if (global.selected != noone && mouse_check_button_pressed(mb_right))
	{
		if (instance_position(mouse_x,mouse_y,obj_move_square)) //if mouse on movesquare
		{
			global.moving = true; //Moving
			with (obj_move_square) {instance_destroy();}
			with (obj_attack_square) {instance_destroy();}
			with (global.selected)
			{
				sprite_index = run_anim;
				scr_navigation(x,y,round(mouse_x / global.cell_size) * global.cell_size,round(mouse_y/global.cell_size)*global.cell_size,pace); //current object's x and y
				pixel_dist -= path_get_length(global.navigate); //Take off distance, might want to remove this
			}
		}
		else if (instance_position(mouse_x,mouse_y,obj_attack_square)) //Attack
		{/////////////////////////////SPAWNS ATTACK SQUARE, BUT THEN DOESN'T CHECK IF IT'S A CARDINAL DIRECTION
			global.enemy = instance_position(mouse_x,mouse_y,par_enemy);
			global.attacking = true;
			with (global.selected)
			{
				attacked = true;
				if (type == 1) //melee attack
				{
					if (distance_to_object(global.enemy) > 13)//obj_attack_square) > 13) /////add checks for cardinal directions? or maybe we need to check how it navigates
					{
						global.moving = true;
						scr_calculate_dist(); 
						sprite_index = run_anim;
						scr_navigation(x,y,round(global.attack_travel_x/global.cell_size)*global.cell_size,round(global.attack_travel_y/global.cell_size)*global.cell_size,pace); //go to closest move square
						pixel_dist -= path_get_length(global.navigate); //take away movement points
					}
				}
				else if (type == 2) //ranged unit
				{
					if (global.enemy.x < x - 5){image_xscale = -1} //if enemy is to the right
					sprite_index = attack_anim;
					image_index = 0;
				}
			}
			with (obj_move_square) {instance_destroy();}
			with (obj_attack_square) {instance_destroy();}
		}
	}
	
	if (global.moving == true)
	{
		with (global.selected)
		{
			if (path_index == -1) //finished moving
			{
				sprite_index = idle_anim;
				cur_node_x = x;
				cur_node_y = y;
				global.moving = false;
			}
		}
	}
	
	if (global.attacking == true)
	{
		if (global.moving == false)
		{
			with (global.selected) 
			{
				if (type == 1) {scr_melee_attack();}
				else if (type == 2) {scr_ranged_attack();}
				attacked = true;
			}
		}
	}
}