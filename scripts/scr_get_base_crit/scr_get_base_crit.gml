// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_base_crit(unit){
	var crit1 = (unit.skill_stat / 2) + unit.equipped_weapon.crit;
	return crit1;
}