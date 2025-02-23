// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_calc(attacker, defender){
	switch (attacker.damage_type)
	{
		case ("magic"):
		
		break;
		case ()
	}
	var strength = attacker
    attacker : par_actor,
    defender : par_actor,
    weapon
    hit_rate;
    crit_rate;
    damage
	
	
	attacker
	
	attack_status = "hit";
	//else
	//attack_status = "miss"
				
	temp_damage = 0;
				
	if (attack_status != "miss")
	{
			temp_damage = initiator.strength_stat - reciever.defence_stat;
			if (temp_damage < 0){temp_damage = 0}
	}
				
	attack_dir = point_direction(x + 16, y + 16, reciever.x + 16, reciever.y + 16);
				
	begin_x = x + 16 + lengthdir_x(30, attack_dir); //starts 30 px in front
	begin_y = y + 16 + lengthdir_y(30, attack_dir);
				
	with(instance_create_layer(begin_x,begin_y,"Menu",obj_arrow1))//begin_x,begin_y,"Instances",obj_arrow))
	{
		target = other.reciever;
		status = other.attack_status;
		damage = other.temp_damage;
		damage_type = other.initiator.damage_type;
					
		speed = 24;
					
		path_add_point(movement_path,other.begin_x,other.begin_y,100);
					
		if (status != "miss")
		{
			path_add_point(movement_path,target.x + 16,target.y + 16,100);
		}
		else
		{
			path_add_point(movement_path,target.x + (irandom_range(30,50) * choose(1,-1)), target.y + (irandom_range(30,50) * choose(1,-1)), 100);
		}
					
		path_start(movement_path,speed,path_action_stop,true);
	}
}