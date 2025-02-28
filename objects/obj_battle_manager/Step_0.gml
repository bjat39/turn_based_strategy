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
	//if(defender.unit_state == "initiate_dying"){
		scr_play_sound(_69_Enemy_death_01,2,0,obj_game.sfx_gain);
		state = "defender_death";}
	
	break;
case "end_attack"://let scr attack handle this
	attack_timer -= 1;
		
	if(attack_timer <= 0)
	{
		current_round ++;
		if (array_length(attack_rounds) - 1 >= current_round)
		{
			state = "begin_attack";
		}
		else{
			state = "finish_battle";
		}
	}
	break;
case "defender_death":
	with(attack_data.defender1)
	{
		image_alpha = lerp(image_alpha, 0, 0.07);
		if image_alpha <= 0 
		{
			map[gridX,gridY].occupant = noone;
			other.state = "finish_battle";
			//initiate exp gain and level up for unit, if there is an opponent
			instance_destroy();
		}
	}
	
	break;
//case "defender_end_attack":
	
case "finish_battle":
	obj_cursor.x = attack_data.attacker1.x + GRID_SIZE/2;
	obj_cursor.y = attack_data.attacker1.y + GRID_SIZE/2;
	obj_game.player_state = "cursor_explore";
	obj_game.selected_actor = noone;
	attack_data.attacker1.unit_state = "finishing";
	instance_destroy();
	break;
}


