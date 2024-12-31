/// @description 
switch(state)
{
case "initiator_begin_attack":
	//before attack animation
	attack_timer -= 1;
	if (attack_timer <= 0)
	{
		state = "initiator_attack";
	}
		
	break;
case "initiator_attack":
	scr_attack_enemy();
	state = "initiator_end_attack";	
	attack_timer = 30;
	if(reciever.unit_state == "initiate_dying"){
		scr_play_sound(_69_Enemy_death_01,2,0,obj_game.sfx_gain);
		state = "reciever_death";}
	
	break;
case "initiator_end_attack"://let scr attack handle this
	attack_timer -= 1;
		
	if(attack_timer <= 0)
	{
		state = "finish_battle";
		
	}
	

	break;
case "reciever_death":
	with(reciever)
	{
		image_alpha = lerp(image_alpha, 0, 0.07);
		if image_alpha <= 0 
		{
			map[gridX,gridY].occupant = noone;
			//initiate exp gain and level up for unit, if there is an opponent
			instance_destroy();
		}
	}
	state = "finish_battle";
	break;
//case "reciever_end_attack":
	
case "finish_battle":
	obj_cursor.x = initiator.x + GRID_SIZE/2;
	obj_cursor.y = initiator.y + GRID_SIZE/2;
	obj_game.player_state = "cursor_explore";
	obj_game.selected_actor = noone;
	initiator.unit_state = "finishing";
	instance_destroy();
	break;
}


