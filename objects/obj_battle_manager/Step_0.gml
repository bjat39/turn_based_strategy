/// @description 
//switch(current_round)
//{
	
//}
switch(state)
{
case "attacker_begin_attack":
	//before attack animation
	attack_timer -= 1;
	if (attack_timer <= 0)
	{
		state = "attacker_attack";
	}
		
	break;
case "attacker_attack":
	scr_attack_enemy();
	state = "attacker_end_attack";	
	attack_timer = 30;
	//TEMP!!!
	if (defender.current_hit_points - (attacker.strength_stat - defender.defence_stat) <= 0){
	//if(defender.unit_state == "initiate_dying"){
		scr_play_sound(_69_Enemy_death_01,2,0,obj_game.sfx_gain);
		state = "defender_death";}
	
	break;
case "attacker_end_attack"://let scr attack handle this
	attack_timer -= 1;
		
	if(attack_timer <= 0)
	{
		state = "finish_battle";
		
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
	obj_cursor.x = attacker.x + GRID_SIZE/2;
	obj_cursor.y = attacker.y + GRID_SIZE/2;
	obj_game.player_state = "cursor_explore";
	obj_game.selected_actor = noone;
	attacker.unit_state = "finishing";
	instance_destroy();
	break;
}


