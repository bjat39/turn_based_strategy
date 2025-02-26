// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_single_attack(attacker_hit,attacker_crit,attacker_damage,defender_hp){
	//random number between 0 and 100, do 2RN eventually
	var attack_hit = (random_range(0,100) <= attacker_hit);
	var attack_crit = 0, death_check = 0;
	if (attack_hit == true)
	{
		attack_crit = (random_range(0,100) <= attacker_crit);
		death_check = ((attacker_damage * (attack_crit * 3)) > defender_hp);
	}
	
	var single_attack = {
		attack_has_hit: attack_hit,
		attack_has_crit: attack_crit,
		attack_has_killed: death_check,
	}
	return single_attack;
}