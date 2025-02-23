// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_base_hit_rate(unit){
	var hit_rate = unit.equipped_weapon.hit + 
		(unit.skill_stat * 2) + (unit.luck_stat / 2);
	return hit_rate;
}