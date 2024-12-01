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
		break;
	//}
	//break;
case "initiator_end_attack"://let scr attack handle this
	attack_timer -= 1;
		
	if(attack_timer <= 0)
	{
		state = "finish_battle";
		
	}
	

	break;
case "finish_battle":
	obj_cursor.x = initiator.x + GRID_SIZE/2;
	obj_cursor.y = initiator.y + GRID_SIZE/2;
	obj_game.player_state = "cursor_explore";
	with (initiator)
	{
		unit_state = "finish";
	}
	instance_destroy();
	break;
}


