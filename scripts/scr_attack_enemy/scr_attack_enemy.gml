// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_enemy(attack_rounds,current_round){
	//switch(damage_type)
	//{
	//	case "bow":
	//if () //accuracy irandom_range(0,)
	//need to add distance score if attack node
	var attack = attack_rounds[current_round];
	
	attack_status = "hit";
	//else
	//attack_status = "miss"
				
	temp_damage = 0;
				
	if (attack.attack_has_hit)
	{
			temp_damage = attack.attacker_damage;
			if (temp_damage < 0){temp_damage = 0;}
	}
				
	attack_dir = point_direction(x + 16, y + 16, defender.x + 16, defender.y + 16);
				
	begin_x = x + 16 + lengthdir_x(30, attack_dir); //starts 30 px in front
	begin_y = y + 16 + lengthdir_y(30, attack_dir);
				
	with(instance_create_layer(begin_x,begin_y,"Menu",obj_arrow1))//begin_x,begin_y,"Instances",obj_arrow))
	{
		target = defender;
		status = other.attack_status;
		damage = other.temp_damage;
		damage_type = attacker.damage_type;
					
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