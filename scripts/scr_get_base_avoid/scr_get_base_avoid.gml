// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_base_avoid(unit){
	var avoid = (unit.speed_stat * 2) + unit.luck_stat;
	return avoid;
}