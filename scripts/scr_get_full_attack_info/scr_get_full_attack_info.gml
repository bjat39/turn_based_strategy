// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_full_attack_info(attacker, defender){
	var attack = {
		attacker1: attacker,
		defender1: defender,
		attacker_name: attacker.actor_name,
		defender_name: defender.actor_name,
		attacker_weapon: attacker.equipped_weapon,
		defender_weapon: defender.equipped_weapon,
		attacker_hp: attacker.current_hit_points,
		defender_hp: defender.current_hit_points,
		attacker_advantage_mult: scr_get_weapon_advantage(attacker,defender),
		defender_advantage_mult: scr_get_weapon_advantage(defender,attacker),
		defender_in_range: scr_two_unit_attack_range(attacker,defender),
		attacker_damage: scr_calc_damage(attacker,defender),
		defender_damage: scr_calc_damage(defender,attacker),
		attacker_double: scr_get_double(attacker,defender),
		defender_double: scr_get_double(defender,attacker),
		attacker_hit: scr_calc_hit_rate(attacker,defender),
		defender_hit: scr_calc_hit_rate(defender,attacker),
		attacker_crit: scr_calc_crit(attacker),
		defender_crit: scr_calc_crit(defender),
	};
	
	attack.attack_rounds = scr_create_attack_sequence(attack)
	
	return attack;
}