// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_attack_sequence(attack_data, attack_rounds){//just hardcode this bullshit
	attack_rounds[0] = scr_check_single_attack(
	attack_data.attacker_hit,attack_data.attacker_crit,
	attack_data.attacker_damage,attack_data.defender_hp);
	if (attack_rounds[0].attack_has_killed == true){return attack_rounds;}
	
	attack_rounds[1] = scr_check_single_attack(
	attack_data.defender_hit,attack_data.defender_crit,
	attack_data.defender_damage,attack_data.attacker_hp);
	if (attack_rounds[1].attack_has_killed == true){return attack_rounds;}
	
	if (attack_data.attacker_double == true)
	{
		attack_rounds[2] = scr_check_single_attack(
		attack_data.attacker_hit,attack_data.attacker_crit,
		attack_data.attacker_damage,attack_data.defender_hp);
		if (attack_rounds[2].attack_has_killed == true){return attack_rounds;}
	}
	else if (attack_data.defender_double == true)
	{
		attack_rounds[2] = scr_check_single_attack(
		attack_data.defender_hit,attack_data.defender_crit,
		attack_data.defender_damage,attack_data.attacker_hp);
		if (attack_rounds[2].attack_has_killed == true){return attack_rounds;}
	}
	return attack_rounds;
}