// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_calc_crit(unit){
	var crit2 = scr_get_base_crit(unit);
	crit2 = crit2 + unit.equipped_weapon.crit;
	if (crit2 < 0){crit2 = 0;}
	return crit2;
}