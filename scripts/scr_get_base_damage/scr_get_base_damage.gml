// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_base_damage(unit){
	var damage;
	if (unit.damage_type == "magic")
	{
		damage = unit.magic_stat + unit.equipped_weapon.might;
	}
	else
	{
		damage = unit.strength_stat + unit.equipped_weapon.might;
	}
	return damage;
}