// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_calc_hit_rate(attacker, defender){
	var base_hit = scr_get_base_hit_rate(attacker)
	var base_avoid = scr_get_base_hit_rate(defender)
	var advantage_mult = scr_get_weapon_advantage(attacker,defender);
	var hit_rate;
	
	hit_rate = base_hit + (15 * advantage_mult) - base_avoid;
	return hit_rate;
}