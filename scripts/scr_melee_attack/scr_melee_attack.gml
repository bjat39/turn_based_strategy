// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_melee_attack(){
	//with global.selected, we are controlling the object
	if (sprite_index != attack_anim)
	{
		if (global.enemy.x < x) {image_xscale = -1;}//make player face enemy
		sprite_index = attack_anim;
		image_index = 0.5;
	}
	if (image_index >= image_number-1) //animation ended
	{
		sprite_index = idle_anim;
		
		global.damage_dealt = irandom(attack); //remove rng
		global.enemy.health_points -= global.damage_dealt;
		instance_create_layer(global.enemy.x,global.enemy.y,"Instances",obj_damage_dealt);
		//create damage object
		if (global.enemy.health_points <= 0)
		{
			global.enemy.sprite_index = global.enemy.death_anim;
			global.enemy.image_index = 0;
		}
		
		global.attacking = false;
		image_xscale = 1;
		global.enemy = noone; //update current enemy, finish move
	}
}