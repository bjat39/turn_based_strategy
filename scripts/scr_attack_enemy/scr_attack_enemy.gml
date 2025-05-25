// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_enemy(attack_rounds,current_round){
	//switch(damage_type)
	//{
	//	case "bow":
	//if () //accuracy irandom_range(0,)
	//need to add distance score if attack node
	var attack = attack_rounds[current_round];
	var defender = attack.defender1;
	
	attack_status = "hit";
	//else
	//attack_status = "miss"
				
	temp_damage = 0;
				
	if (attack.attack_check.attack_has_hit)
	{
			temp_damage = attack.attacker_damage;
			if (temp_damage < 0){temp_damage = 0;}
	}
	else
	{
		attack_status = "miss";
	}
	
	target = defender;
	status = attack_status;
	damage = temp_damage;
	damage_type = defender.damage_type;
	
	if (status != "miss")
	{
		scr_play_sound(sfx_impact_flesh,3,0,obj_game.sfx_gain);
		target.current_hit_points -= damage;
		
		for(ii = 0; ii < 6; ii ++)
		{
			with(instance_create_layer(target.x + 16,target.y + 16,"Instances",obj_biff))
			{
				direction = irandom(360);
				speed = irandom_range(2,4);
				scale = choose(2,3);
				
				image_speed = .5;
				
				//if(other.status == "crit")
				//{
				//	colour = c_yellow;
				//}
			}
		}
	
		with(instance_create_layer(target.x + GRID_SIZE + 6,target.y + 2,"Instances",obj_damage_text))
		{
			text = string(other.damage);
			ground = defender.y;
		}
	
		//Screenshake
		//target.shake = 8;
		//target.shake_mag = 8;
		
		if (target.current_hit_points <= 0 and damage != 0) //kill
		{
			 //replace with specific instances, no pre_dying_Talk as well
			target.unit_state = "initiate_dying";
			//return "interrupt attack" or whatever, exit/return
		}
	}
	else
	{
		with(instance_create_layer(target.x + 28,target.y +2,"Instances",obj_damage_text))
		{
			text = "miss";
			
			ground = y;
		}
	}
}