// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ranged_attack(){
	if (sprite_index == attack_anim)
	{
		if (image_index >= image_number - 1)
		{
			instance_create_layer(x+5,y,"Instances",my_projectile);
			sprite_index = idle_anim;
			image_index = 0;
		}
	}
	
	with (my_projectile)
	{
		image_angle = direction;
		move_towards_point(global.enemy.x, global.enemy.y, 15);
		
		if (instance_place(x,y,global.enemy))
		{
			global.damage_dealt = irandom(global.selected.attack);
			global.enemy.health_points -= global.damage_dealt;
			instance_create_layer(global.enemy.x,global.enemy.y,"Instances",obj_damage_dealt);
			if (global.enemy.health_points <= 0)
			{
				global.enemy.image_index = 0;
				global.enemy.sprite_index = global.enemy.death_anim;
			}
			global.attacking = false;
			global.selected.image_xscale = 1;
			global.enemy = noone;
			audio_play_sound(sfx_bow_impact3,4,0);
			instance_destroy();
		}
	}
	
}