/// @description 
if (image_index = -1)
{
	image_speed = 0;
}
if (death_weapon_type == "default")
{
		image_alpha = image_alpha - 0.05;//lerp(image_alpha, 0, 0.07);
		if image_alpha <= 0 
		{
			instance_destroy();
		}
}