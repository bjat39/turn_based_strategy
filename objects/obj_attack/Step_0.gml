/// @description Should be handled by obj_battle manager
if (path_index = -1) //path ended
{
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
			ground = y;
		}
	
		//Screenshake
		target.shake = 8;
		target.shake_mag = 8;
		
		if (target.current_hit_points <= 0 and damage != 0) //kill
		{
			if (target.faction == "neft"){target.unit_state = "pre_dying_talk";}
			else{target.unit_state = "initiate_dying";}
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
	instance_destroy();
}