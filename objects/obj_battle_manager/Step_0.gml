/// @description 
switch(state)
{
case "initiator_begin_attack":
	//before attack animation
	attack_timer -= 1;
	if (attack_timer <= 0)
	{
		state = "attack";
	}
		
	break;
case "initiator_attack":
		scr_attack_enemy();
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
	with (initiator)
	{
		unit_state = "idle";
		finish = true;
	}
	break;
}


