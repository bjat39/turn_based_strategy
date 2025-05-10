// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_two_unit_attack_range(attacker,defender){
	if(attacker.damage_type == "bow") //BOWMAN CAN'T SHOOT TWO SPACES BEFORE HIM
	{
		x_dist = point_distance(attacker.x, attacker.y, defender.x, attacker.y); //would have measuring to the center but it dont
		y_dist = point_distance(attacker.x, attacker.y, attacker.x, defender.y);
		total_dist = x_dist + y_dist; //
		if (total_dist <= attacker.attack_range and total_dist > 1 * GRID_SIZE)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	else
	{
		x_dist = point_distance(attacker.x, attacker.y, defender.x, attacker.y); //would have measuring to the center but it dont
		y_dist = point_distance(attacker.x, attacker.y, attacker.x, defender.y);
		total_dist = x_dist + y_dist; //
		if (total_dist <= attacker.attack_range)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}