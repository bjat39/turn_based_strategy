/// @description 
switch(state)
{
case "begin_attack":
	//before attack animation
	attack_timer -= 1;
	if (attack_timer <= 0)
	{
		state = "attack";
	}
		
	break;
case "attack":
	scr_attack_enemy(attack_rounds,current_round);
	state = "end_attack";	
	attack_timer = 30;
	//TEMP!!!
	if (attack_rounds[current_round].attack_check.attack_has_killed == true){
		scr_play_sound(_69_Enemy_death_01,2,0,obj_game.sfx_gain);
		attack_rounds[current_round].defender1.unit_state =
		"initiate_dying";
		kill_confirm = true;}
	
	break;
case "end_attack"://let scr attack handle this
	attack_timer -= 1;
		
	if(attack_timer <= 0)
	{
		current_round ++;
		if (array_length(attack_rounds) - 1 >= current_round and kill_confirm == false)
		{
			state = "begin_attack";
		}
		else{
			state = "finish_battle";
		}
	}
	break;
case "finish_battle":
	if (instance_exists(attack_data.attacker1))
	{
		obj_cursor.x = attack_data.attacker1.x + GRID_SIZE/2;
		obj_cursor.y = attack_data.attacker1.y + GRID_SIZE/2;
		attack_data.attacker1.unit_state = "finishing";
	}
	obj_game.player_state = "cursor_explore";
	obj_game.selected_actor = noone;
	instance_destroy();
	break;
}


