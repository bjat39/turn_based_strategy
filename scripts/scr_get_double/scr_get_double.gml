// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_double(attacker,defender){
	if (attacker.speed_stat - 5 > defender.speed_stat)
	{
		return true;
	}
	else
	{
		return false;
	}
}