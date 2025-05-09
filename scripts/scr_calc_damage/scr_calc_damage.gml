// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_calc_damage(attacker, defender){
	var base_damage = scr_get_base_damage(attacker)
	var advantage_mult = scr_get_weapon_advantage(attacker,defender);
	var terrain_def = map[defender.gridX,defender.gridY].terrain_defense;
	var damage;
	
	if (attacker.damage_type == "magic")
	{
		damage = (base_damage + advantage_mult) 
		- defender.resistance_stat - terrain_def;
	}
	else
	{
		damage = (base_damage + advantage_mult) 
		- defender.defence_stat - terrain_def;
	}
	
	if (damage < 0){damage = 0;}
	return damage;
}