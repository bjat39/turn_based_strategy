// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_attack_info(attacker, defender){
	var attack = {
		attacker1: attacker,//split up?
		defender1: defender,
		attacker_name: attacker.actor_name,
		defender_name: defender.actor_name,
		attacker_weapon: attacker.equipped_weapon,
		defender_weapon: defender.equipped_weapon,
		attacker_hp: attacker.current_hit_points,
		defender_hp: defender.current_hit_points,
		defender_in_range: scr_two_unit_attack_range(attacker,defender),
	};
	if (attack.defender_in_range == true)
	{
		attack.attacker_double = scr_get_double(attacker,defender);
		attack.attacker_advantage_mult = scr_get_weapon_advantage(attacker,defender);
		attack.attacker_damage = scr_calc_damage(attacker,defender);
		attack.attacker_hit = scr_calc_hit_rate(attacker,defender);
		attack.attacker_crit = scr_calc_crit(attacker);
		
		attack.attack_check = scr_check_single_attack(
		attack.attacker_hit,attack.attacker_crit,
		attack.attacker_damage,attack.defender_hp);
	}
	else
	{
		attack.attacker_double = noone;
		attack.attacker_advantage_mult = noone;
		attack.attacker_damage = noone;
		attack.attacker_hit = noone;
		attack.attacker_crit = noone;
		
		attack.attack_check.attack_has_hit = noone;
		attack.attack_check.attack_has_crit = noone;
		attack.attack_check.attack_has_killed = noone;
	}

	//i am mentally stable
	
	return attack;
}