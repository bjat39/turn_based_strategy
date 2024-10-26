/// @description 
switch(state)
{
	case "begin_path":
		//begin moving along path
		path_start(movement_path,move_speed,0,true);
		
		state = "moving";
		break;
	case "moving":
		if (path_index = -1) //path ended
		{
			//clear path
			path_clear_points(movement_path);
			
			state = "idle";
			
			moved = true;
			if (!attacked)
			{
				//scr_attack_range(id);
			}
			//obj_game.selected_actor = id;
			//scr_movement_range(map[gridX,gridY],move,actions);
		}
		break;
	case "begin attack":
		//before attack animation
		attack_timer -= 1;
		if (attack_timer <= 0)
		{
			state = "attack";
		}
		
		break;
	case "attack":
		//switch(damage_type)
		//{
		//	case "bow":
			//if () //accuracy irandom_range(0,)
			//need to add distance score if attack node
			attack_status = "hit";
			//else
			//attack_status = "miss"
				
			temp_damage = 0;
				
			if (attack_status != "miss")
			{
					temp_damage = strength_stat - attack_target.defence_stat;
			}
				
			attack_dir = point_direction(x + 16, y + 16, attack_target.x + 16, attack_target.y + 16);
				
			begin_x = x + 16 + lengthdir_x(30, attack_dir); //starts 30 px in front
			begin_y = y + 16 + lengthdir_y(30, attack_dir);
				
			with(instance_create_layer(begin_x,begin_y,"Instances",obj_arrow1))//begin_x,begin_y,"Instances",obj_arrow))
			{
				target = other.attack_target;
				status = other.attack_status;
				damage = other.temp_damage;
				damage_type = other.damage_type;
					
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
				
			state = "end attack";
				
			attack_timer = 30;
				
			break;
		//}
		//break;
	case "end attack":
		attack_timer -= 1;
		
		if(attack_timer <= 0)
		{
			attacked = true;
			state = "idle";
		}
		break;
}