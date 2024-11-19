/// @description 
case "begin_attack":
	//before attack animation
	attack_timer -= 1;
	if (attack_timer <= 0)
	{
		unit_state = "attack";
	}
		
	break;
case "attack":
		scr_attack_enemy();
		break;
	//}
	//break;
case "end_attack"://let scr attack handle this
	attack_timer -= 1;
		
	if(attack_timer <= 0)
	{
		attacked = true;
		unit_state = "idle";
	}
	break;