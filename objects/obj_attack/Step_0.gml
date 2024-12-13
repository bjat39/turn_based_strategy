/// @description 
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
	
		with(instance_create_layer(target.x + 28,target.y + 2,"Instances",obj_damage_text))
		{
			text = string(other.damage);
			ground = y;
		}
	
		//Screenshake
		target.shake = 8;
		target.shake_mag = 8;
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