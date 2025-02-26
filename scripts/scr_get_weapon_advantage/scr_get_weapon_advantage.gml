// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_weapon_advantage(attacker, defender){
	var advantage_multiplier; //return 1 or 0 or -1, times the value 
	switch (attacker.damage_type)
	{
		case ("magic"):
			switch(defender.damage_type)
			{
			case ("magic"):
			advantage_multiplier = 0;
			break;
			case ("bow"):
			advantage_multiplier = -1;
			break;
			case ("melee"):
			advantage_multiplier = 1;
			break;
			default:
			advantage_multiplier = 0;
			break;
			//case ("neutral"): //no weapon
			
			//break;
			}
		break;
		case ("bow"):
			switch(defender.damage_type)
			{
			case ("magic"):
			advantage_multiplier = 1;
			break;
			case ("bow"):
			advantage_multiplier = 0;
			break;
			case ("melee"):
			advantage_multiplier = -1;
			break;
			default:
			advantage_multiplier = 0;
			break;
			}
		break;
		case ("melee"):
			switch(defender.damage_type)
			{
			case ("magic"):
			advantage_multiplier = -1;
			break;
			case ("bow"):
			advantage_multiplier = 1;
			break;
			case ("melee"):
			advantage_multiplier = 0;
			break;
			default:
			advantage_multiplier = 0;
			break;
			}
		break;
	}
	return advantage_multiplier;
}