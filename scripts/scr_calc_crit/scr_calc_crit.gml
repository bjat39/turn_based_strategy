// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_calc_crit(unit){
	var base_crit = scr_get_base_crit(unit);
	return base_crit + unit.equipped_weapon.crit;
}