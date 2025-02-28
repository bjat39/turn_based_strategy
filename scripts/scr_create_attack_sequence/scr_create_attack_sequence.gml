// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_attack_sequence(attacker,defender){//just hardcode this bullshit
	
	attack_rounds[0] = scr_get_attack_info(attacker,defender);
	if (attack_rounds[0].attack_check.attack_has_killed == true){return attack_rounds;}
	
	attack_rounds[1] = scr_get_attack_info(defender,attacker);
	if (attack_rounds[1].defender_in_range == true)
	{//return rounds if kill success
		if (attack_rounds[1].attack_check.attack_has_killed == true){return attack_rounds;}
	}
	else//get rid of if out of range
	{
		array_delete(attack_rounds,1,1);
	}
	
	if (attack_data.attacker_double == true)
	{
		attack_rounds[2] = scr_get_attack_info(attacker,defender);
		if (attack_rounds[2].attack_check.attack_has_killed == true){return attack_rounds;}
	}
	else if (attack_data.defender_double == true)
	{
		attack_rounds[2] = scr_get_attack_info(defender,attacker);
		if (attack_rounds[2].defender_in_range == true) //check if ignore attack
		{
			if (attack_rounds[2].attack_check.attack_has_killed == true){return attack_rounds;}
		}
		else
		{
			array_delete(attack_rounds,2,1);
		}
	}
	return attack_rounds;
}