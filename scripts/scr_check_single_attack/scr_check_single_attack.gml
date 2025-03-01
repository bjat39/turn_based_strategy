// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_single_attack(attacker_hit,attacker_crit,attacker_damage,defender_hp){
	//random number between 0 and 100, do 2RN eventually
	var attack_has_hitted = (random_range(0,100) <= attacker_hit);
	var attack_has_critted = false;
	var attack_has_kill = false;
	
	var attack_crit_mult = 1;
	if (attack_has_hitted == true)
	{
		attack_has_critted = (random_range(0,100) <= attacker_crit);
		if (attack_has_critted == true){attack_crit_mult = 3}
		attack_has_kill = ((attacker_damage * attack_crit_mult) > defender_hp);
	}
	
	var single_attack = {
		attack_has_hit: attack_has_hitted,
		attack_has_crit: attack_has_critted,
		attack_has_killed: attack_has_kill,
	}
	return single_attack;
}